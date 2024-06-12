import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../presentation/homepage/homepage.dart';
import '../presentation/resources/app_text_style.dart';
import '../presentation/resources/values_manager.dart';
import '../presentation/temples/cityhistory/cityhistory.dart';
import '../presentation/temples/emergency/emergencyhome.dart';
import '../presentation/temples/facilities/facilities.dart';
import '../presentation/temples/howToReach/howToReach.dart';
import '../presentation/temples/templehome.dart';
import '../presentation/temples/weather/weather.dart';

// navigateToGoogleMap

Future<void> launchGoogleMaps(double latitude, double longitude) async {
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
// Future<void> launchGoogleMaps(double laititude,double longitude) async {
//   double destinationLatitude= laititude;
//   double destinationLongitude = longitude;
//   final uri = Uri(
//       scheme: "google.navigation",
//       // host: '"0,0"',  {here we can put host}
//       queryParameters: {
//         'q': '$destinationLatitude, $destinationLongitude'
//       });
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri);
//   } else {
//     debugPrint('An error occurred');
//   }
// }

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
    '''Jagannatha is regarded as the supreme god and the sovereign monarch of the Odishan empire. The entire ritual pattern of Jagannatha has been conceived keeping such twin aspects in view. The ritual system of the temple is very elaborate and complex involving a multitude of functionaries above one thousand spread over one hundred categories. The rituals of Jagannatha can broadly be divided into three parts - the daily , the occasional and the festive. In Jagannatha temple these rituals assume the term 'niti'.

Daily Rituals:''',
    trimLines: 1,
    colorClickableText: Colors.red,
    trimMode: TrimMode.Line,
    trimCollapsedText: 'Show more',
    trimExpandedText: 'Show less',
    style: AppTextStyle.font14penSansExtraboldBlack45TextStyle,
    moreStyle:
        TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
    textAlign: TextAlign.justify, // Justify text alignment
  );
}

// middleHeader
middleHeader(BuildContext context, String templeName) {
  return Stack(
    children: <Widget>[
      Container(
        height: 100,
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
    // title: Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Image.asset(
    //       "assets/images/header_line1.png",
    //       width: 50,
    //       height: 15,
    //     ),
    //     SizedBox(width: 10),
    //     Text(title, style: AppTextStyle.font16penSansExtraboldWhiteTextStyle),
    //     SizedBox(width: 10),
    //     Image.asset(
    //       "assets/images/header_line2.png",
    //       width: 50,
    //       height: 10,
    //     ),
    //   ],
    // ),
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
      onTap: (){
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 10,
          width: 10,
          child: Image.asset("assets/images/back.png", fit: BoxFit.fill),
        ),
      ),
    ),
    title: Text(title,
        style: AppTextStyle.font16penSansExtraboldWhiteTextStyle),
    centerTitle: true,
  );
}


    // leading: Builder(
    //   builder: (BuildContext context) {
    //     return InkWell(
    //       onTap: () {
    //       //  print('Leading icon tapped');
    //         Navigator.pop(context);
    //       },
    //       child: Padding(
    //         padding: const EdgeInsets.only(left: 16.0),
    //         child: Transform.scale(
    //           scale: 0.6,
    //           child: Container(
    //             height: 15,
    //             width: 15,
    //             child: Image.asset("assets/images/back.png"),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // ),
   // centerTitle: true,
//     title: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//           Center(child: Text(title,style: AppTextStyle.font16penSansExtraboldWhiteTextStyle))
//         // Flexible(
//         //   flex: 2,
//         //   child: Image.asset(
//         //     "assets/images/header_line1.png",
//         //     fit: BoxFit.contain,
//         //   ),
//         // ),
//         // SizedBox(width: 10),
//         // Expanded(
//         //   flex: 3,
//         //   child: Text(
//         //     title, style: AppTextStyle.font16penSansExtraboldWhiteTextStyle
//         //     // style: TextStyle(
//         //     //   fontSize: 16,
//         //     //   fontWeight: FontWeight.bold,
//         //     //   color: Colors.white,
//         //     // ),
//         //     // overflow: TextOverflow.ellipsis,
//         //   ),
//         // ),
//         // SizedBox(width: 10),
//         // Flexible(
//         //   flex: 2,
//         //   child: Image.asset(
//         //     "assets/images/header_line2.png",
//         //     fit: BoxFit.contain,
//         //   ),
//         // ),
//
// }



class GeneralFunction {
  void logout(BuildContext context) async {
    /// TODO LOGOUT CODE
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("iUserId");
    prefs.remove("sName");
    prefs.remove("sContactNo");
    prefs.remove("sDesgName");
    prefs.remove("iDesgCode");
    prefs.remove("iDeptCode");
    prefs.remove("iUserTypeCode");
    prefs.remove("sToken");
    prefs.remove("dLastLoginAt");
    //displayToastlogout();
    goNext(context);
  }

  goNext(BuildContext context) {
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoginScreen_2()),
    //       (route) => false, // Pop all routes until this page
    // );
  }
  // drawerFunction

  drawerFunction(BuildContext context, String sName, String sContactNo) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/applogo.png'),
                // Replace with your asset image path
                fit: BoxFit.cover,
              ),
            ),
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
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TemplesHome()),
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CityHistory(templeName:"",image:""),
                      //   ),
                      // );
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

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const WeatherHome(),
                      //   ),
                      // );
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
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => FacilitiesHome()),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const FacilitiesHome(),
                      //   ),
                      // );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/facilities.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        Text('Facilities',
                            style: AppTextStyle
                                .font16penSansExtraboldRedTextStyle),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      // _showBottomSheet(context);   // EmergencyHome
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => EmergencyHome()),
                      );
                      //  Navigator.push(
                      //    context,
                      //    MaterialPageRoute(
                      //      builder: (context) => const EmergencyHome(),
                      //    ),
                      //  );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/emergency_menu.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        Text('Emergency',
                            style: AppTextStyle
                                .font16penSansExtraboldRedTextStyle),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      //_showBottomSheet(context);  //  HowToReach
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>  HowToReach(),
                      //   ),
                      // );
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
           Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.0, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>
                  [
                    Text(
                      'Synergy Telmatics Pvt.Ltd.',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xffF37339), //#F37339
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                     Padding(
                        padding: EdgeInsets.only(right: AppSize.s10),
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset(
                            'assets/images/favicon.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.fill, // Changed BoxFit to fill
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
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
