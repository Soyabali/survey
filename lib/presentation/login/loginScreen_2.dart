import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/generalFunction.dart';
import '../registration/registration.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_style.dart';
import '../resources/assets_manager.dart';
import '../resources/custom_elevated_button.dart';
import '../resources/values_manager.dart';

class LoginScreen_2 extends StatelessWidget {
  const LoginScreen_2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;
  var loginProvider;

  // focus
  FocusNode phoneNumberfocus = FocusNode();
  FocusNode passWordfocus = FocusNode();

  bool passwordVisible = false;
  // Visible and Unvisble value
  int selectedId = 0;
  var msg;
  var result;
  var loginMap;
  double? lat, long;
  GeneralFunction generalFunction = GeneralFunction();

  // void getLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   lat = position.latitude;
  //   long = position.longitude;
  //
  // }
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
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            }, //Navigator.of(context).pop(true), // <-- SEE HERE
            child: Text('Yes'),
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
    passwordController.dispose();
    super.dispose();
  }
  void clearText() {
    _phoneNumberController.clear();
    passwordController.clear();
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //     builder: (context) =>
                      // const ForgotPassword()));

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
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: getAppBarBack(context,"Login"),
          drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),

          body: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SingleChildScrollView(
                child:  Column(
                  children: <Widget>[
                    middleHeaderPuri(context,'Citizen Services'),
                    Container(
                      height: AppSize.s145,
                      width: MediaQuery.of(context).size.width-50,
                      margin: const EdgeInsets.all(AppMargin.m20),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/temple_3.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container()
                    ),
                    /// Todo here we mention main code for a login ui.
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p15, right: AppPadding.p15),
                              // PHONE NUMBER TextField
                              child: TextFormField(
                                focusNode: phoneNumberfocus,
                                controller: _phoneNumberController,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                                  //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Only allow digits
                                ],
                                decoration: const InputDecoration(
                                  labelText: AppStrings.txtMobile,
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: AppPadding.p10),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Color(0xFF255899),
                                  ),
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
                            /// LoginButton code and onclik Operation
                            Center(
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  // Background color of the container
                                  borderRadius: BorderRadius.circular(28.0),
                                  // Circular border radius
                                  border: Border.all(
                                    color: Colors.yellow, // Border color
                                    width: 0.5, // Border width
                                  ),
                                ),
                                child: CustomElevatedButton(
                                  text: 'Login',
                                  onTap: () async {
                                      //  getLocation();
                                         var phone = _phoneNumberController.text;
                                         var password = passwordController.text;
                                         if(_formKey.currentState!.validate() && phone != null && password != null){
                                           // Call Api
                                           //      loginMap = await LoginRepo1()
                                           //        .authenticate(context, phone!, password!);

                                                   print('---358----$loginMap');
                                                   result = "${loginMap['Result']}";
                                                   msg = "${loginMap['Msg']}";
                                                   print('---361----$result');
                                                   print('---362----$msg');
                                         }else{
                                           if(_phoneNumberController.text.isEmpty){
                                             phoneNumberfocus.requestFocus();
                                           }else if(passwordController.text.isEmpty){
                                             passWordfocus.requestFocus();
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
                                                "${loginMap['Data'][0]['dLastLoginAt']}";  // iAgencyCode
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
                                            String? stringName = prefs.getString('sName');
                                            String? stringContact = prefs.getString('sContactNo');
                                            print('---464-----stringContact--$stringName');
                                            print('---465----stringContact----$stringContact');
                                            print('---xxxxxxx-----');
                                            if(iAgencyCode=="1"){

                                           //   toastSuccess(context,msg);

                                              //
                                            }else{
                                             // toastSuccess(context,msg);

                                              // PendingInternalComplaintV2
                                              // Navigator.pushReplacement(
                                              //   context,
                                              //   MaterialPageRoute(builder: (context) => PendingInternalComplaintV2()),
                                              // );
                                             print('----create a new Screen CompaintSTatus new---');
                                            }
                                        }else{
                                          //toastError(context,msg);
                                          print('----373---To display error msg---');
                                          //displayToast(msg);
                                        }
                                        },

                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'If you are a new user?',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 8), // Add some spacing between the texts
                              GestureDetector(
                                onTap: () {
                                  //Handle the click event
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Registration()),
                                  );
                                },
                                child: const Text(
                                  'Register Here',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
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
                  ],
                ),
              ))),
    );
  }
}
