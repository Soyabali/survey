import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/app/generalFunction.dart';
import '../../../resources/app_text_style.dart';


class Hotel extends StatefulWidget {
  const Hotel({super.key});

  @override
  State<Hotel> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<Hotel> {
  GeneralFunction generalFunction = GeneralFunction();

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
        body:
         ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,bottom: 50),
                  child: Container(
                    height: MediaQuery.of(context).size.height-150,
                    child: ListView.builder(
                      itemCount: itemList.length,
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
                                var templeName = "${itemList[index]['hotelName']}";
                                var image  =  "${itemList[index]['hotel']}";
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
                                          child: Image.network('${itemList[index]['hotel']}',
                                            height: 90,
                                            width: 90,
                                            fit: BoxFit.cover,)),

                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 110,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('${itemList[index]['hotelName']}',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                                              //   style: TextStyle(
                                              //     color: Colors.red,fontSize: 16
                                              // ),),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Rating',style:AppTextStyle.font14penSansExtraboldRedTextStyle

                                                  ),
                                                  SizedBox(width: 50,),
                                                  Text('Rate',style:AppTextStyle.font14penSansExtraboldRedTextStyle),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  const Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  const Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  const Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  const Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  const Icon(Icons.star,size: 15,color: Colors.grey,),
                                                  const SizedBox(width: 20),
                                                  Text('₹3274.0',style:AppTextStyle.font10penSansExtraboldBlack45TextStyle),
                                                  Text(' - ',style:AppTextStyle.font10penSansExtraboldBlack45TextStyle),
                                                  Text('₹4811.0',style:AppTextStyle.font10penSansExtraboldBlack45TextStyle),

                                                ],
                                              ),
                                              SizedBox(height: 2),
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
                                                    SizedBox(width: 2),
                                                    Text('Masani Link Road, Bypass',
                                                        style:AppTextStyle.font10penSansExtraboldBlack45TextStyle,
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),

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
                                      print('----179----');
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
                ),
                SizedBox(height: 50),
                Text('Facilities',style: TextStyle(
                  color: Colors.black,fontSize: 14
                ),)
              ]
          ),
        );
  }
}
