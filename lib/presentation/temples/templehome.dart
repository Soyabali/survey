
import 'dart:convert';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:puri/app/generalFunction.dart';
import 'package:puri/presentation/temples/templedetail.dart';
import '../../app/navigationUtils.dart';
import '../../provider/todo_provider.dart';
import '../../services/templelistRepo.dart';
import '../fullscreen/imageDisplay.dart';
import '../nodatavalue/NoDataValue.dart';
import '../resources/app_text_style.dart';
import '../resources/assets_manager.dart';
import 'package:provider/provider.dart';

class TemplesHome extends StatefulWidget {
  const TemplesHome({super.key});

  @override
  State<TemplesHome> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<TemplesHome> {
  // final todos;
  double? lat,long;
  double? fLatitude;
  double? fLongitude;
  List<Map<String, dynamic>>? templeListResponse;


  getTempleListResponse() async {
    templeListResponse = await TempleListRepo().getTempleList(context,lat,long);
    print('------36----$templeListResponse');
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    getTempleListResponse();


    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TempleProvider>(context, listen: false).getAllTodos();
    });
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
     BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    NavigationUtils.onWillPop(context);
    return true;
  }

  // GeneralFunction? generalFunction;
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {
      'image':
          'https://www.drishtiias.com/images/uploads/1698053713_image1.png',
      'temple': 'Jagannath Temple'
    },
    {
      'image':
          'https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-hinohp2v89f6sovfrqk7d6bfj7-20231002122234.Medi.jpeg',
      'temple': 'PanchaTirtha'
    },
    {
      'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
      'temple': 'Lokanath Temple'
    },
    {
      'image':
          'https://t4.ftcdn.net/jpg/03/57/53/11/360_F_357531159_cumH01clbXOo32Ytvkb7qGYspCJjj4gB.jpg',
      'temple': 'Vimala Temple'
    },
    {
      'image':
          'https://w0.peakpx.com/wallpaper/672/441/HD-wallpaper-puri-jagannath-temple-cloud.jpg',
      'temple': 'Varahi Temple'
    },
    {
      'image':
          'https://www.drishtiias.com/images/uploads/1698053713_image1.png',
      'temple': 'Jagannath Temple'
    },
    {
      'image':
          'https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-hinohp2v89f6sovfrqk7d6bfj7-20231002122234.Medi.jpeg',
      'temple': 'PanchaTirtha'
    },
    {
      'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
      'temple': 'Lokanath Temple'
    },
    {
      'image':
          'https://t4.ftcdn.net/jpg/03/57/53/11/360_F_357531159_cumH01clbXOo32Ytvkb7qGYspCJjj4gB.jpg',
      'temple': 'Vimala Temple'
    },
    {
      'image':
          'https://w0.peakpx.com/wallpaper/672/441/HD-wallpaper-puri-jagannath-temple-cloud.jpg',
      'temple': 'Varahi Temple'
    },
  ];

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    debugPrint("-------------Position-----------------");
    debugPrint(position.latitude.toString());

    lat = position.latitude;
    long = position.longitude;
    print('-----------138----$lat');
    print('-----------139----$long');
    // setState(() {
    // });
    debugPrint("Latitude: ----142--- $lat and Longitude: $long");
    debugPrint(position.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: getAppBar("Temples"),
          drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
        body:
        templeListResponse == null
            ? NoDataScreenPage()
            :
        Column(
              children: [
                Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageAssets.templepuri4),
                            // Provide the path to your image asset
                            fit: BoxFit.cover, // Adjust how the image fits into the container
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 50,
                        left: 20,
                        child: Image.asset(ImageAssets.cityname, height: 100)),
                    Positioned(
                        top: 75,
                        left: 40,
                        child: Text("TEMPLES",
                            style: AppTextStyle
                                .font30penSansExtraboldWhiteTextStyle))
                  ],
                ),
                SizedBox(height: 5),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: ListView.builder(
                                 itemCount: templeListResponse?.length ?? 0,
                                 itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.orange,
                                    // Set the golden border color
                                    width: 1.0, // Set the width of the border
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: InkWell(
                                          onTap: () {
                                            var image = '${templeListResponse![index]['sImage']}';

                                            print('--Images--$image');
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => FullScreenImages(image: image),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 75,
                                            width: 75,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.network(
                                                '${templeListResponse![index]['sImage']}',
                                                height: 56,
                                                width: 56,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 56,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 0),
                                            child: ListTile(
                                              title: Text(
                                                '${templeListResponse![index]['sTempleName']}',
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                              ),
                                             trailing: InkWell(
                                                onTap: (){
                                                  fLatitude;
                                                  fLongitude;

                                                  if (templeListResponse![index]['fLatitude'] is String) {
                                                    fLatitude = double.parse(templeListResponse![index]['fLatitude']);
                                                  } else {
                                                    fLatitude = templeListResponse![index]['fLatitude'];
                                                  }

                                                  if (templeListResponse![index]['fLongitude'] is String) {
                                                    fLongitude = double.parse(templeListResponse![index]['fLongitude']);
                                                  } else {
                                                    fLongitude = templeListResponse![index]['fLongitude'];
                                                  }
                                                  launchGoogleMaps(fLatitude!, fLongitude!);
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

                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
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
                          }),
                        ),
                      ),
                    ),
              ],
    )
    )
  ;
  }
  }
