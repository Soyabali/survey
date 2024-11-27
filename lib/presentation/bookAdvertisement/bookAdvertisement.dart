import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/generalFunction.dart';
import '../resources/app_text_style.dart';
import '../resources/values_manager.dart';

class BookAdvertisement extends StatefulWidget {

  final complaintName;
  var bookAdvertisement;

  BookAdvertisement(this.bookAdvertisement, {super.key, this.complaintName});

  @override
  State<BookAdvertisement> createState() => _BookAdvertisementState();
}

class _BookAdvertisementState extends State<BookAdvertisement> {
  // Date PICKER
  DateTime selectedDate = DateTime.now();
  GeneralFunction generalFunction = GeneralFunction();
  final _formKey = GlobalKey<FormState>();
  String _toDate = 'To Date';
  String _fromDate = 'From Date';
  File? image;
  List distList = [];
  var _dropDownValueDistric;
  List stateList = [];
  List blockList = [];
  List marklocationList = [];
  var _dropDownValueMarkLocation;
  var _selectedPointId;
  var _selectedBlockId;

  // Focus
  FocusNode namefieldfocus = FocusNode();
  final distDropdownFocus = GlobalKey();

  // controller
  TextEditingController contentController = TextEditingController();
  TextEditingController contentDescriptionController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  // focus
  FocusNode contentfocus = FocusNode();
  FocusNode contentDescriptionfocus = FocusNode();

  // PickImage
  Future pickImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sToken = prefs.getString('sToken');
    print('---Token----113--$sToken');

    try {
      final pickFileid = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 65);
      if (pickFileid != null) {
        image = File(pickFileid.path);
        setState(() {});
        print('Image File path Id Proof-------135----->$image');
        // multipartProdecudre();
        // uploadImage(sToken!, image!);
      } else {
        print('no image selected');
      }
    } catch (e) {}
  }

  /// Todo bind SubCategory
  Widget _bindSubCategory() {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 42,
        color: Color(0xFFf2f3f5),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              hint: RichText(
                text: TextSpan(
                  text: "Select Sub Category",
                  style: AppTextStyle.font16penSansExtraboldBlack54TextStyle,
                  children: <TextSpan>[
                    TextSpan(
                        text: '',
                        style: AppTextStyle
                            .font14penSansExtraboldBlack45TextStyle),
                  ],
                ),
              ),
              // Not necessary for Option 1
              value: _dropDownValueMarkLocation,
              // key: distDropdownFocus,
              onChanged: (newValue) {
                setState(() {
                  _dropDownValueMarkLocation = newValue;
                  print('---333-------$_dropDownValueMarkLocation');
                  //  _isShowChosenDistError = false;
                  // Iterate the List
                  marklocationList.forEach((element) {
                    if (element["sPointTypeName"] ==
                        _dropDownValueMarkLocation) {
                      setState(() {
                        _selectedPointId = element['iPointTypeCode'];
                        print('----341------$_selectedPointId');
                      });
                      print('-----Point id----241---$_selectedPointId');
                      if (_selectedPointId != null) {
                        // updatedBlock();
                        print('-----Point id----244---$_selectedPointId');
                      } else {
                        print('-------');
                      }
                      // print("Distic Id value xxxxx.... $_selectedDisticId");
                      print("Distic Name xxxxxxx.... $_dropDownValueDistric");
                      print("Block list Ali xxxxxxxxx.... $blockList");
                    }
                  });
                });
              },
              items: marklocationList.map((dynamic item) {
                return DropdownMenuItem(
                  child: Text(item['sPointTypeName'].toString()),
                  value: item["sPointTypeName"].toString(),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  // bindi ward
  Widget _bindWard() {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 42,
        color: Color(0xFFf2f3f5),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              hint: RichText(
                text: TextSpan(
                  text: "Select Ward",
                  style: AppTextStyle.font14penSansExtraboldBlack45TextStyle,
                  children: <TextSpan>[
                    TextSpan(
                        text: '',
                        style: AppTextStyle
                            .font14penSansExtraboldBlack45TextStyle),
                  ],
                ),
              ),
              // Not necessary for Option 1
              value: _dropDownValueMarkLocation,
              // key: distDropdownFocus,
              onChanged: (newValue) {
                setState(() {
                  _dropDownValueMarkLocation = newValue;
                  print('---333-------$_dropDownValueMarkLocation');
                  //  _isShowChosenDistError = false;
                  // Iterate the List
                  marklocationList.forEach((element) {
                    if (element["sPointTypeName"] ==
                        _dropDownValueMarkLocation) {
                      setState(() {
                        _selectedPointId = element['iPointTypeCode'];
                        print('----341------$_selectedPointId');
                      });
                      print('-----Point id----241---$_selectedPointId');
                      if (_selectedPointId != null) {
                        // updatedBlock();
                        print('-----Point id----244---$_selectedPointId');
                      } else {
                        print('-------');
                      }
                      // print("Distic Id value xxxxx.... $_selectedDisticId");
                      print("Distic Name xxxxxxx.... $_dropDownValueDistric");
                      print("Block list Ali xxxxxxxxx.... $blockList");
                    }
                  });
                });
              },
              items: marklocationList.map((dynamic item) {
                return DropdownMenuItem(
                  child: Text(item['sPointTypeName'].toString()),
                  value: item["sPointTypeName"].toString(),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    print('-----27--${widget.bookAdvertisement}');
    super.initState();
    contentController = TextEditingController();
    contentDescriptionController = TextEditingController();
    //BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    // BackButtonInterceptor.remove(myInterceptor);
    contentController.dispose();
    contentDescriptionController.dispose();
    contentfocus.dispose();
    contentDescriptionfocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack(context, '${widget.bookAdvertisement}'),
      drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: ListView(
        children: <Widget>[
          // middleHeader(context, '${widget.complaintName}'),
          //SizedBox(height: 12),
          SizedBox(
            height: 150, // Height of the container
            child: Image.asset(
              'assets/images/onlinecomplaint.jpeg',
              fit: BoxFit.cover, // Adjust the image fit to cover the container
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 100, top: 10),
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Color of the shadow
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset of the shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(left: 0, right: 10, top: 10),
                            child: Image.asset(
                              'assets/images/ic_expense.png',
                              // Replace with your image asset path
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('Fill the below details',
                                style: AppTextStyle
                                    .font16penSansExtraboldBlack54TextStyle),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black54),
                            ),
                            SizedBox(width: 5),
                            Text('Advertisement Place Type',
                                style: AppTextStyle
                                    .font16penSansExtraboldBlack54TextStyle),
                          ],
                        ),
                      ),
                      _bindSubCategory(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black54),
                            ),
                            SizedBox(width: 5),
                            Text('Advertisement Place',
                                style: AppTextStyle
                                    .font16penSansExtraboldBlack54TextStyle),
                          ],
                        ),
                      ),
                      _bindSubCategory(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black54),
                            ),
                            SizedBox(width: 5),
                            Text('Advertisement Plan',
                                style: AppTextStyle
                                    .font16penSansExtraboldBlack54TextStyle),
                          ],
                        ),
                      ),
                      _bindSubCategory(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black54),
                            ),
                            SizedBox(width: 5),
                            Text('Content Type',
                                style: AppTextStyle
                                    .font16penSansExtraboldBlack54TextStyle),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Container(
                          height: 42,
                          color: Color(0xFFf2f3f5),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              focusNode: contentfocus,
                              controller: contentController,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // labelText: AppStrings.txtMobile,
                                // border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppPadding.p10),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Enter location';
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black54),
                            ),
                            SizedBox(width: 5),
                            Text('Content Description',
                                style: AppTextStyle
                                    .font16penSansExtraboldBlack54TextStyle),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Container(
                          height: 42,
                          color: Color(0xFFf2f3f5),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              focusNode: contentDescriptionfocus,
                              controller: contentDescriptionController,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // labelText: AppStrings.txtMobile,
                                // border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppPadding.p10),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Enter location';
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      /// TODO pick date and as a ui TO Date and FromDATE
                      Row(
                        children: [
                          // First Container
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('dd/MMM/yyyy')
                                          .format(pickedDate);
                                  setState(() {
                                    _fromDate = formattedDate;
                                  });
                                }
                              },
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/calendar.png'),
                                        width: 30.0,
                                        height: 30.0,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        _fromDate,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Second Container
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('dd/MMM/yyyy')
                                          .format(pickedDate);
                                  setState(() {
                                    _toDate = formattedDate;
                                  });
                                }
                              },
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/calendar.png'),
                                        width: 30.0,
                                        height: 30.0,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        _toDate,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Container(
                          width: double.infinity,
                          // Make container fill the width of its parent
                          height: AppSize.s45,
                          padding: EdgeInsets.all(AppPadding.p5),
                          decoration: BoxDecoration(
                            color: Color(0xFF255898),
                            // Background color using HEX value
                            borderRadius: BorderRadius.circular(AppMargin.m10), // Rounded corners
                          ),
                          //  #00b3c7
                          child: Center(
                            child: Text(
                              "Submit",
                              style: AppTextStyle
                                  .font16OpenSansRegularWhiteTextStyle,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
