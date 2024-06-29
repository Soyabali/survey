import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puri/app/generalFunction.dart';
import '../../../app/loader_helper.dart';
import '../../../services/getNearByPlaceListRepo.dart';
import '../../nodatavalue/NoDataValue.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_text_style.dart';


class NearByPlaceList extends StatefulWidget {
  var sTypeName;
   var iTypeCode;
   NearByPlaceList({super.key, this.sTypeName, this.iTypeCode});

  @override
  State<NearByPlaceList> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<NearByPlaceList> {
  //double? lat,long;
  dynamic? lat,long;
  GeneralFunction generalFunction = GeneralFunction();

  List<Map<String, dynamic>>? templeListResponse;


  getTempleListResponse(double lat, double long, int iTypeCode,) async {
    templeListResponse = await NearByPlaceListRepo().getNearByTempleList(context,lat,long,'${widget.iTypeCode}');
    print('------36----$templeListResponse');
    setState(() {
    });

  }

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

  void getLocation() async {
    showLoader();
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
    print('-----------7----$lat');
    print('-----------76----$long');
    print('---77--${widget.iTypeCode}');
    if (lat != null && long != null) {
      getTempleListResponse(lat!, long!, widget.iTypeCode);
    }else{
      hideLoader();
      _showToast(context,"Please location on Your Phone");
    }
    // setState(() {
    // });
    debugPrint("Latitude: ----142--- $lat and Longitude: $long");
    debugPrint(position.toString());
  }

  @override
  void initState() {
    print("---48--${widget.iTypeCode}");
    getLocation();
    print('--lat-  --87----$lat');
    print('--long-----88---$long');
   // getTempleListResponse();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack(context,'${widget.sTypeName}'),
      drawer: generalFunction.drawerFunction(context,'Suaib Ali','9871950881'),

      body:
      templeListResponse == null
          ? NoDataScreenPage()
          :
      ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
              child: Container(
                height: MediaQuery.of(context).size.height-150,
                child: ListView.builder(
                  itemCount: templeListResponse?.length ?? 0,
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
                            double fLatitude;
                            double fLongitude;

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

                            print('-----165---fLatitude--$fLatitude');
                            print('-----166---fLongitude--$fLongitude');
                            /// todo to open gooogle map
                            launchGoogleMaps(fLatitude, fLongitude);

                            },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network('${templeListResponse![index]['sImage']}',
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,)),

                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 80,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8),
                                            child: Text('${templeListResponse![index]['sPlaceName']}',
                                                style: GoogleFonts.openSans(
                                                  color: AppColors.green,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){

                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                      ),
                                      // child: Image.asset('assets/images/arrow.png',
                                      //   height: 12,
                                      //   width: 12,
                                      // )
                                      child: Image.asset('assets/images/direction.jpeg',
                                        height: 12,
                                        width: 12,
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
  void _showToast(BuildContext context,String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content:  Text('$msg'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
