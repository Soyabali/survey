import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/loader_helper.dart';
import '../complaints/complaintHomePage.dart';
import '../complaints/raiseGrievance/notification.dart';
import '../helpline_feedback/helplinefeedback.dart';
import '../login/loginScreen_2.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_style.dart';
import '../resources/assets_manager.dart';
import '../temples/nearbyplace/nearbyplace.dart';
import '../temples/templehome.dart';
import '../toilet_locator/toilet_locator_details.dart';
import '../toilet_locator/utilityLocator.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isTextVisible2 = false;
  bool isTextVisible = true;

  //dynamic? lat,long;
  double? lat,long;
  double? fLatitude;
  double? fLongitude;

  // get a location
  void getLocation() async {
    showLoader();
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      hideLoader();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      hideLoader();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      hideLoader();
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    debugPrint("-------------Position-----------------");
    debugPrint(position.latitude.toString());
    lat = position.latitude;
    long = position.longitude;
    print('-----------7----$lat');
    print('-----------76----$long');

    if (lat != null && long != null) {
      hideLoader();
      //save in a shared Preference value
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setDouble('lat',lat!);
      prefs.setDouble('long',long!);
      //getlocator(lat!, long!);
    }
    // setState(() {
    // });
    debugPrint("Latitude: ----88--- $lat and Longitude: $long");
    debugPrint(position.toString());
  }
  @override
  void initState() {
    // TODO: implement initState
   // getLocation();
    getlatAndLong();
    super.initState();
  }
  // create a function to get a local data
  getlatAndLong()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lat = prefs.getDouble('lat');
    long = prefs.getDouble('long');
   // getlocator(lat!, long!);
    if (lat!=null){
      print('NO need to call location function--');
    }else{
      getLocation();
    }
    print('---110---lat---$lat');
    print('---111---long---$long');
  }


  @override
  void dispose() {
  //  BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:Stack(
          fit: StackFit.expand,
          children: <Widget>[
           Container(
                width: MediaQuery.of(context).size.width-50,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(ImageAssets.templepuri4,
                fit: BoxFit.cover,),
              ),
            Positioned(
              top: 70,
                right: 10,
                left: 10,
                child: Center(
                  child: Container(
                     child: Stack(
                       children: <Widget>[
                         Image.asset(ImageAssets.cityname,
                             height: 180),
                                 Positioned(
                                   top: 68,
                                   left: 35,
                                   child: Text("Rath Yatra-2024",
                                     style: AppTextStyle.font30penSansExtraboldWhiteTextStyle
                                   )

                                 )

                       ],
                     )
                  ),
                )
            ),
            // circle
            Positioned(
              top: 280,
              left: 15,
              right: 15,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double containerSize = constraints.maxWidth;
                  return Container(
                    height: containerSize,
                    width: containerSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(containerSize / 2), // Make it circular
                      image: const DecorationImage(
                        image: AssetImage(ImageAssets.changecitybackground), // Provide your image path here
                        fit: BoxFit.cover, // Cover the entire container
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: containerSize * 0.47,
                          left: containerSize * 0.43,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "SELECT",
                              style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                            ),
                          ),
                        ),
                        Positioned(
                             top: containerSize * 0.10,
                            left: containerSize * 0.40,
                          child: InkWell(
                            onTap: () {
                              print('-----114-----'); // HelpLineFeedBack
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TemplesHome(lat:lat,long:long)),
                              );

                                    // Navigator.of(context).pushReplacement(
                                    //   MaterialPageRoute(builder: (context) => TemplesHome(lat:lat,long:long)));
                                    //

                            },
                            child: Container(
                              width: containerSize * 0.2,
                              height: containerSize * 0.2,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Temples',
                                    style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                                  ),
                                  Text(
                                    '',
                                    style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: containerSize * 0.35,
                          left: containerSize * 0.07,
                          child: InkWell(
                            onTap: () {
                              print('-----114-----'); // HelpLineFeedBack
                              // LoiletLocatorDetails
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => ToiletLocator(name: "Toilet Locator")),
                              // );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => LoiletLocatorDetails(name: "Toilet Locator")),
                              // );
                             // UtilityLocator
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UtilityLocator()
                                )
                              );
                            },
                            child: Container(
                              width: containerSize * 0.2,
                              height: containerSize * 0.2,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Utility',
                                    style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                                  ),
                                  Text(
                                    'Locator',
                                    style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: containerSize * 0.35,
                            right: containerSize * 0.06,
                            left: containerSize * 0.75,
                          child: InkWell(
                            onTap: ()async {

                              print('---complaintHomePage---');

                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              String? token = prefs.getString('sToken');
                              print('----TOKEN---87---$token');
                              if(token!=null ){
                                print('-----89---HomeScreen');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ComplaintHomePage()),
                                );
                              }else{
                                print('-----91----LoginScreen');

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen_2()),
                                );

                              }

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => LoginScreen_2()),
                              // );

                              },
                            child: Container(
                              width: containerSize * 0.2,
                              height: containerSize * 0.2,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Citizen',
                                    style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                                  ),
                                  Text(
                                    'Services',
                                    style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: containerSize * 0.12,
                          right: containerSize * 0.18,
                          child: InkWell(
                            onTap: () {
                              print('----130------');

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HelpLineFeedBack(name:"Help Line", image: '',)),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => NearByPlace(name:"Near by Place")),
                              // );
                            },
                            child: Container(
                              width: containerSize * 0.2,
                              height: containerSize * 0.2,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                'Help Line',
                                style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: containerSize * 0.12,
                            left: containerSize * 0.20,
                          child: InkWell(
                            onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => NearByPlace(name:"Near by Place")),
                                    );
                            },
                            child: Container(
                              width: containerSize * 0.2,
                              height: containerSize * 0.2,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Near by',
                                    style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                                  ),
                                  Text(
                                    'Places',
                                    style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],

                    ),

                  );
                },
              ),
            ),
          ],
        )
      );
  }
}

