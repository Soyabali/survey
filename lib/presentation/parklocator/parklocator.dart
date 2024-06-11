import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../app/generalFunction.dart';
import '../../app/navigationUtils.dart';
import '../../resources/app_text_style.dart';

class ParkLocator extends StatefulWidget {

  final name;
  ParkLocator({super.key, this.name});

  @override
  State<ParkLocator> createState() => _KnowYourWardState();
}

class _KnowYourWardState extends State<ParkLocator> {
  GeneralFunction generalFunction = new GeneralFunction();

  @override
  void initState() {
    print('-----27--${widget.name}');
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBarBack(context,'${widget.name}'),
        drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),

        body: ListView(
            children: [
              middleHeader(context, '${widget.name}'),
              Column(
                children: [
                  Card(
                    // margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    elevation: 8,
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      // color: AppColors.appGrey,
                      // width: _width! * 90,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${"Ranjit Mohanty Park"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Address"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Distance"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      "${"Ward NO -3"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Cda Sec 11"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"1266.15 Km"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),

                                   

                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                     Icon(Icons.location_on,size: 25,color: Colors.white,),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset('assets/images/picture.png',
                                            height: 30.0,
                                            width: 30.0,
                                            fit: BoxFit.cover, // optional: scales the image to cover the given height and width
                                          ),


                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                  SizedBox(height: 5),
                  Card(
                    // margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    elevation: 8,
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      // color: AppColors.appGrey,
                      // width: _width! * 90,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${"Ranjit Mohanty Park"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Address"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Distance"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      "${"Ward NO -3"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Cda Sec 11"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"1266.15 Km"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),



                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on,size: 25,color: Colors.white,),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset('assets/images/picture.png',
                                            height: 30.0,
                                            width: 30.0,
                                            fit: BoxFit.cover, // optional: scales the image to cover the given height and width
                                          ),


                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                  SizedBox(height: 5),
                  Card(
                    // margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    elevation: 8,
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      // color: AppColors.appGrey,
                      // width: _width! * 90,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${"Ranjit Mohanty Park"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Address"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Distance"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      "${"Ward NO -3"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Cda Sec 11"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"1266.15 Km"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),



                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on,size: 25,color: Colors.white,),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset('assets/images/picture.png',
                                            height: 30.0,
                                            width: 30.0,
                                            fit: BoxFit.cover, // optional: scales the image to cover the given height and width
                                          ),


                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                  SizedBox(height: 5),
                  Card(
                    // margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    elevation: 8,
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      // color: AppColors.appGrey,
                      // width: _width! * 90,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${"Ranjit Mohanty Park"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Address"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Distance"} : ",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      "${"Ward NO -3"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"Cda Sec 11"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),
                                    Text(
                                      "${"1266.15 Km"}",
                                      style: AppTextStyle
                                          .font14OpenSansRegularWhiteTextStyle,
                                    ),



                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on,size: 25,color: Colors.white,),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset('assets/images/picture.png',
                                            height: 30.0,
                                            width: 30.0,
                                            fit: BoxFit.cover, // optional: scales the image to cover the given height and width
                                          ),


                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ]
        )
    );
  }
}
