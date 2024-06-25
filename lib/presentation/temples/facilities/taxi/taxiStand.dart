
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puri/app/generalFunction.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_text_style.dart';


class TaxiStand extends StatefulWidget {
  const TaxiStand({super.key});

  @override
  State<TaxiStand> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<TaxiStand> {
  // GeneralFunction? generalFunction;
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQElHdWqGYhJz_ufGreO5sEm5LQ-2j-6sNurw&s','taxiStand': 'Shree Jagannath Tour'},
    {'image': 'https://content.jdmagicbox.com/comp/puri/f5/9999p6752.6752.171209103543.e4f5/catalogue/modern-travels-puri-travel-agents-u8uooi1hn0.jpg','taxiStand': 'Modern Travels'},
    {'image': 'https://content3.jdmagicbox.com/comp/puri/j3/9999p6752.6752.150730112701.k5j3/catalogue/falana-tours-and-travel-pvt-ltd-puri-station-road-puri-travel-agents-xgpiyvawy9.jpg','taxiStand': 'Falana Tours & Travel Pvt'},
    {'image': 'https://content3.jdmagicbox.com/comp/puri/e6/9999p6752.6752.190916223804.a5e6/catalogue/flowers-tours-and-travels-puri-main-road-puri-travel-agents-xn7hsx419r.jpg','taxiStand': 'Flowers Tours and Travels'},
    {'image': 'https://media-cdn.tripadvisor.com/media/photo-s/1c/00/56/81/bbsrtaxi-provides-cab.jpg','taxiStand': 'Jagannath Taxi Service'},
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  // code to connect call
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      // Handle the case where the phone call could not be initiated
      print('Could not launch $launchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar
      body: Container(
        child: ListView(
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
                              var templeName = "${itemList[index]['taxiStand']}";
                              var image  =  "${itemList[index]['image']}";
                              print('-----165---$templeName');
                              print('-----166---$image');
                              // navigator
                              // Navigator.of(context).push(MaterialPageRoute(builder: (_) => TemplesDetail(
                              //     templeName:templeName,image:image)));
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
                                        child: Image.network('${itemList[index]['image']}',height: 90,width: 90, fit: BoxFit.fill,)),

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
                                            Text('${itemList[index]['taxiStand']}',
                                              style: GoogleFonts.openSans(
                                              color: AppColors.green,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                            )),
                                            SizedBox(height: 40),
                                            InkWell(
                                              onTap: (){
                                                double lat = 19.817743;
                                                double long = 85.859839;
                                                launchGoogleMaps(lat,long);
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.location_on, size: 16, color: Colors.red),
                                                  SizedBox(width: 5),
                                                  Expanded(
                                                    child: Text(
                                                      'Holi Gate-Tank Choraha Road, Mathura',
                                                      style: AppTextStyle.font10penSansExtraboldBlack54TextStyle,
                                                      overflow: TextOverflow.ellipsis, // This will add ellipsis (...) if the text overflows
                                                    ),
                                                  ),
                                                ],
                                              )

                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    print('---calling ----to number---');
                                    /// Todo here you should change a number as a your api
                                    _makePhoneCall('9871950000');
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
                                          height: 25,
                                          width: 25,
                                          fit: BoxFit.cover,
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
        ),
      ),
      // ],
    );
  }
}
