
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:puri/presentation/helpline_feedback/twitte_page.dart';
import 'package:puri/presentation/helpline_feedback/website.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../app/generalFunction.dart';
import 'package:flutter/widgets.dart';
import '../../app/navigationUtils.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../resources/app_text_style.dart';
import 'facebook.dart';
import 'feedbackBottomSheet.dart';
import 'instagrampage.dart';


class HelpLineFeedBack extends StatefulWidget {
  final String name;
  final String image;

  HelpLineFeedBack({Key? key, required this.name, required this.image}) : super(key: key);

  @override
  State<HelpLineFeedBack> createState() => _HelpLineFeedBackState();
}

class _HelpLineFeedBackState extends State<HelpLineFeedBack> {
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {
      'image': 'https://www.drishtiias.com/images/uploads/1698053713_image1.png',
      'title': 'Biju Bhawan Address',
      'subtitle': 'Cuttack Municipal Corporation Choudhury Bazar Cuttack 753301, Odisha.'
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
    super.initState();
    print('-----27--${widget.name}');
    print('-----28--${widget.image}');
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

  _launchURLWeb() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack(context,'Help Line'),
      drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.network('https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg', fit: BoxFit.cover),
              ),
            ],
          ),
          SizedBox(height: 5),
          middleHeader(context, '${widget.name}'),

          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                          InkWell(
                            onTap: (){
                             // launchUrlString("tel://7520014455");
                              double lat = 19.817743;
                              double long = 85.859839;
                              launchGoogleMaps(lat,long);
                            },
                            child: Padding(
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
                                      Text('9871xxxxxx',
                                          style: AppTextStyle
                                              .font14penSansExtraboldBlack45TextStyle),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              launchUrlString("tel://7520014455");
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(Icons.phone,
                                      color: Colors.red,
                                      size:
                                      22), //Image.asset('assets/images/callicon.png',
                                )),
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
                                      Text('puri@gmial.com',
                                          style: AppTextStyle
                                              .font14penSansExtraboldBlack45TextStyle),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              /// TODO CHANGE EMAIL IN A FUTURE
                              UrlLauncher.launch('mailto:${'puri@gmail.com'}');
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(Icons.email,
                                      color: Colors.red,
                                      size:
                                      22), //Image.asset('assets/images/callicon.png',
                                )),
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
                                      Text('https://puri.odisha.gov.in',
                                          style: AppTextStyle
                                              .font14penSansExtraboldBlack45TextStyle),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              /// TODO OPEN WEBURL
                              ///
                             // WebSitePage();
                              //_launchURLWeb();
                              //MarriageCertificate();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebSitePage()),
                              );

                            },
                            child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(Icons.web,
                                      color: Colors.red,
                                      size:
                                      22), //Image.asset('assets/images/callicon.png',
                                )),
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
                ),

              ],
              // children: itemList.map((item) {
              //   return Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 2.0),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.orange, width: 1.0),
              //       ),
              //       child: InkWell(
              //         onTap: () {},
              //         child: Row(
              //           children: [
              //             Expanded(
              //               child: Padding(
              //                 padding: const EdgeInsets.all(10),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(item['title']!, style: AppTextStyle.font14penSansExtraboldRedTextStyle),
              //                     if (item.containsKey('subtitle'))
              //                       Padding(
              //                         padding: const EdgeInsets.only(top: 5.0),
              //                         child: Text(item['subtitle']!, style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
              //                       ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(left: 5),
              //               child: Icon(Icons.location_on, color: Colors.red, size: 22),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 5),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.end,
              //                 crossAxisAlignment: CrossAxisAlignment.end,
              //                 children: [
              //                   Align(
              //                     alignment: Alignment.topRight,
              //                     child: Image.asset("assets/images/listelementtop.png", height: 25, width: 25),
              //                   ),
              //                   SizedBox(height: 35),
              //                   Align(
              //                     alignment: Alignment.bottomRight,
              //                     child: Image.asset("assets/images/listelementbottom.png", height: 25, width: 25),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   );
              // }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Click on the image (icon) given below to connect with puri',
              style: AppTextStyle.font14penSansExtraboldBlack45TextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    print('--facebook---');
                   // FacebookPage();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FacebookPage(name: "Facebook",)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/facebook.png', height: 40, width: 40),
                  ),
                ),
                InkWell(
                  onTap: (){
                    print('--twitter---');
                  //  TwitterPage();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TwitterPage(name: "Twitter",)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/twitter.png', height: 40, width: 40),
                  ),
                ),
                InkWell(
                  onTap: (){
                    print('--instagram---');
                    //InstagramPage();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InstagramPage(name: "Instagram",)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/instagram.png', height: 40, width: 40),
                  ),
                ),
                InkWell(
                  onTap: (){
                    print('--feedback---');
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => FeedbackBottomSheet(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/feedback.png', height: 40, width: 40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}