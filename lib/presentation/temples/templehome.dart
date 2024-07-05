
import 'dart:convert';
import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puri/app/generalFunction.dart';
import 'package:puri/presentation/temples/templeGoogleMap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/loader_helper.dart';
import '../../app/navigationUtils.dart';
import '../../model/templelistModel.dart';
import '../../provider/todo_provider.dart';
import '../../services/templelistRepo.dart';
import '../fullscreen/imageDisplay.dart';
import '../resources/app_colors.dart';
import 'package:provider/provider.dart';

class TemplesHome extends StatefulWidget {

  const TemplesHome({super.key});

  @override
  State<TemplesHome> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<TemplesHome> with WidgetsBindingObserver {
  // final todos;
  dynamic? lat,long;
  double? fLatitude;
  double? fLongitude;
  var image;
  bool isLoading = true;
  List<TempleListModel>? templeListResponse;
  bool _isLocationPermanentlyDenied = false;
  bool _toastDisplayed = false;

  Future<void> fetchTempleList(double lat2, double long2,) async {
    print('---40---$lat2');
    print('---41---$long2');
    TempleListRepo templeListRepo = TempleListRepo();
    List<TempleListModel>? templeList = await templeListRepo.getTempleList(context,lat2,long2);
    if (templeList != null) {
      // Iterate through the list and print specific fields
      for (var temple in templeList) {
        print('Temple Name: ${temple.sTempleName}');
        print('Location: ${temple.sLocation}');
        print('Image URL: ${temple.sImage}');
        print('Distance: ${temple.sDistance}');
        print('------------------');
      }
      setState(() {
        templeListResponse = templeList;
        isLoading = false;
      });
    } else {
      print('Error: Failed to fetch temple list');
      // Optionally, show a message to the user or retry fetching data
    }
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      hideLoader();
      displayToast('Location services are disabled.');
      await Geolocator.openLocationSettings();
      return;
    }
    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        hideLoader();
        displayToast('Location permissions are denied');
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      hideLoader(); // Ensure the loader is hidden immediately

      setState(() {
        _isLocationPermanentlyDenied = true;
      });
      // Save _isLocationPermanentlyDenied state
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLocationPermanentlyDenied', _isLocationPermanentlyDenied);
      // Check if toast has been displayed before showing it again
      if (!_toastDisplayed) {
        displayToast("Location permissions are permanently denied.");
        _toastDisplayed = true; // Mark toast as displayed
      }
      return;
    }
    // Get the current location
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    // Handle location data
    if (lat != null && long != null) {
      // Call your API or perform other location-dependent actions
     setState(() {
       print('----113---$lat');
       print('----114---$long');
       fetchTempleList(lat, long);
     });
    } else {
      displayToast('Failed to retrieve location');
    }
    hideLoader(); // Ensure the loader is hidden after processing
  }

  @override
  void initState() {
    // TODO: implement initState
    print('lat-----xxxxxxxxxxxxxx-----243---$_isLocationPermanentlyDenied');
    WidgetsBinding.instance.addObserver(this);
    _getLocation();
    super.initState();
    // getLocation();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TempleProvider>(context, listen: false).getAllTodos();
    });
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
     BackButtonInterceptor.remove(myInterceptor);
     WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Call your API or get location when the app resumes
     // getLocation();
      _getLocation();
    }
  }
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    NavigationUtils.onWillPop(context);
    return true;
  }
  // GeneralFunction? generalFunction;
  GeneralFunction generalFunction = GeneralFunction();

  void _navigateToMap(BuildContext context, double? fLatitude, double? fLongitude, String locationName, String sLocationAddress) {
    if (fLatitude != null && fLongitude != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TempleGoogleMap(
            fLatitude: fLatitude,
            fLongitude: fLongitude,
            locationName: locationName,
            sLocationAddress: sLocationAddress,
          ),
        ),
      );
    } else {
      print("Latitude or Longitude is null");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: getAppBar("Temples"),
          drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
        body:
        _isLocationPermanentlyDenied
            ? Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: Text("Location permissions are permanently denied. You should reinstall the application or clear the application's storage on your phone."),
            )
            :
            ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height-150,
                  child: ListView.builder(
                    itemCount: templeListResponse?.length ?? 0,
                    itemBuilder: (BuildContext context, int index)
                    {
                      // take an index

                      TempleListModel temple = templeListResponse![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            //color: Colors.red,
                            border: Border.all(
                              color: Colors.orange, // Set the golden border color
                              width: 1.0, // Set the width of the border
                            ),
                          ),
                          child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: GestureDetector(
                                    onTap: (){
                                      print('---click images---');
                                      image = temple.sImage;
                                      print('---Images----160---$image');

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FullScreenImages(image: image),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child:ClipRRect(
                                        borderRadius: BorderRadius.circular(5.0),
                                        child: Transform.rotate(
                                          angle: 11, // Angle in radians. For example, 0.5 radians is approximately 28.6 degrees.
                                          child: Image.network(
                                            temple.sImage,
                                            height: 60,
                                            width: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8),
                                              child: Text(temple.sTempleName,
                                                  style: GoogleFonts.openSans(
                                                    color: AppColors.green,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text('Distance :',
                                                    style: GoogleFonts.openSans(
                                                      color: AppColors.green,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FontStyle.normal,
                                                    )
                                                ),
                                                SizedBox(width: 5), // Add some space between the text widgets
                                                Text(temple.sDistance,
                                                    style: GoogleFonts.openSans(
                                                      color: AppColors.red,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FontStyle.normal,
                                                    )
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      fLatitude;
                                      fLongitude;
                                      // sLocation
                                      if (temple.fLatitude is String) {
                                        //fLatitude = double.parse(templeListResponse![index]['fLatitude']);
                                       // fLatitude = double.parse(temple.fLatitude);
                                      } else {
                                        fLatitude = temple.fLatitude;
                                      }

                                      if (temple.fLongitude is String) {
                                       // fLongitude = double.parse(templeListResponse![index]['fLongitude']);
                                      } else {
                                        fLongitude = temple.fLongitude;
                                      }
                                      var locationName = temple.sTempleName;
                                      var sLocationAddress = temple.sDistance;
                                      print('-----336---fLatitude--$fLatitude');
                                      print('-----337---fLongitude--$fLongitude');
                                      print('-----338---locationName--$locationName');
                                      print('-----338---sLocation--$sLocationAddress');

                                      _navigateToMap(context, fLatitude, fLongitude, locationName, sLocationAddress);

                                    });

                                    },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Image.asset('assets/images/direction.jpeg',
                                          height: 25,
                                          width: 25,
                                          fit: BoxFit.fill,
                                        )

                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Image.asset(
                                          "assets/images/listelementtop.png",
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                      SizedBox(height: 35),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          "assets/images/listelementbottom.png",
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                    },
                  ),
                ),
              ),
            ]
        ),
    );
  }
  }
class NoDataScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No data found'),
    );
  }
}
