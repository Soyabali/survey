
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puri/app/generalFunction.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_text_style.dart';


class PoliceStation extends StatefulWidget {
  const PoliceStation({super.key});

  @override
  State<PoliceStation> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<PoliceStation> {
  // GeneralFunction? generalFunction;
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo4hFVUQ1RFn01P3PMpMuFO5SvdwbPTeLBFg&s','policeStation': 'Sadar Police Station','address': "RR4M+568, VIP Rd"},
    {'image': 'https://cawach.odisha.gov.in/wp-content/uploads/2022/11/1-13.jpg','policeStation': 'Town Police Station, Puri','address':"RR5F+C4W, Grand Rd"},
    {'image': 'https://odishabytes.com/wp-content/uploads/2023/04/WhatsApp-Image-2023-04-08-at-3.23.09-PM-1200x900.jpeg','policeStation': 'Sea Beach Police','address':"QRWG+R88, Bhanumati Rd"},
    {'image': 'https://odishabytes.com/wp-content/uploads/2023/08/Kumbharapada-PS-1200x680.jpg','policeStation': 'Kumbharapada Police','address':"NH-203"},
    {'image': 'https://pbs.twimg.com/profile_images/1429833527332200449/qhi9b5jb_400x400.jpg','policeStation': 'Baliapanda Police Station','address':"RR25+F2C, Manisha Rd"},
  ];
  @override
  void initState() {
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
        // appBar
        body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,bottom: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        // padding: EdgeInsets.only(left: 5,right: 5),
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
                              var policeStation = "${itemList[index]['policeStation']}";
                              var image  =  "${itemList[index]['image']}";
                              print('-----165---$policeStation');
                              print('-----166---$image');
                              },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5.0),
                                        child: Image.network('${itemList[index]['image']}',height: 90,width: 90, fit: BoxFit.cover,)),

                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('${itemList[index]['policeStation']}',
                                                style: GoogleFonts.openSans(
                                                  color: AppColors.green,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                )
                                            ),
                                            SizedBox(height: 8),
                                            Text('05662233233',style: AppTextStyle.font14penSansExtraboldBlack54TextStyle),
                                            SizedBox(height: 8),
                                            InkWell(
                                              onTap: (){
                                                /// TODO CHANGE LAT AND LONG
                                                double lat = 19.817743;
                                                double long = 85.859839;
                                                launchGoogleMaps(lat,long);

                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.location_on,size: 16,color: Colors.red),
                                                  SizedBox(width: 5),
                                                  Text('${itemList[index]['address']}',
                                                      style:AppTextStyle.font10penSansExtraboldBlack54TextStyle),
                                                ],
                                              ),
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    launchUrlString("tel://9871950000");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Image.asset('assets/images/callicon.png',
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
              )
            ]
        )
      // ],
    );
  }
}
