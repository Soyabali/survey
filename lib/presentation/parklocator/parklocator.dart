import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puri/presentation/parklocator/parkImageDetail.dart';
import 'package:puri/presentation/parklocator/parkMap.dart';
import '../../app/generalFunction.dart';
import '../../app/loader_helper.dart';
import '../../services/getParkListRepo.dart';
import '../fullscreen/imageDisplay.dart';
import '../nodatavalue/NoDataValue.dart';
import '../resources/app_colors.dart';
import '../resources/app_text_style.dart';


class ParkLocator extends StatefulWidget {
  final name;

  ParkLocator({super.key, this.name});

  @override
  State<ParkLocator> createState() => _KnowYourWardState();
}

class _KnowYourWardState extends State<ParkLocator> {
  dynamic? lat,long;
  double? fLatitude;
  double? fLongitude;
  final List<Map<String, String>> itemList = [
    {
      'image':
          'https://www.drishtiias.com/images/uploads/1698053713_image1.png',
      'temple': 'Fire Helpline'
    },
    {
      'image':
          'https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-hinohp2v89f6sovfrqk7d6bfj7-20231002122234.Medi.jpeg',
      'temple': 'Control Room'
    },
    {
      'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
      'temple': 'Shri Debendra Kumar Swin'
    },
    {
      'image':
          'https://t4.ftcdn.net/jpg/03/57/53/11/360_F_357531159_cumH01clbXOo32Ytvkb7qGYspCJjj4gB.jpg',
      'temple': 'Dy. Fire Officr'
    },
    {
      'image':
          'https://w0.peakpx.com/wallpaper/672/441/HD-wallpaper-puri-jagannath-temple-cloud.jpg',
      'temple': 'Shri Parthasarathi Sahoo'
    },
  ];
  GeneralFunction generalFunction = new GeneralFunction();
  List<Map<String, dynamic>>? parkList;

  getParkList(double lat, double long) async {
    parkList = await ParkListRepo().getParkList(context,lat,long);
    print('------58----$parkList');
    setState(() {
    });
  }

  // getlocator(double lat, double long) async {
  //   utilityLocator = await ToiletListRepo().getbyToilet(context,lat,long);
  //   print('------36----$utilityLocator');
  //   setState(() {
  //   });
  // }



  void getLocation() async {
    showLoader();
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      hideLoader();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      hideLoader();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        hideLoader();
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      hideLoader();
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
    print('-----------7----$lat');
    print('-----------76----$long');

    if (lat != null && long != null) {
      getParkList(lat!, long!);
      hideLoader();
    }
    // setState(() {
    // });
    debugPrint("Latitude: ----142--- $lat and Longitude: $long");
    debugPrint(position.toString());
    hideLoader();
  }

  @override
  void initState() {
    print('-----27--${widget.name}');
    getLocation();
    super.initState();
    //BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBarBack(context, 'Park Locator'),
        drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),

        body:
        parkList == null
            ? NoDataScreenPage()
            :
        Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: parkList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8,left: 4,right: 4,bottom: 2),
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Colors.red,
                          border: Border.all(
                            color: Colors.orange,
                            // Set the golden border color
                            width: 1.0, // Set the width of the border
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            var images =  '${parkList![index]['sPhoto']}';
                            fLatitude;
                            fLongitude;

                            if (parkList![index]['fLat'] is String) {
                              fLatitude = double.parse(parkList![index]['fLatitude']);
                            } else {
                              fLatitude = parkList![index]['fLat'];
                            }

                            if (parkList![index]['fLon'] is String) {
                              fLongitude = double.parse(parkList![index]['fLon']);
                            } else {
                              fLongitude = parkList![index]['fLon'];
                            }
                            print('-----165---fLatitude--$fLatitude');
                            print('-----166---fLongitude--$fLongitude');
                          },
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  var image =  '${parkList![index]['sPhoto']}';
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FullScreenImages(image: image),
                                    ),
                                  );
                                  },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.network(
                                          '${parkList![index]['sPhoto']}',
                                          height: 90,
                                          width: 90,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 115,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 14),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10,top: 12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${parkList![index]['sParkName']}',
                                              style: GoogleFonts.openSans(
                                                color: AppColors.green,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                              ),
                                            softWrap: true, // Wrap text to the next line
                                            overflow: TextOverflow.ellipsis, // Display ellipsis (...) at the end if text overflows
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 2),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Text('Ward No :',
                                                  style: AppTextStyle
                                                      .font14penSansExtraboldRedTextStyle),
                                              SizedBox(width: 5),
                                              Text('${parkList![index]['sWardCode']}',
                                                  style: AppTextStyle
                                                      .font14penSansExtraboldBlack45TextStyle),
                                            ],
                                          ),
                                          // Text('Ward No -3',
                                          //     style: AppTextStyle
                                          //         .font12penSansExtraboldRedTextStyle),
                                          SizedBox(height: 0),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Text('Distance :',
                                                  style: AppTextStyle
                                                      .font12penSansExtraboldRedTextStyle),
                                              SizedBox(width: 5),
                                              Text('${parkList![index]['sDistance']}',
                                                  style: AppTextStyle
                                                      .font12penSansExtraboldBlack45TextStyle),
                                              SizedBox(width: 5),
                                              InkWell(
                                                onTap: (){
                                                  fLatitude;
                                                  fLongitude;

                                                  if (parkList![index]['fLat'] is String) {
                                                    fLatitude = double.parse(parkList![index]['fLatitude']);
                                                  } else {
                                                    fLatitude = parkList![index]['fLat'];
                                                  }
                                                  if (parkList![index]['fLon'] is String) {
                                                    fLongitude = double.parse(parkList![index]['fLon']);
                                                  } else {
                                                    fLongitude = parkList![index]['fLon'];
                                                  }
                                                  print('-----165---fLatitude--$fLatitude');
                                                  print('-----166---fLongitude--$fLongitude');

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
                                              // InkWell(
                                              //   onTap: () {
                                              //     print('---Map--');
                                              //     Navigator.push(
                                              //       context,
                                              //       MaterialPageRoute(builder: (context) => ParkMap()),
                                              //     );
                                              //   },
                                              //   child: Padding(
                                              //     padding: EdgeInsets.only(bottom: 5),
                                              //     child:  Image.asset(
                                              //       'assets/images/map2.png', // Replace with your actual path
                                              //       width: 18, // Adjust as needed
                                              //       height: 18, // Adjust as needed
                                              //       fit: BoxFit.fill, // Adjust as needed
                                              //     ),
                                              //     // child: Icon(Icons.location_on,
                                              //     //     size: 25,
                                              //     //     color: Colors.red),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          // SizedBox(height: 2),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //   MainAxisAlignment.start,
                                          //   children: [
                                          //     Text('Address :',
                                          //         style: AppTextStyle
                                          //             .font14penSansExtraboldRedTextStyle),
                                          //     SizedBox(width: 5),
                                          //     Text('Cda  Sec 11',
                                          //         style: AppTextStyle
                                          //             .font14penSansExtraboldBlack45TextStyle),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
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
                    ),

                    // child: ListView(
                    //     children: [
                    //       middleHeader(context, '${widget.name}'),
                    //
                    //       Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(4.0),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         //color: Colors.red,
                    //         border: Border.all(
                    //           color: Colors.orange, // Set the golden border color
                    //           width: 1.0, // Set the width of the border
                    //         ),
                    //       ),
                    //       child: InkWell(
                    //         onTap: (){
                    //           },
                    //         child: Row(
                    //           children: [
                    //             InkWell(
                    //               onTap: (){
                    //
                    //               },
                    //               child: Padding(
                    //                 padding: const EdgeInsets.only(left: 5),
                    //                 child: Container(
                    //                   height: 90,
                    //                   width: 90,
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(5),
                    //                   ),
                    //                   child: ClipRRect(
                    //                       borderRadius: BorderRadius.circular(5.0),
                    //                       child: Image.network('https://www.drishtiias.com/images/uploads/1698053713_image1.png',height: 90,width: 90, fit: BoxFit.cover,)),
                    //
                    //                 ),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               child: Container(
                    //                 height: 115,
                    //                 child: Padding(
                    //                   padding: EdgeInsets.only(top: 20),
                    //                   child: Padding(
                    //                     padding: EdgeInsets.only(left: 10),
                    //                     child: Column(
                    //                       mainAxisAlignment: MainAxisAlignment.start,
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                       children: [
                    //                         Text('Ranjit Mohanty Park',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                    //                         SizedBox(height: 5),
                    //                         Text('Ward No -3',style: AppTextStyle.font12penSansExtraboldRedTextStyle),
                    //                         Row(
                    //                           mainAxisAlignment: MainAxisAlignment.start,
                    //                           children: [
                    //                             Text('Address :',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                    //                             SizedBox(width: 5),
                    //                             Text('Cda  Sec 11',
                    //                                 style:AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                    //                           ],
                    //                         ),
                    //                         SizedBox(height: 5),
                    //                         Row(
                    //                           mainAxisAlignment: MainAxisAlignment.start,
                    //                           children: [
                    //                             Text('Distance :',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                    //                             SizedBox(width: 5),
                    //                             Text('5 km',
                    //                                 style:AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                    //                             SizedBox(width: 50),
                    //                             InkWell(
                    //                               onTap: (){
                    //
                    //                               },
                    //                               child: const Padding(
                    //                                 padding: EdgeInsets.all(0),
                    //                                 child: Icon(Icons.location_on,size: 25,color: Colors.red),
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.only(right: 5),
                    //               child: Column(
                    //                 mainAxisAlignment: MainAxisAlignment.end,
                    //                 crossAxisAlignment: CrossAxisAlignment.end,
                    //                 children: [
                    //                   Align(
                    //                     alignment: Alignment.topRight,
                    //                     child: Image.asset(
                    //                       "assets/images/listelementtop.png",
                    //                       height: 25,
                    //                       width: 25,
                    //                     ),
                    //                   ),
                    //                   SizedBox(height: 35),
                    //                   Align(
                    //                     alignment: Alignment.bottomRight,
                    //                     child: Image.asset(
                    //                       "assets/images/listelementbottom.png",
                    //                       height: 25,
                    //                       width: 25,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                    // ]
                    // ),
                  );
                })));
  }
}
