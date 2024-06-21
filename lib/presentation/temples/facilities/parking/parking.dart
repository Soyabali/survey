
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/app/generalFunction.dart';
import '../../../resources/app_text_style.dart';

class Parking extends StatefulWidget {
  const Parking({super.key});

  @override
  State<Parking> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<Parking> {
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String,String>> itemList = [
    {'image': 'https://thumbs.dreamstime.com/b/bike-parking-near-gundicha-mandir-ratha-yatra-photo-taken-puri-odisha-india-186882377.jpg','parking': 'Puri mandir parking'},
    {'image': 'https://content.jdmagicbox.com/comp/puri/q6/9999p6752.6752.230628153644.n2q6/catalogue/puri-mandir-parking-badshahi-road-puri-pay-and-park-services-DIAc87YgeS-250.jpg','parking': 'Paid Parking at puri beach'},
    {'image': 'https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/flyfish/raw/NH21115235941160/QS1042/QS1042-Q1/IMG20221208082013.jpg','parking': 'Jagannath ballav parking'},
    {'image': 'https://odishabytes.com/wp-content/uploads/2018/01/multi-level-car-park.jpeg','parking': 'SJBP Multi Level Parking'},
    {'image': 'https://ak.jogurucdn.com/media/image/p25/place-2018-04-12-7-a2fff1b59859ba14dd30d0e4b94eba6e.jpg','parking': 'Golden Beach Parking'},
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
                            padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
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
                                  var templeName = "${itemList[index]['parking']}";
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
                                            child: Image.network('${itemList[index]['image']}',
                                              height: 90,
                                              width: 90,
                                              fit: BoxFit.cover,)),

                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('${itemList[index]['parking']}',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text('Parking',style:AppTextStyle.font14penSansExtraboldRedTextStyle
                                                    ),
                                                    SizedBox(width: 25),
                                                    Text('Last Updated',style:AppTextStyle.font14penSansExtraboldRedTextStyle
                                                    ),

                                                  ],
                                                ),
                                                SizedBox(height: 5),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5,bottom: 5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text('-',style:AppTextStyle.font10penSansExtraboldBlack45TextStyle
                                                      ),
                                                      SizedBox(width: 70),
                                                      Text('-',style:AppTextStyle.font10penSansExtraboldBlack45TextStyle
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    double lat = 19.817743;
                                                    double long = 85.859839;
                                                    launchGoogleMaps(lat,long);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.location_on,size: 16,color: Colors.red),
                                                      SizedBox(width: 5),
                                                      Text('Odisha 752002, Road, Badasirei',
                                                          style:AppTextStyle.font10penSansExtraboldBlack45TextStyle),

                                                    ],
                                                  ),
                                                )

                                              ],

                                            ),

                                          ),

                                          // child: ListTile(
                                          //     title: Text(
                                          //       "${itemList[index]['temple']}",
                                          //       style: TextStyle(
                                          //         color: Colors.red,
                                          //         fontSize: 14,
                                          //       ),
                                          //     ),
                                          //     trailing: Image.asset('assets/images/arrow.png',
                                          //       height: 12,
                                          //       width: 12,
                                          //     )
                                          // ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        double lat = 19.817743;
                                        double long = 85.859839;
                                        launchGoogleMaps(lat,long);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                                            height: 12,
                                            width: 12,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),

                                            ),
                                            child: Image.asset('assets/images/arrow.png',
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
            ),
        ),
      // ],
    );
  }
}
