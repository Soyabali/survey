
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../app/generalFunction.dart';
import 'package:flutter/widgets.dart';
import '../../app/navigationUtils.dart';
import '../../resources/app_text_style.dart';


class HelpLineFeedBack extends StatefulWidget {

  final name;
  final image;

  HelpLineFeedBack({super.key, this.name, this.image});

  @override
  State<HelpLineFeedBack> createState() => _HelpLineFeedBackState();
}

class _HelpLineFeedBackState extends State<HelpLineFeedBack> {
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {
      'image':
          'https://www.drishtiias.com/images/uploads/1698053713_image1.png',
      'title': 'Biju Bhawan Address',
      'subtitle':
          'Cuttack Municipal Corporation Choudhury Bazar Cuttack 753301, Odisha.'
    },
    {
      'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
      'title': 'Phone Number'
    },
    {
      'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
      'title': 'Email Id'
    },
    {
      'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
      'title': 'WebSite'
    },
  ];

  @override
  void initState() {
    print('-----27--${widget.name}');
    print('-----28--${widget.image}');
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
      appBar: getAppBarBack('Help Line'),
      drawer:
          generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                        'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
                        fit: BoxFit.cover),
                  ),
                ],
              ),
              SizedBox(height: 5),
              middleHeader(context, '${widget.name}'),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        // padding: EdgeInsets.only(left: 5,right: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
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
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('Puri City Address',
                                                style: AppTextStyle
                                                    .font14penSansExtraboldRedTextStyle),
                                            SizedBox(height: 5),
                                            Text('City Puri distric puri state Odisha postal code 752001 India',
                                                style: AppTextStyle
                                                    .font14penSansExtraboldBlack45TextStyle),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Icon(Icons.location_on,
                                          color: Colors.red,
                                          size:
                                          22), //Image.asset('assets/images/callicon.png',
                                    )),
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
                      Padding(
                        // padding: EdgeInsets.only(left: 5,right: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
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
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('Phone Number',
                                                style: AppTextStyle
                                                    .font14penSansExtraboldRedTextStyle),
                                            SizedBox(height: 5),
                                            Text('9871xxxxx',
                                                style: AppTextStyle
                                                    .font14penSansExtraboldBlack45TextStyle),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Image.asset('assets/images/callicon.png',
                                        height:12,
                                        width: 12,
                                      ),
                                      // child: Icon(Icons.location_on,
                                      //     color: Colors.red,
                                      //     size:
                                      //     22), //Image.asset('assets/images/callicon.png',
                                    )),
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
                      Padding(
                        // padding: EdgeInsets.only(left: 5,right: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
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
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('Email id',
                                                style: AppTextStyle
                                                    .font14penSansExtraboldRedTextStyle),
                                            SizedBox(height: 5),
                                            Text('puri@gmail.com',
                                                style: AppTextStyle
                                                    .font14penSansExtraboldBlack45TextStyle),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      // child: Image.asset('assets/images/callicon.png',
                                      //   height:12,
                                      //   width: 12,
                                      // ),
                                      child: Icon(Icons.email,
                                          color: Colors.red,
                                          size:
                                          22), //Image.asset('assets/images/callicon.png',
                                    )),
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
                      Padding(
                        // padding: EdgeInsets.only(left: 5,right: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
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
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('Website',
                                                style: AppTextStyle
                                                    .font14penSansExtraboldRedTextStyle),
                                            SizedBox(height: 5),
                                            Text('https://puri.odisha.gov.on/',
                                                style: AppTextStyle
                                                    .font14penSansExtraboldBlack45TextStyle),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      // child: Image.asset('assets/images/callicon.png',
                                      //   height:12,
                                      //   width: 12,
                                      // ),
                                      child: const Icon(Icons.web,
                                          color: Colors.red,
                                          size:
                                          22), //Image.asset('assets/images/callicon.png',
                                    )),
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
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Text('Click on the image (icon) given below to connect with puri',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/facebook.png',
                              height:40,
                              width: 40,
                            ),
        
                            SizedBox(width: 10),
                            Image.asset('assets/images/twitter.png',
                              height:40,
                              width: 40,
                            ),
                            SizedBox(width: 10),
                            Image.asset('assets/images/instagram.png',
                              height:40,
                              width: 40,
                            ),
                            SizedBox(width: 10),
                            Image.asset('assets/images/feedback.png',
                              height:40,
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
      );
  }
}
