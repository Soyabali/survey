
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/app/generalFunction.dart';
import '../../../../app/navigationUtils.dart';
import '../../../resources/app_text_style.dart';


class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<Restaurant> {
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {'image': 'https://media-cdn.tripadvisor.com/media/photo-s/03/f9/73/21/cozy-corner.jpg','resturant': 'Wildgrass Restaurant'},
    {'image': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/78/dc/00/img-20161030-185218-largejpg.jpg?w=1200&h=-1&s=1','resturant': 'Honey Bee Bakery'},
    {'image': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/b3/a6/10/the-swimming-breakfast.jpg?w=1200&h=-1&s=1','resturant': 'Pink House'},
    {'image': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/5f/b7/f6/the-muesli-is-a-fruity.jpg?w=1200&h=-1&s=1','resturant': 'Peace Restaurant'},
    {'image': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/ee/46/a1/chung-wah-restaurant.jpg?w=1200&h=-1&s=1','resturant': 'Chung Wah'},
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
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
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
                                var templeName = "${itemList[index]['resturant']}";
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
                                          child: Image.network('${itemList[index]['image']}',height: 90,width: 90, fit: BoxFit.cover,)),

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
                                              Text('${itemList[index]['resturant']}',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Rating',style:AppTextStyle.font14penSansExtraboldRedTextStyle
                                                  ),

                                                ],
                                              ),
                                              const Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  Icon(Icons.star,size: 15,color: Colors.grey,),
                                                  SizedBox(width: 20),

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
                                                    SizedBox(width: 5),
                                                    Text('Beach Area VIP Rd, Puri',
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
        )
      // ],
    );
  }
}
