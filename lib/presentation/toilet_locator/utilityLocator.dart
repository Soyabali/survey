import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puri/app/generalFunction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/getNearByPlaceListRepo.dart';
import '../../app/loader_helper.dart';
import '../../services/toiletListRepo.dart';
import '../fullscreen/imageDisplay.dart';
import '../nodatavalue/NoDataValue.dart';
import '../resources/app_colors.dart';
import '../temples/cookie_detail.dart';
import '../temples/templeGoogleMap.dart';



class UtilityLocator extends StatefulWidget {

  UtilityLocator({super.key});

  @override
  State<UtilityLocator> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<UtilityLocator> {
  //double? lat,long;
  //dynamic? lat,long;
  double? lat,long;
  double? fLatitude;
  double? fLongitude;
  var image;
  bool isLoading = true;
  GeneralFunction generalFunction = GeneralFunction();

  List<Map<String, dynamic>>? utilityLocator;


  getlocator(double lat, double long) async {
    utilityLocator = await ToiletListRepo().getbyToilet(context,lat,long);
    print('------36----$utilityLocator');
    setState(() {
      // utilityLocator=[];
      isLoading = false;
    });
  }
  // void getLocation() async {
  //   showLoader();
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     hideLoader();
  //     return Future.error('Location services are disabled.');
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     hideLoader();
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     hideLoader();
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   debugPrint("-------------Position-----------------");
  //   debugPrint(position.latitude.toString());
  //   lat = position.latitude;
  //   long = position.longitude;
  //   print('-----------7----$lat');
  //   print('-----------76----$long');
  //
  //   if (lat != null && long != null) {
  //     hideLoader();
  //     getlocator(lat!, long!);
  //   }
  //   // setState(() {
  //   // });
  //   debugPrint("Latitude: ----142--- $lat and Longitude: $long");
  //   debugPrint(position.toString());
  // }

  final List<Map<String, String>> itemList = [
    {'hotel': 'https://img.directhotels.com/in/puri/pipul-hotels-and-resorts/1.jpg','hotelName': 'La Platina Premium Suites'},
    {'hotel': 'https://pix10.agoda.net/hotelImages/111023/0/2b6a5105eb42667cf2f7e94626246798.jpeg?s=414x232','hotelName': 'Hotel Shakti International'},
    {'hotel': 'https://r2imghtlak.ibcdn.com/r2-mmt-htl-image/htl-imgs/202312061230018069-c842d3e9-97b0-40d1-b33a-aba4afa111a9.jpg?downsize=634:357','hotelName': 'Regenta Central'},
    {'hotel': 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/349221608.jpg?k=b945f104ca614fd5d9d289ac72ff8c4aa598252b3c131da702eb5e20ec61be9c&o=&hp=1','hotelName': 'The Hans Coco Palms'},
    {'hotel': 'https://images.hichee.com/eyJidWNrZXQiOiJoYy1pbWFnZXMtcHJvZCIsImVkaXRzIjp7InJlc2l6ZSI6eyJoZWlnaHQiOjMzMCwid2lkdGgiOjc2N30sInRvRm9ybWF0Ijoid2VicCJ9LCJrZXkiOiJodHRwczovL3QtY2YuYnN0YXRpYy5jb20veGRhdGEvaW1hZ2VzL2hvdGVsL21heDEwMjR4NzY4LzQxNTYyNDI2Ny5qcGc/az1mYjY1OWIzMmI2N2E1Yjc5M2EzOTgzMWE0NDI4NWFjNjNkYmYyYTAwOGViOTk1YzhjNWY5Njg1OWZhYTY2MzZlJm89In0=?signature=4ec1e65339ba4ca027841a2cf17509b0aabd3c085323c8cd69c2cd4c60483979','hotelName': 'The Yellow Hotel'},
    {'hotel': 'https://img.directhotels.com/in/puri/pipul-hotels-and-resorts/1.jpg','hotelName': 'La Platina Premium Suites'},
    {'hotel': 'https://pix10.agoda.net/hotelImages/111023/0/2b6a5105eb42667cf2f7e94626246798.jpeg?s=414x232','hotelName': 'Hotel Shakti International'},
    {'hotel': 'https://r2imghtlak.ibcdn.com/r2-mmt-htl-image/htl-imgs/202312061230018069-c842d3e9-97b0-40d1-b33a-aba4afa111a9.jpg?downsize=634:357','hotelName': 'Regenta Central'},
    {'hotel': 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/349221608.jpg?k=b945f104ca614fd5d9d289ac72ff8c4aa598252b3c131da702eb5e20ec61be9c&o=&hp=1','hotelName': 'The Hans Coco Palms'},
    {'hotel': 'https://images.hichee.com/eyJidWNrZXQiOiJoYy1pbWFnZXMtcHJvZCIsImVkaXRzIjp7InJlc2l6ZSI6eyJoZWlnaHQiOjMzMCwid2lkdGgiOjc2N30sInRvRm9ybWF0Ijoid2VicCJ9LCJrZXkiOiJodHRwczovL3QtY2YuYnN0YXRpYy5jb20veGRhdGEvaW1hZ2VzL2hvdGVsL21heDEwMjR4NzY4LzQxNTYyNDI2Ny5qcGc/az1mYjY1OWIzMmI2N2E1Yjc5M2EzOTgzMWE0NDI4NWFjNjNkYmYyYTAwOGViOTk1YzhjNWY5Njg1OWZhYTY2MzZlJm89In0=?signature=4ec1e65339ba4ca027841a2cf17509b0aabd3c085323c8cd69c2cd4c60483979','hotelName': 'The Yellow Hotel'},
  ];
  // get a current location


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
      // Handle the case where either fLatitude or fLongitude is null
      // For example, show an error message or use default values
      print("Latitude or Longitude is null");
    }
  }

  @override
  void initState() {
   // getLocation();
    getlatAndLong();
    super.initState();
  }
  getlatAndLong()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     lat = prefs.getDouble('lat');
     long = prefs.getDouble('long');
      getlocator(lat!, long!);
    print('---110---lat---$lat');
    print('---111---long---$long');
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
     // appBar: getAppBarBack(context,'Utility Locator'),
      appBar: getAppBarBack(context,'Utility Locator'),
      drawer: generalFunction.drawerFunction(context,'Suaib Ali','9871950881'),
      body:
      isLoading
          ? Center(child:
      Container())
          : (utilityLocator == null || utilityLocator!.isEmpty)
          ? NoDataScreenPage()
          :
      ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
              child: Container(
                height: MediaQuery.of(context).size.height-150,
                child: ListView.builder(
                  itemCount: utilityLocator?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
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
                        child: InkWell(
                          onTap: (){
                             image = '${utilityLocator![index]['sImage']}';
                            print('-----129--$image');

                            fLatitude;
                             fLongitude;

                            if (utilityLocator![index]['fLatitude'] is String) {
                              fLatitude = double.parse(utilityLocator![index]['fLatitude']);
                            } else {
                              fLatitude = utilityLocator![index]['fLatitude'];
                            }

                            if (utilityLocator![index]['fLongitude'] is String) {
                              fLongitude = double.parse(utilityLocator![index]['fLongitude']);
                            } else {
                              fLongitude = utilityLocator![index]['fLongitude'];
                            }
                            print('-----165---fLatitude--$fLatitude');
                            print('-----166---fLongitude--$fLongitude');
                            /// todo to open gooogle map

                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: GestureDetector(
                                  onTap: (){
                                    print('---click images---');
                                    image = '${utilityLocator![index]['sImage']}';
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Transform.rotate(
                                        angle: 11, // Angle in radians. For example, 0.5 radians is approximately 28.6 degrees.
                                        child: Image.network(
                                          '${utilityLocator![index]['sImage']}',
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
                                            child: Text('${utilityLocator![index]['sToiletName']}',
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
                                              Text('${utilityLocator![index]['sDistance']}',
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
                                    if (utilityLocator![index]['fLatitude'] is String) {
                                      fLatitude = double.parse(utilityLocator![index]['fLatitude']);
                                    } else {
                                      fLatitude = utilityLocator![index]['fLatitude'];
                                    }

                                    if (utilityLocator![index]['fLongitude'] is String) {
                                      fLongitude = double.parse(utilityLocator![index]['fLongitude']);
                                    } else {
                                      fLongitude = utilityLocator![index]['fLongitude'];
                                    }
                                    var locationName = '${utilityLocator![index]['sToiletName']}';
                                    var sLocationAddress = '${utilityLocator![index]['sDistance']}';
                                    print('-----336---fLatitude--$fLatitude');
                                    print('-----337---fLongitude--$fLongitude');
                                    print('-----338---locationName--$locationName');
                                    print('-----338---sLocation--$sLocationAddress');
                                    _navigateToMap(context, fLatitude, fLongitude, locationName, sLocationAddress);

                                  });
                                  /// TODO IN A FUTURE IT MAY BE NEED
                                  ///
                                  // fLatitude;
                                  // fLongitude;
                                  //
                                  // if (utilityLocator![index]['fLatitude'] is String) {
                                  //   fLatitude = double.parse(utilityLocator![index]['fLatitude']);
                                  // } else {
                                  //   fLatitude = utilityLocator![index]['fLatitude'];
                                  // }
                                  //
                                  // if (utilityLocator![index]['fLongitude'] is String) {
                                  //   fLongitude = double.parse(utilityLocator![index]['fLongitude']);
                                  // } else {
                                  //   fLongitude = utilityLocator![index]['fLongitude'];
                                  // }
                                  //print('-----165---fLatitude--$fLatitude');
                                  //print('-----166---fLongitude--$fLongitude');
                                  //launchGoogleMaps(fLatitude!, fLongitude!);
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
