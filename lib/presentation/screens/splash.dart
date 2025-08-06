
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:puri/presentation/surveryform/surveryform.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/verifyAppVersion.dart';
import '../complaints/complaintHomePage.dart';
import '../login/loginScreen_2.dart';
import '../resources/app_text_style.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class SplashView extends StatefulWidget {

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplaceState();
}

class _SplaceState extends State<SplashView> {

  bool activeConnection = false;
  String T = "";
  var result,msg;

  // after 1 second delay to navigate
  void navigateToLoginScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen_2()),
      );
    });
  }

  Future checkUserConnection() async {
    // final listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
    //   switch (status) {
    //     case InternetStatus.connected:
    //     // The internet is now connected
    //       navigateToLoginScreen(context);
    //
    //       break;
    //     case InternetStatus.disconnected:
    //     // The internet is now disconnected
    //      displayToast("Internet not Connected");
    //       break;
    //   }
    // });
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          activeConnection = true;
          T = "Turn off the data and repress again";

         // versionAliCall();
          //displayToast(T);
          // get the local Database and take  design to go for a route/
          getlocalDataBaseValue();

        });
      }
    } on SocketException catch (_) {
      setState(() {
        activeConnection = false;
        T = "Turn On the data and repress again";
        displayToast(T);
      });
    }
  }
  String? _appVersion ;
  // get app Version
  //url

  void _launchGooglePlayStore() async {
    const url = 'https://play.google.com/store/apps/details?id=com.instagram.android&hl=en_IN&gl=US'; // Replace <YOUR_APP_ID> with your app's package name
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  //
  void displayToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    /// TODO IN A FUTURE APPLY INTERNET CONNECTION.
    checkUserConnection();

    // versionAliCall();
    //getlocalDataBaseValue();
    print('---------xx--xxxxxx-------');
    super.initState();
  }

  getlocalDataBaseValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('sToken');
    print('----TOKEN---87---$token');
    if(token!=null && token!=''){
      print('-----89---HomeScreen');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SurveryForm()),
      );
    }else{
      print('-----91----LoginScreen');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen_2()),
      );
     // SurveryForm()

    }
  }
  Future<void> versionAliCall() async {
    try {
      // Call the API to check the app version
      var loginMap = await VerifyAppVersionRepo().verifyAppVersion(context, "1");
      result = "${loginMap['Result']}";
      msg = "${loginMap['Msg']}";

      // Check result and navigate or show dialog
      if (result == "1") {
        // Navigate to LoginScreen if version matches
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen_2()),
        );
      } else {
        // Show dialog for mismatched version
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('New Version Available'),
              content: const Text(
                'Please download the latest version of the app from the Play Store.',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    _launchGooglePlayStore();
                  },
                  child: const Text('Download'),
                ),
              ],
            );
          },
        );
        //displayToast(msg ?? "Version mismatch. Please update the app.");
      }
    } catch (e) {
      // Handle potential errors
      print("Error in versionAliCall: $e");
      displayToast("Failed to verify app version.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplaceScreen(),
    );
  }
}

class SplaceScreen extends StatelessWidget {
  const SplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.bottomRight,
          children: [
            // Container(
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage(ImageAssets.templepuri4), // Replace 'background_image.jpg' with your image path
            //         fit: BoxFit.cover, // Cover the entire container
            //       ),
            //     ),
            //   ),
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                     Container(
                       child: Image.asset("assets/icon/icon.png",
                         height: 200,
                         width: 300,),
                     ),
                     Positioned(
                         child: Text('',
                           style:AppTextStyle.font30penSansExtraboldWhiteTextStyle,
                         ),
                     )
                ],
              )
            )

          ],
      )
    );
  }

}

