import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../app/generalFunction.dart';
import '../../services/sendOTPForCitizenLogin.dart';
import '../homepage/homepage.dart';
import '../otp/otpverification.dart';
import '../registration/registration.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_style.dart';
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

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: AppTextStyle.font14OpenSansRegularBlackTextStyle,
            ),
            content: new Text(
              'Do you want to exit app',
              style: AppTextStyle.font14OpenSansRegularBlackTextStyle,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                //<-- SEE HERE
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
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.red,
            elevation: 10,
            shadowColor: Colors.orange,
            toolbarOpacity: 0.5,
            leading: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
                },
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Adjust padding if necessary
                child: Image.asset(
                  "assets/images/back.png",
                  fit: BoxFit.contain, // BoxFit.contain ensures the image is not distorted
                ),
              ),
            ),
            title: Text('Login',
              style: AppTextStyle.font16penSansExtraboldWhiteTextStyle,
            ),
            centerTitle: true,
          ),

          drawer: generalFunction.drawerFunction(
              context, 'Suaib Ali', '9871950881'),
          body: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                  children: <Widget>[
                    middleHeaderPuri(context, 'Citizen Services'),
                    Container(
                        height: AppSize.s145,
                        width: MediaQuery.of(context).size.width - 50,
                        margin: const EdgeInsets.all(AppMargin.m20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/temple_3.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Container()),
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

                              child: TextFormField(
                                focusNode: phoneNumberfocus,
                                controller: _phoneNumberController,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  // Limit to 10 digits
                                  //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Only allow digits
                                ],
                                decoration: const InputDecoration(
                                 // labelText: 'Mobile',
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding for the label
                                    child: Text('Mobile'),
                                  ),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.orange),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.orange,
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
                                    if (_formKey.currentState!.validate() &&
                                        phone != null) {
                                      // Call Api
                                      print('-----311----phone---$phone');
                                      loginMap =
                                          await SendOtpForCitizenLoginRepo()
                                              .sendOtpForCitizenLogin(
                                                  context, phone!);

                                      print('---311----$loginMap');
                                      result = "${loginMap['Result']}";
                                      msg = "${loginMap['Msg']}";
                                      print('---315----$result');
                                      print('---316----$msg');
                                    } else {
                                      if (_phoneNumberController.text.isEmpty) {
                                        phoneNumberfocus.requestFocus();
                                      } else if (passwordController
                                          .text.isEmpty) {
                                        passWordfocus.requestFocus();
                                      }
                                    } // condition to fetch a response form a api
                                    if (result == "1") {
                                      print('--Login Success---');
                                      _showToast(context, msg);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OtpPage(
                                                phone: _phoneNumberController
                                                    .text)),
                                      );
                                    } else {
                                      _showToast(context, msg);
                                      print(
                                          '----373---To display error msg---');
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'If you are a new user?',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(width: 8),
                                  // Add some spacing between the texts
                                  GestureDetector(
                                    onTap: () {
                                      //Handle the click event
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Registration()),
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
                    Spacer(),
                    Padding(
                     padding: const EdgeInsets.only(left: 80),
                     child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5.0, left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 80),
                                  child: Text('Powered by :',style: AppTextStyle.font14OpenSansRegularBlackTextStyle),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>
                                  [
                                    const Text(
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
                              ],
                            )
                          ),
                        ),
                   ),
                  ],
                ),
              ))
    );
  }

  void _showToast(BuildContext context, String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('$msg'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
