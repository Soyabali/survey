import 'package:flutter/material.dart';

import '../resources/custom_elevated_button.dart';
import '../resources/values_manager.dart';


class FeedbackBottomSheet extends StatelessWidget {

  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedbackForm(),
    );
  }
}
class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {

  TextEditingController _feedbackController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode namefocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
  void clearText() {
    _feedbackController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Form(
           key: _formKey,
           child: SingleChildScrollView(
             child: Column(
               children: <Widget>[
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
                 ),
                 SizedBox(height: 10),
                 Padding(
                   padding: const EdgeInsets.only(
                     left: 15, // Adjusted padding value
                     right: 15, // Adjusted padding value
                   ),
                   child: Container(
                     height: 80, // Adjusted container height
                     child: TextFormField(
                       focusNode: namefocus,
                       controller: _feedbackController,
                       minLines: 2, // Minimum number of lines
                       maxLines: 2, // Maximum number of lines
                       textInputAction: TextInputAction.next,
                       onEditingComplete: () => FocusScope.of(context).nextFocus(),
                       decoration: const InputDecoration(
                         label: Padding(
                           padding: EdgeInsets.symmetric(horizontal: 8.0), // Padding for the label
                           child: Text('Enter Feedback'),
                         ),
                         border: OutlineInputBorder(),
                         focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.orange),
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.orange),
                         ),
                         contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Adjusted content padding
                         prefixIcon: Icon(
                           Icons.feedback,
                           color: Colors.orange,
                         ),
                       ),
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Enter Feedback';
                         }
                         return null;
                       },
                     ),
                   ),
                 ),
                 // Padding(
                 //   padding: const EdgeInsets.only(
                 //       left: AppPadding.p15, right: AppPadding.p15),
                 //   child: Container(
                 //     height: 40,
                 //     child: TextFormField(
                 //       focusNode: namefocus,
                 //       controller: _feedbackController,
                 //       maxLines: 2,
                 //       textInputAction: TextInputAction.next,
                 //       onEditingComplete: () =>
                 //           FocusScope.of(context).nextFocus(),
                 //       decoration: const InputDecoration(
                 //         // labelText: 'Mobile',
                 //         label: Padding(
                 //           padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding for the label
                 //           child: Text('Enter Feedback'),
                 //         ),
                 //         border: OutlineInputBorder(),
                 //         focusedBorder: OutlineInputBorder(
                 //           borderSide: BorderSide(color: Colors.orange),
                 //         ),
                 //         enabledBorder: OutlineInputBorder(
                 //           borderSide: BorderSide(color: Colors.orange),
                 //         ),
                 //         contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                 //         prefixIcon: Icon(
                 //           Icons.feedback,
                 //           color: Colors.orange,
                 //         ),
                 //       ),
                 //       autovalidateMode:
                 //       AutovalidateMode.onUserInteraction,
                 //       validator: (value) {
                 //         if (value!.isEmpty) {
                 //           return 'Enter Feedback';
                 //         }
                 //         return null;
                 //       },
                 //     ),
                 //   ),
                 //
                 // ),
                 SizedBox(height: 20),
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
                       text: 'Submit Feedback',
                       onTap: () async {
                         //  getLocation();
                         // var phone = _phoneNumberController.text;
                         //
                         // if (_formKey.currentState!.validate() &&
                         //     phone != null) {
                         //   // Call Api
                         //   print('-----311----phone---$phone');
                         //   loginMap =
                         //   await SendOtpForCitizenLoginRepo()
                         //       .sendOtpForCitizenLogin(
                         //       context, phone!);
                         //
                         //   print('---311----$loginMap');
                         //   result = "${loginMap['Result']}";
                         //   msg = "${loginMap['Msg']}";
                         //   print('---315----$result');
                         //   print('---316----$msg');
                         // } else {
                         //   if (_phoneNumberController.text.isEmpty) {
                         //     phoneNumberfocus.requestFocus();
                         //   } else if (passwordController
                         //       .text.isEmpty) {
                         //     passWordfocus.requestFocus();
                         //   }
                         // } // condition to fetch a response form a api
                         // if (result == "1") {
                         //   print('--Login Success---');
                         //   _showToast(context, msg);
                         //   Navigator.push(
                         //     context,
                         //     MaterialPageRoute(
                         //         builder: (context) => OtpPage(
                         //             phone: _phoneNumberController
                         //                 .text)),
                         //   );
                         // } else {
                         //   _showToast(context, msg);
                         //   print(
                         //       '----373---To display error msg---');
                         // }
                       },
                     ),
                   ),
                 ),

               ],
             ),
           ),
         ),

    );
  }
}
