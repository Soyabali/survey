import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/app/generalFunction.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../resources/app_text_style.dart';


class Hospital extends StatefulWidget {
  const Hospital({super.key});

  @override
  State<Hospital> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<Hospital> {
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {'image': 'https://content3.jdmagicbox.com/comp/puri/e4/9999p6752.6752.201104181811.x9e4/catalogue/medtrust-diagnostic-center-puri-14o84twgto.jpg','hospital': 'Medtrust Diagnostic Center'},
    {'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe8MEWQkUDglSYqSn3CBKX6VsF4WjWf8v6gw&s','hospital': 'E 24 Hospital Pvt Ltd'},
    {'image': 'https://media.istockphoto.com/id/1331975194/photo/healthcare-transportation-and-tourism-concept-with-stethoscope-passport-and-plane-model-on-a.jpg?s=612x612&w=0&k=20&c=LvmugApnrpwEmqnBXJUT4M8k-_C3d2_S3H8DeBcJAGU=','hospital': 'Global Health Tourism'},
    {'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXLv0JQZdheF3-mqd55R40ZyHRlkNJhhgKPg&s','hospital': 'Bethel Medical Mission'},
    {'image': 'https://2.bp.blogspot.com/-2Nlgrb9OwBA/U4oI8npglKI/AAAAAAABROM/6Ugqzi8iR6s/s1600/RS66805_Gomata_Pujan.jpg','hospital': 'Panchgavya Arogya Kendra'},
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
                              var templeName = "${itemList[index]['hospital']}";
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
                                        child: Image.network('${itemList[index]['image']}'
                                          ,height: 90,
                                          width: 90,
                                          fit: BoxFit.fill,)),

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
                                            Text('${itemList[index]['hospital']}',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                                            SizedBox(height: 4),
                                            Text('05652565565',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                            SizedBox(height: 4),
                                            InkWell(
                                              onTap: (){
                                                /// TODO CHANGE LAT AND LOGNG IN A FUTURE
                                                double lat = 19.817743;
                                                double long = 85.859839;
                                                launchGoogleMaps(lat,long);
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.location_on,size: 16,color: Colors.red),
                                                  SizedBox(width: 4),
                                                  Text('Masani Link Road,Bypass',
                                                      style:AppTextStyle.font10penSansExtraboldBlack45TextStyle),

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
                                    ///TODO CHANGE YOUR NUMBER AS YOUR API
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
