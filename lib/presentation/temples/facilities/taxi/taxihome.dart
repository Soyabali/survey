import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/app/generalFunction.dart';
import '../../../../app/navigationUtils.dart';
import '../../../resources/app_text_style.dart';


class TaxiHome extends StatefulWidget {
  const TaxiHome({super.key});

  @override
  State<TaxiHome> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<TaxiHome> {
  // GeneralFunction? generalFunction;
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {'image': 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201804/ola_1.jpeg','texi': 'Ola Cabs'},
    {'image': 'https://www.ft.com/__origami/service/image/v2/images/raw/https%3A%2F%2Fd1e00ek4ebabms.cloudfront.net%2Fproduction%2F72721ab5-fb03-40f9-bfa6-332d5c02e2c7.jpg?source=next-article&fit=scale-down&quality=highest&width=700&dpr=1','texi': 'Uber'},
    {'image': 'https://play-lh.googleusercontent.com/JfA0mDgT-llt2A7R848ooAIfvu00eSgE1GKNs6hybN8SU-lgwcRnqtJL8nIUt178s8I','texi': 'Savaari Car Rentals'},
    {'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTwIuRZQqZu2Ww9lfkGrB_AIL5CRHpd0FLlA&s','texi': 'Odisha Taxi'},
    {'image': 'https://i.pinimg.com/236x/1d/b2/ae/1db2ae9b0700f5911e74208d713882ce.jpg','texi': 'Puri Taxi Service'},
  ];


  @override
  void initState() {
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
                                var templeName = "${itemList[index]['texi']}";
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
                                            width: 90, fit: BoxFit.fill,)),

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
                                              Text('${itemList[index]['texi']}',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Seats:',
                                                      style:AppTextStyle.font14penSansExtraboldRedTextStyle),

                                                  SizedBox(width: 5),
                                                  Text('4+1',
                                                      style:AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Fare:',
                                                      style:AppTextStyle.font14penSansExtraboldRedTextStyle),
                                                  SizedBox(width: 5),
                                                  Text('₹12.0 per km',
                                                      style:AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                ],
                                              ),
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
                        );
                      },
                    ),
                  ),
                )
              ]
          ),
        ),
      );
  }
}
