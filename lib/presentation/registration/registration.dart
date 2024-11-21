
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/generalFunction.dart';
import '../login/loginScreen_2.dart';
import '../otp/otpverification.dart';
import '../registration/registration.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_style.dart';
import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegistrationPage> {

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _userController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;
  var loginProvider;

  // focus
  FocusNode phoneNumberfocus = FocusNode();
  FocusNode userfocus = FocusNode();

  bool passwordVisible = false;
  // Visible and Unvisble value
  int selectedId = 0;
  var msg;
  var result;
  var loginMap;
  double? lat, long;
  GeneralFunction generalFunction = GeneralFunction();

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
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
    print('-----------105----$lat');
    print('-----------106----$long');
    // setState(() {
    // });
    debugPrint("Latitude: ----1056--- $lat and Longitude: $long");
    debugPrint(position.toString());
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?',style: AppTextStyle
            .font14OpenSansRegularBlackTextStyle,),
        content: new Text('Do you want to exit app',style: AppTextStyle
            .font14OpenSansRegularBlackTextStyle,),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () {
              //  goToHomePage();
              // exit the app
              exit(0);
            }, //Navigator.of(context).pop(true), // <-- SEE HERE
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getLocation();
    Future.delayed(const Duration(milliseconds: 100), () {
      // requestLocationPermission();
      setState(() {
        // Here you can write your code for open new view
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneNumberController.dispose();
    _userController.dispose();
    super.dispose();
  }
  void clearText() {
    _phoneNumberController.clear();
    _userController.clear();
  }
  // bottomSheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: GestureDetector(
            onTap: (){
              print('---------');
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(Icons.close,size: 25,color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Can't Login?",style:AppTextStyle.font18OpenSansboldAppBasicTextStyle),
                  SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        /// After implement attion this comment is remove and OtpVerfication is hide
                        // Add your button onPressed logic here
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //         const ForgotPassword()));

                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Adjust as needed
                        ), // Text color
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                            'Forgot Password',style:TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        )),
                      ),
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //onWillPop: _onWillPop,
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pop Screen Disabled.'),
            backgroundColor: Colors.red,
          ),
        );
        return false; // Prevent the back button action
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // mention all widget here
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(AppMargin.m10),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(ImageAssets.roundcircle), // Replace with your image asset path
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: AppSize.s50,
                          height: AppSize.s50,
                          child: Image.asset(
                            "assets/images/home.png",
                            // ImageAssets.noidaauthoritylogo, // Replace with your image asset path
                            width: AppSize.s50,
                            height: AppSize.s50,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Image.asset(
                              ImageAssets.favicon, // Replace with your image asset path
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: AppSize.s145,
                      width: AppSize.s145,
                      margin: const EdgeInsets.all(AppMargin.m20),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImageAssets.roundcircle,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppMargin.m16),
                        child: Center(
                          child: Image.asset(
                            "assets/images/home.png",
                            //ImageAssets.loginIcon, // Replace with your image asset path
                            width: AppSize.s145,
                            height: AppSize.s145,
                            fit: BoxFit.contain, // Adjust as needed
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.centerLeft, // Align to the left
                        child: Text(
                          "Registration",
                          style: AppTextStyle.font14penSansBlackTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    /// Todo here we mention main code for a login ui.
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: AppPadding.p15, right: AppPadding.p15),
                                    // PHONE NUMBER TextField
                                    child: TextFormField(
                                      focusNode: userfocus,
                                      controller: _userController,
                                      textInputAction: TextInputAction.next,
                                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                                        //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Only allow digits
                                      ],
                                      decoration: const InputDecoration(
                                        labelText: "User Name",
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: AppPadding.p10,
                                          horizontal: AppPadding.p10, // Add horizontal padding
                                        ),

                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: Color(0xFF255899),
                                        ),
                                        // errorBorder
                                        // errorBorder: OutlineInputBorder(
                                        //     borderSide: BorderSide(color: Colors.green, width: 0.5))
                                      ),
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter User Name';
                                        }
                                        // if (value.length > 1 && value.length < 10) {
                                        //   return 'Enter 10 digit mobile number';
                                        // }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: AppPadding.p15, right: AppPadding.p15),
                                    // PHONE NUMBER TextField
                                    child: TextFormField(
                                      focusNode: phoneNumberfocus,
                                      controller: _phoneNumberController,
                                      textInputAction: TextInputAction.next,
                                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                                        //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Only allow digits
                                      ],
                                      decoration: const InputDecoration(
                                        labelText: AppStrings.txtMobile,
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: AppPadding.p10,
                                          horizontal: AppPadding.p10, // Add horizontal padding
                                        ),

                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: Color(0xFF255899),
                                        ),
                                        // errorBorder
                                        // errorBorder: OutlineInputBorder(
                                        //     borderSide: BorderSide(color: Colors.green, width: 0.5))
                                      ),
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter mobile number';
                                        }
                                        if (value.length > 1 && value.length < 10) {
                                          return 'Enter 10 digit mobile number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13,right: 13),
                                    child: InkWell(
                                      onTap: () async {
                                        getLocation();
                                        var phone = _phoneNumberController.text;
                                        var password = _userController.text;

                                        if(_formKey.currentState!.validate() && phone != null && password != null){
                                          // Call Api
                                          // loginMap = await LoginRepo1().authenticate(context, phone!, password!);


                                          print('---358----$loginMap');
                                          result = "${loginMap['Result']}";
                                          msg = "${loginMap['Msg']}";
                                          print('---361----$result');
                                          print('---362----$msg');
                                        }else{
                                          if(_phoneNumberController.text.isEmpty){
                                            phoneNumberfocus.requestFocus();
                                          }else if(_userController.text.isEmpty){
                                            userfocus.requestFocus();
                                          }
                                        } // condition to fetch a response form a api
                                        if(result=="1"){
                                          var iUserId = "${loginMap['Data'][0]['iUserId']}";
                                          var sName =
                                              "${loginMap['Data'][0]['sName']}";
                                          var sContactNo =
                                              "${loginMap['Data'][0]['sContactNo']}";
                                          var sDesgName =
                                              "${loginMap['Data'][0]['sDesgName']}";
                                          var iDesgCode =
                                              "${loginMap['Data'][0]['iDesgCode']}";
                                          var iDeptCode =
                                              "${loginMap['Data'][0]['iDeptCode']}";
                                          var iUserTypeCode =
                                              "${loginMap['Data'][0]['iUserTypeCode']}";
                                          var sToken =
                                              "${loginMap['Data'][0]['sToken']}";
                                          var dLastLoginAt =
                                              "${loginMap['Data'][0]['dLastLoginAt']}";
                                          var iAgencyCode =
                                              "${loginMap['Data'][0]['iAgencyCode']}";

                                          // To store value in  a SharedPreference

                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs.setString('iUserId',iUserId);
                                          prefs.setString('sName',sName);
                                          prefs.setString('sContactNo',sContactNo);
                                          prefs.setString('sDesgName',sDesgName);
                                          prefs.setString('iDesgCode',iDesgCode);
                                          prefs.setString('iDeptCode',iDeptCode);
                                          prefs.setString('iUserTypeCode',iUserTypeCode);
                                          prefs.setString('sToken',sToken);
                                          prefs.setString('dLastLoginAt',dLastLoginAt);
                                          prefs.setString('iAgencyCode',iAgencyCode);
                                          // prefs.setDouble('lat',lat!);
                                          //prefs.setDouble('long',long!);
                                          String? stringName = prefs.getString('sName');
                                          String? stringContact = prefs.getString('sContactNo');
                                          iAgencyCode = prefs.getString('iAgencyCode').toString();
                                          print('---464-----stringContact--$stringName');
                                          print('---465----stringContact----$stringContact');
                                          print('---473----iAgencyCode----$iAgencyCode');

                                          if(iAgencyCode =="1"){

                                            // Navigator.pushReplacement(
                                            //   context,
                                            //   MaterialPageRoute(builder: (context) => HomePage()),
                                            // );

                                            // print('----570---To go with $iAgencyCode---');
                                          }else{
                                            // HomeScreen_2
                                            // Navigator.pushReplacement(
                                            //   context,
                                            //   MaterialPageRoute(builder: (context) => HomeScreen_2()),
                                            // );
                                            print('----HomeScreen 2---');

                                          }
                                          // Navigator.pushReplacement(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => HomePage()),
                                          // );

                                        }else{
                                          print('----373---To display error msg---');
                                          displayToast(msg);

                                        }
                                      },
                                      child: Container(
                                        width: double.infinity, // Make container fill the width of its parent
                                        height: AppSize.s45,
                                        //  padding: EdgeInsets.all(AppPadding.p5),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF255899), // Background color using HEX value
                                          borderRadius: BorderRadius.circular(
                                              AppMargin.m10), // Rounded corners
                                        ),
                                        child: const Center(
                                          child: Text(
                                            AppStrings.txtLogin,
                                            style: TextStyle(
                                                fontSize: AppSize.s16,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13,right: 13),
                                    child: Container(
                                      height: 45,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space between texts
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => OtpPage(phone: "987195081",)),
                                              );
                                            },
                                            child: Container(
                                              child: Text(
                                                "Already a user ?",
                                                style: AppTextStyle.font14penSansBlackTextStyle,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              // Registration
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const LoginScreen_2()),
                                              );

                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10.0), // 10dp padding around the text
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Color(0xFF255899)), // Gray border color
                                                borderRadius: BorderRadius.circular(8.0), // Rounded corners for the border
                                              ),
                                              child: Text(
                                                "Login",
                                                style: AppTextStyle.font14penSansBlackTextStyle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
  // toast code
  void displayToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}



// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../../app/generalFunction.dart';
// import '../../services/login_repo.dart';
// import '../homepage/homepage.dart';
// import '../login/loginScreen_2.dart';
// import '../otp/otpverification.dart';
// import '../resources/app_text_style.dart';
// import '../resources/custom_elevated_button.dart';
// import '../resources/values_manager.dart';
//
// class Registration extends StatelessWidget {
//   const Registration({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//     );
//   }
// }
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController _phoneNumberController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _isObscured = true;
//   var loginProvider;
//
//   // focus
//   FocusNode phoneNumberfocus = FocusNode();
//   FocusNode namefocus = FocusNode();
//
//   bool passwordVisible = false;
//
//   // Visible and Unvisble value
//   int selectedId = 0;
//   var msg;
//   var result;
//   var loginMap;
//   double? lat, long;
//   GeneralFunction generalFunction = GeneralFunction();
//
//   Future<bool> _onWillPop() async {
//     return (await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text(
//               'Are you sure?',
//               style: AppTextStyle.font14OpenSansRegularBlackTextStyle,
//             ),
//             content: new Text(
//               'Do you want to exit app',
//               style: AppTextStyle.font14OpenSansRegularBlackTextStyle,
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 //<-- SEE HERE
//                 child: Text('No'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   exit(0);
//                 }, //Navigator.of(context).pop(true), // <-- SEE HERE
//                 child: Text('Yes'),
//               ),
//             ],
//           ),
//         )) ??
//         false;
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // getLocation();
//     Future.delayed(const Duration(milliseconds: 100), () {
//       // requestLocationPermission();
//       setState(() {
//         // Here you can write your code for open new view
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _phoneNumberController.dispose();
//     nameController.dispose();
//     super.dispose();
//   }
//
//   void clearText() {
//     _phoneNumberController.clear();
//     nameController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: _onWillPop,
//         child: Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               backgroundColor: Colors.red,
//               elevation: 10,
//               shadowColor: Colors.orange,
//               toolbarOpacity: 0.5,
//               leading: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const HomePage()),
//                   );
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   // Adjust padding if necessary
//                   child: Image.asset(
//                     "assets/images/back.png",
//                     fit: BoxFit
//                         .contain, // BoxFit.contain ensures the image is not distorted
//                   ),
//                 ),
//               ),
//               title: Text(
//                 'Registration',
//                 style: AppTextStyle.font16penSansExtraboldWhiteTextStyle,
//               ),
//               centerTitle: true,
//             ),
//             drawer: generalFunction.drawerFunction(
//                 context, 'Suaib Ali', '9871950881'),
//             body: Padding(
//               padding: const EdgeInsets.only(top: 25),
//               child: Form(
//                         key: _formKey,
//                         child: SingleChildScrollView(
//                           child: Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               middleHeaderPuri(context, 'Citizen Services'),
//                               SizedBox(height: 10),
//                               Container(
//                                         height: AppSize.s145,
//                                         width: MediaQuery.of(context).size.width - 50,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(8.0),
//                                           image: const DecorationImage(
//                                             image: AssetImage(
//                                               'assets/images/temple_3.png',
//                                             ),
//                                             fit: BoxFit.fill,
//                                           ),
//                                         ),
//                                     ),
//                               SizedBox(height: 20),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: AppPadding.p15, right: AppPadding.p15),
//                                 // PHONE NUMBER TextField
//                                 child: TextFormField(
//                                   focusNode: namefocus,
//                                   controller: nameController,
//                                   textInputAction: TextInputAction.next,
//                                   onEditingComplete: () =>
//                                       FocusScope.of(context).nextFocus(),
//                                   decoration: const InputDecoration(
//                                     // labelText: 'Mobile',
//                                     label: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0), // Padding for the label
//                                       child: Text('User Name'),
//                                     ),
//                                     border: OutlineInputBorder(),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.orange),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.orange),
//                                     ),
//                                     contentPadding:
//                                         EdgeInsets.symmetric(vertical: 10.0),
//                                     prefixIcon: Icon(
//                                       Icons.account_box,
//                                       color: Colors.orange,
//                                     ),
//                                   ),
//                                   autovalidateMode:
//                                       AutovalidateMode.onUserInteraction,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Enter user number';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: AppPadding.p15, right: AppPadding.p15),
//                                 // PHONE NUMBER TextField
//                                 child: TextFormField(
//                                   focusNode: phoneNumberfocus,
//                                   controller: _phoneNumberController,
//                                   textInputAction: TextInputAction.next,
//                                   onEditingComplete: () =>
//                                       FocusScope.of(context).nextFocus(),
//                                   keyboardType: TextInputType.phone,
//                                   inputFormatters: [
//                                     LengthLimitingTextInputFormatter(10),
//                                     // Limit to 10 digits
//                                     //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Only allow digits
//                                   ],
//                                   decoration: const InputDecoration(
//                                     // labelText: 'Mobile',
//                                     label: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0), // Padding for the label
//                                       child: Text('Mobile No'),
//                                     ),
//                                     border: OutlineInputBorder(),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.orange),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.orange),
//                                     ),
//                                     contentPadding:
//                                         EdgeInsets.symmetric(vertical: 10.0),
//                                     prefixIcon: Icon(
//                                       Icons.call,
//                                       color: Colors.orange,
//                                     ),
//                                   ),
//                                   autovalidateMode:
//                                       AutovalidateMode.onUserInteraction,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Enter mobile number';
//                                     }
//                                     if (value.length > 1 && value.length < 10) {
//                                       return 'Enter 10 digit mobile number';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//
//                               ElevatedButton(
//                                 child: Text('SIGNUP'),
//                                 style: ElevatedButton.styleFrom(
//                                   foregroundColor: Colors.white,
//                                   backgroundColor: Colors.red,
//                                   shadowColor: Colors.red, // Custom shadow color
//                                   elevation: 5, // Text color
//                                 ).copyWith(
//                                   overlayColor: MaterialStateProperty.resolveWith<Color?>(
//                                         (Set<MaterialState> states) {
//                                       if (states.contains(MaterialState.pressed)) {
//                                         return Colors.yellow; // Splash color when pressed
//                                       }
//                                       return null; // Default splash color
//                                     },
//                                   )),
//                                 onPressed: () async {
//                                   var phone = _phoneNumberController.text;
//                                   var name = nameController.text;
//                                   if (_formKey.currentState!.validate() &&
//                                       name != null &&
//                                       name != null) {
//                                     print('----name---$name');
//                                     print('----phone---$phone');
//                                     print('---call Api---');
//
//                                     loginMap = await RegistrationRepo()
//                                         .authenticate(context, phone!, name!);
//                                     print('-----280---$loginMap');
//                                     result = "${loginMap['Result']}";
//                                     msg = "${loginMap['Msg']}";
//                                     print('----283---msg--$msg');
//                                   } else {
//                                     if (nameController.text.isEmpty) {
//                                       namefocus.requestFocus();
//                                     } else if (_phoneNumberController
//                                         .text.isEmpty) {
//                                       phoneNumberfocus.requestFocus();
//                                     }
//                                   }
//                                   if(result=="1"){
//                                               print('----Success---');
//                                              // displayToast(msg);
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(builder: (context) => OtpPage(phone: phone)),
//                                               );
//                                               Fluttertoast.showToast(
//                                                      msg: msg,
//                                                      toastLength: Toast.LENGTH_SHORT,
//                                                      gravity: ToastGravity.CENTER,
//                                                      timeInSecForIosWeb: 1,
//                                                      textColor: Colors.white,
//                                                      fontSize: 16.0
//                                                  );
//                                   }else{
//                                     Fluttertoast.showToast(
//                                         msg: msg,
//                                         toastLength: Toast.LENGTH_SHORT,
//                                         gravity: ToastGravity.CENTER,
//                                         timeInSecForIosWeb: 1,
//                                         textColor: Colors.white,
//                                         fontSize: 16.0
//                                     );
//                                   }
//                                 },
//                               ),
//                               SizedBox(height: 10),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 15, right: 15),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const Text(
//                                       'Already a user ?',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                     SizedBox(width: 8),
//                                     // Add some spacing between the texts
//                                     GestureDetector(
//                                       onTap: () {
//                                         //Handle the click event
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   LoginScreen_2()),
//                                         );
//                                       },
//                                       child: const Text(
//                                         'Login',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           color: Colors.blue,
//                                           decoration: TextDecoration.underline,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                              // SizedBox(height: 10),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                     // Spacer(),
//                     // Padding(
//                     //   padding: const EdgeInsets.only(left: 80),
//                     //   child: Align(
//                     //     alignment: Alignment.bottomCenter,
//                     //     child: Padding(
//                     //         padding: EdgeInsets.only(bottom: 5.0, left: 15),
//                     //         child: Column(
//                     //           mainAxisAlignment: MainAxisAlignment.start,
//                     //           children: [
//                     //             Padding(
//                     //               padding: const EdgeInsets.only(right: 80),
//                     //               child: Text('Powered by :',
//                     //                   style: AppTextStyle
//                     //                       .font14OpenSansRegularBlackTextStyle),
//                     //             ),
//                     //             Row(
//                     //               mainAxisAlignment: MainAxisAlignment.start,
//                     //               children: <Widget>[
//                     //                 const Text(
//                     //                   'Synergy Telmatics Pvt.Ltd.',
//                     //                   style: TextStyle(
//                     //                     fontFamily: 'Montserrat',
//                     //                     color: Color(0xffF37339), //#F37339
//                     //                     fontSize: 14.0,
//                     //                     fontWeight: FontWeight.bold,
//                     //                   ),
//                     //                 ),
//                     //                 SizedBox(width: 10),
//                     //                 Padding(
//                     //                   padding:
//                     //                       EdgeInsets.only(right: AppSize.s10),
//                     //                   child: SizedBox(
//                     //                     width: 25,
//                     //                     height: 25,
//                     //                     child: Image.asset(
//                     //                       'assets/images/favicon.png',
//                     //                       width: 25,
//                     //                       height: 25,
//                     //                       fit: BoxFit
//                     //                           .fill, // Changed BoxFit to fill
//                     //                     ),
//                     //                   ),
//                     //                 ),
//                     //               ],
//                     //             ),
//                     //           ],
//                     //         )),
//                     //   ),
//                     // ),
//             )
//                 ));
//
//
//   }
//
//   void _showToast(BuildContext context, String msg) {
//     final scaffold = ScaffoldMessenger.of(context);
//     scaffold.showSnackBar(
//       SnackBar(
//         content: Text('$msg'),
//         action: SnackBarAction(
//             label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
//       ),
//     );
//   }
//
//   // toast code
//   void displayToast(String msg) {
//     Fluttertoast.showToast(
//         msg: msg,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }
// }
