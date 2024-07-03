import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../presentation/homepage/homepage.dart';
import '../presentation/login/loginScreen_2.dart';
import '../presentation/resources/app_text_style.dart';
import '../presentation/resources/values_manager.dart';
import '../presentation/temples/cityhistory/cityhistory.dart';
import '../presentation/temples/emergency/emergencyhome.dart';
import '../presentation/temples/facilities/facilities.dart';
import '../presentation/temples/howToReach/howToReach.dart';
import '../presentation/temples/templehome.dart';
import '../presentation/temples/weather/weather.dart';


// toast

void displayToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
// navigateToGoogleMap

Future<void> launchGoogleMaps(double latitude, double longitude) async {
  print('----37---$latitude');
  print('----38---$longitude');

  final uri = Uri(
    scheme: 'geo',
    path: '$latitude,$longitude',
    queryParameters: {
      'q': '$latitude,$longitude',
    },
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    debugPrint('An error occurred');
  }
}

// backbutton dialog
Future<bool> _onWillPop(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Are you sure?'),
      content: Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () {
            exit(0);
            //Navigator.of(context).pop(true);
          },
          child: Text('Yes'),
        ),
      ],
    ),
  )) ??
      false;
}

// readmoreTemple
readmore(String templeDetails) {
  return ReadMoreText(
    '''The District of Puri has been named after its head quarters, Puri. According to Cunningham, the ancient name of this town was Charitra
Under Mughal Rule (1592-1751), Odisha for the purpose of revenue administration was divided into three circars, namely Jaleswar,
 Bhadrak and Kataka, each of which under the Mughals was subdivided into Bishis. Puri formed a part of Kataka circar. After their occupation of Odisha in 1751, 
the Marathas brought about some changes in the revenue divisions of the province. They divided Odisha, which then extended from the river Suvarnarekha 
in the North to the lake Chilika in the South, into four Chakalas viz. Pipli, Kataka, Soro and Balasore. The Chakala of Pipli comprised major portions of the modern District of Puri.
''',
    trimLines: 10,
    colorClickableText: Colors.red,
    trimMode: TrimMode.Line,
    trimCollapsedText: 'Show more',
    trimExpandedText: 'Show less',
    style: AppTextStyle.font14penSansExtraboldBlack45TextStyle,
    moreStyle:
        TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
   // textAlign: TextAlign.justify, // Justify text alignment
  );
}

// middleHeader
middleHeader(BuildContext context, String templeName) {
  return Stack(
    children: <Widget>[
      Container(
        height: 35,
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 5,
              top: 5,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/cityelementone.png',
                    // Replace with your first image path
                    height: 25.0,
                    width: 25.0,
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/listelementtop.png',
                    // Replace with your second image path
                    height: 25.0,
                    width: 25.0,
                  ),
                ],
              ),
            ),
            // Positioned(
            //   top: 20,
            //   child: Image.asset('assets/images/templeelement1.png',
            //       // Replace with your first image path
            //       height: 30.0,
            //       width: MediaQuery.of(context).size.width),
            // ),
            // Positioned(
            //     top: 55,
            //     left: 0,
            //     right: 0,
            //     child: Center(
            //       child: Text(templeName,
            //           style: AppTextStyle.font16penSansExtraboldRedTextStyle),
            //     ))
          ],
        ),
      )
    ],
  );
}
middleHeaderPuri(BuildContext context, String templeName) {
  return Stack(
    children: <Widget>[
      Container(
        height: 50,
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 5,
              top: 5,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/cityelementone.png',
                    // Replace with your first image path
                    height: 25.0,
                    width: 25.0,
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/listelementtop.png',
                    // Replace with your second image path
                    height: 25.0,
                    width: 25.0,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              child: Image.asset('assets/images/templeelement1.png',
                  // Replace with your first image path
                  height: 30.0,
                  width: MediaQuery.of(context).size.width),
            ),
            Positioned(
                top: 55,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(templeName,
                      style: AppTextStyle.font16penSansExtraboldRedTextStyle),
                ))
          ],
        ),
      )
    ],
  );
}

// appBar
getAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.red,
    elevation: 10,
    shadowColor: Colors.orange,
    toolbarOpacity: 0.5,
    leading: Builder(
      builder: (BuildContext context) {
        return InkWell(
          onTap: () {
            print('----26-----xxx-----');
            Scaffold.of(context).openDrawer();
            // Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            // Adjust the left margin as needed
            child: Transform.scale(
              scale: 0.6,
              // Adjust the scale factor as needed to reduce the image size
              child: Container(
                height: 20,
                width: 20,
                child: Image.asset("assets/images/menu.png"),
              ),
            ),
          ),
        );
      },
    ),
    title: Text(title, style: AppTextStyle.font16penSansExtraboldWhiteTextStyle),
    centerTitle: true,
  );
}

// appbar with backbutton
getAppBarBack(BuildContext context ,String title) {
  return AppBar(
    backgroundColor: Colors.red,
    elevation: 10,
    shadowColor: Colors.orange,
    toolbarOpacity: 0.5,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust padding if necessary
        child: Image.asset(
          "assets/images/back.png",
          fit: BoxFit.contain, // BoxFit.contain ensures the image is not distorted
        ),
      ),
    ),
    title: Text(
      title,
      style: AppTextStyle.font16penSansExtraboldWhiteTextStyle,
    ),
    centerTitle: true,
  );
}

dynamic? lat,long;

class GeneralFunction {
  void logout(BuildContext context) async {
    /// TODO LOGOUT CODE
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("iCitizenCode");
    prefs.remove("sContactNo");
    prefs.remove("sCitizenName");
    prefs.remove("sToken");
    //displayToastlogout();
    goNext(context);
  }

  goNext(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen_2()),
          (route) => false, // Pop all routes until this page
    );
  }
  // drawerFunction

  drawerFunction(BuildContext context, String sName, String sContactNo) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/puriOned4.png'),
                fit: BoxFit.cover,
              ),
            ),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/puriOned2.png',
            //       //image: AssetImage('assets/images/applogo.png',
            //     ),
            //     // Replace with your asset image path
            //     fit: BoxFit.cover,
            //   ),
            //   // image: DecorationImage(
            //   //    image: AssetImage('assets/images/puriOned.png',
            //   //    //image: AssetImage('assets/images/applogo.png',
            //   //   ),
            //   //   // Replace with your asset image path
            //   //   fit: BoxFit.cover,
            //   // ),
            // ),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset('assets/images/home.png',
                            width: 25,
                            height: 25),
                           // color: Colors.red),
                        const SizedBox(width: 10),
                        Text('Home',
                            style: AppTextStyle
                                .font16penSansExtraboldRedTextStyle),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: ()async {
                      // lat and long in a sharedPreferenc
                      //
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      double? lat = prefs.getDouble('lat');
                      double? long = prefs.getDouble('long');
                      print('---334---lat---$lat');
                      print('---335---long---$long');

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TemplesHome(lat:lat,long:long)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/templepin.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        Text('Temples',
                            style: AppTextStyle
                                .font16penSansExtraboldRedTextStyle),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) =>
                                CityHistory(templeName: "", image: "")),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/cityhistory.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'City History',
                          style:
                              AppTextStyle.font16penSansExtraboldRedTextStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => WeatherHome()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/weather.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        Text('Weather',
                            style: AppTextStyle
                                .font16penSansExtraboldRedTextStyle),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 15),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).pushReplacement(
                  //       MaterialPageRoute(
                  //           builder: (context) => FacilitiesHome()),
                  //     );
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) => const FacilitiesHome(),
                  //     //   ),
                  //     // );
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: <Widget>[
                  //       Image.asset(
                  //         'assets/images/facilities.png',
                  //         width: 25,
                  //         height: 25,
                  //       ),
                  //       const SizedBox(width: 10),
                  //       Text('Facilities',
                  //           style: AppTextStyle
                  //               .font16penSansExtraboldRedTextStyle),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 15),
                  // GestureDetector(
                  //   onTap: () {
                  //     // _showBottomSheet(context);   // EmergencyHome
                  //     Navigator.of(context).pushReplacement(
                  //       MaterialPageRoute(
                  //           builder: (context) => EmergencyHome()),
                  //     );
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: <Widget>[
                  //       Image.asset(
                  //         'assets/images/emergency_menu.png',
                  //         width: 25,
                  //         height: 25,
                  //       ),
                  //       const SizedBox(width: 10),
                  //       Text('Emergency',
                  //           style: AppTextStyle
                  //               .font16penSansExtraboldRedTextStyle),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HowToReach()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/how_to_rech.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        Text('How To Reach',
                            style: AppTextStyle
                                .font16penSansExtraboldRedTextStyle),
                      ],
                    ),
                  ),
                 // SizedBox(height: 15),
                ],
              ),
            ),
          ),
          //  Expanded(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Padding(
          //       padding: EdgeInsets.only(bottom: 5.0, left: 15),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: <Widget>
          //         [
          //           Text(
          //             'Synergy Telmatics Pvt.Ltd.',
          //             style: TextStyle(
          //               fontFamily: 'Montserrat',
          //               color: Color(0xffF37339), //#F37339
          //               fontSize: 14.0,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           SizedBox(width: 10),
          //            Padding(
          //               padding: EdgeInsets.only(right: AppSize.s10),
          //               child: SizedBox(
          //                 width: 25,
          //                 height: 25,
          //                 child: Image.asset(
          //                   'assets/images/favicon.png',
          //                   width: 25,
          //                   height: 25,
          //                   fit: BoxFit.fill, // Changed BoxFit to fill
          //                 ),
          //               ),
          //             ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // ShowBottomSheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          color: Colors.white,
          child: GestureDetector(
            onTap: () {
              print('---------');
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Logout",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xff3f617d),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Do you want to logout?",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xff3f617d),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 90,
                          child: ElevatedButton(
                            onPressed: () async {
                              // create an instance of General function
                              logout(context);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF255899),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust as needed
                              ), // Text color
                            ),
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 30,
                          width: 90,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust as needed
                              ), // Text color
                            ),
                            child: const Text(
                              'No',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
    );
  }

  void displayToastlogout() {
    Fluttertoast.showToast(
        msg: "Someone else has been login with your number.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> launchGoogleMaps(double laititude, double longitude) async {
    double destinationLatitude = laititude;
    double destinationLongitude = longitude;
    final uri = Uri(
        scheme: "google.navigation",
        // host: '"0,0"',  {here we can put host}
        queryParameters: {'q': '$destinationLatitude, $destinationLongitude'});
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('An error occurred');
    }
  }
}
