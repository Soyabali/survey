
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:puri/presentation/helpline_feedback/twitte_page.dart';
import 'package:puri/presentation/helpline_feedback/website.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../app/generalFunction.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../resources/app_text_style.dart';
import 'facebook.dart';
import 'instagrampage.dart';

class HelpLineFeedBack extends StatefulWidget {

  final String name;
  final String image;

  HelpLineFeedBack({Key? key,
    required this.name,
    required this.image}) : super(key: key);

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
  final String phoneNumber = '918826772888';
  final String message = 'Hello';

  void _launchWhatsApp() async {
    // Use the WhatsApp API with the country code and phone number
    var whatsappUrl = "https://wa.me/$phoneNumber/?text=${Uri.parse(message)}";
    await canLaunch(whatsappUrl) ? launch(whatsappUrl) : print('Could not launch $whatsappUrl');
  }

  @override
  void initState() {
    super.initState();
    print('-----27--${widget.name}');
    print('-----28--${widget.image}');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack(context,'Help Line/Feedback'),
      drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Stack(
            children: <Widget>[
              Center( // Optional: Center the circular image
                child: ClipOval(
                  child: Container(
                    height: 100, // Set height to 100
                    width: 100,  // Set width to 100
                    child: Image.network(
                      'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
                      fit: BoxFit.cover, // Ensures the image covers the circular area
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Stack(
          //   children: <Widget>[
          //     Container(
          //       height: 115,
          //       width: MediaQuery.of(context).size.width,
          //       child: Image.network('https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg', fit: BoxFit.cover),
          //     ),
          //   ],
          // ),
          SizedBox(height: 5),
         // middleHeader(context, '${widget.name}'),
          Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  child: Column(
                     // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          // padding: EdgeInsets.only(left: 5,right: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              border: Border.all(
                               // color: Colors.orange,
                                color: Color(0xFF255898),
                                // Set the golden border color
                                width: 1.0, // Set the width of the border
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                /// TODO HERE GET A CURRECT LOCATION
                                double lat = 19.80494797579724;
                                double long = 85.81796005389619;
                                launchGoogleMaps(lat,long);
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text('Diu Muncipal Council Address',
                                                  style: AppTextStyle
                                                      .font14penSansExtraboldBlackTextStyle),
                                              SizedBox(height: 5),
                                              Text('For Road, Diu,(Union territory),India',
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
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: const Icon(Icons.location_on,
                                              color: Color(0xFF255898),
                                              size:
                                              22), //Image.asset('assets/images/callicon.png',
                                        )),
                                ],
                              ),
                            ),
                          ),
                        ),
                       // SizedBox(height: 2),
                        Padding(
                          // padding: EdgeInsets.only(left: 5,right: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              border: Border.all(
                                color:Color(0xFF255898),
                                // Set the golden border color
                                width: 1.0, // Set the width of the border
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                print('call---numbr--');
                               // launchUrlString("tel://+91-6752-222002");
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 5),
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
                                                      .font14penSansExtraboldBlackTextStyle),
                                              SizedBox(height: 5),
                                              Text("+91-2875-253638",
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
                                      launchUrlString("tel://912875-253638");
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: const Icon(Icons.phone,
                                              color: Color(0xFF255898),
                                              size:
                                              22), //Image.asset('assets/images/callicon.png',
                                        )),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 5),
                                  //   child: Column(
                                  //     mainAxisAlignment: MainAxisAlignment.end,
                                  //     crossAxisAlignment: CrossAxisAlignment.end,
                                  //     children: [
                                  //       Align(
                                  //         alignment: Alignment.topRight,
                                  //         child: Image.asset(
                                  //           "assets/images/listelementtop.png",
                                  //           height: 25,
                                  //           width: 25,
                                  //         ),
                                  //       ),
                                  //       SizedBox(height: 35),
                                  //       Align(
                                  //         alignment: Alignment.bottomRight,
                                  //         child: Image.asset(
                                  //           "assets/images/listelementbottom.png",
                                  //           height: 25,
                                  //           width: 25,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
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
                                color:Color(0xFF255898),
                                // Set the golden border color
                                width: 1.0, // Set the width of the border
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                UrlLauncher.launch('mailto:${'jagannath@nic.in'}');
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10),
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
                                                      .font14penSansExtraboldBlackTextStyle),
                                              SizedBox(height: 5),
                                              Text('dmc-diu-dd@nic.in',
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
                                     // UrlLauncher.launch('mailto:${'puri@gmail.com'}');
                                      UrlLauncher.launch('mailto:${'dmc-diu-dd@nic.in'}');
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: const Icon(Icons.email,
                                              color: Color(0xFF255898),
                                              size:
                                              22), //Image.asset('assets/images/callicon.png',
                                        )),
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
                                color: Color(0xFF255898),
                                // Set the golden border color
                                width: 1.0, // Set the width of the border
                              ),
                            ),
                            child: InkWell(
                              onTap: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebSitePage()),
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text('Website',
                                                  style: AppTextStyle.font14penSansExtraboldBlackTextStyle),
                                              SizedBox(height: 5),
                                              Text('https://upegov.in/website/',
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WebSitePage()),
                                      );
                                      },
                                    child: Padding(
                                        padding:
                                        const EdgeInsets.only(right: 10),
                                        child: Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: const Icon(Icons.webhook,
                                                  color: Color(0xFF255898),
                                                  size:
                                                  22), //Image.asset('assets/images/callicon.png',
                                            )
                                        ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              'Click on the Icon given below to connect with Diu Municipal Council',
                              style: AppTextStyle.font14penSansExtraboldBlack45TextStyle,
                              textAlign: TextAlign.center, // Centers the text horizontally
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                         Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    _launchWhatsApp();
                                    // showModalBottomSheet(
                                    //   context: context,
                                    //   builder: (context) => FeedbackBottomSheet(),
                                    // );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/images/whatsapp.png', height: 40, width: 40),
                                  ),
                                ),
                              ],
                            ),
                      ],
                  ),
                ),
              ),
        ]
    ),
    );
  }
}