import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/generalFunction.dart';
import '../../resources/app_text_style.dart';
import '../../resources/custom_elevated_button.dart';
import '../../resources/values_manager.dart';

class OnlineComplaintForm extends StatefulWidget {
  final complaintName;

  OnlineComplaintForm({super.key, this.complaintName});
  @override
  State<OnlineComplaintForm> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<OnlineComplaintForm> {
  GeneralFunction generalFunction = GeneralFunction();
  final _formKey = GlobalKey<FormState>();
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
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  // focus
  FocusNode locationfocus = FocusNode();
  FocusNode descriptionfocus = FocusNode();
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
                  style: AppTextStyle.font14penSansExtraboldBlack45TextStyle,
                  children: <TextSpan>[
                    TextSpan(
                        text: '',
                        style: AppTextStyle
                            .font14penSansExtraboldBlack45TextStyle),
                  ],
                ),
              ), // Not necessary for Option 1
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
              ), // Not necessary for Option 1
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
    print('-----27--${widget.complaintName}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack('${widget.complaintName}'),
      drawer:
          generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: ListView(
        children: <Widget>[
          middleHeader(context, '${widget.complaintName}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.invert_colors_on_sharp, size: 20),
              SizedBox(width: 5),
              Text('Fill the below details',
                  style: AppTextStyle.font16penSansExtraboldBlack45TextStyle)
            ],
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15,bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.5), // Color of the shadow
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset of the shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15,bottom: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(left: 0, right: 10, top: 10),
                            child: Image.asset(
                              'assets/images/ic_expense.png', // Replace with your image asset path
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('Fill the below details',
                                style: AppTextStyle
                                    .font16penSansExtraboldBlack45TextStyle),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 0, right: 2, bottom: 2),
                                child: const Icon(
                                  Icons.forward_sharp,
                                  size: 12,
                                  color: Colors.black54,
                                )),
                            Text('Category',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
                          ],
                        ),
                      ),
                      //_bindMarkLocation(),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Container(
                          height: 42,
                          color: Color(0xFFf2f3f5),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              focusNode: locationfocus,
                              controller: _locationController,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: const InputDecoration(
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
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 0, right: 2),
                                child: const Icon(
                                  Icons.forward_sharp,
                                  size: 12,
                                  color: Colors.black54,
                                )),
                            Text('Sub Category',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
                          ],
                        ),
                      ),
                      _bindSubCategory(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 0, right: 2),
                                child: const Icon(
                                  Icons.forward_sharp,
                                  size: 12,
                                  color: Colors.black54,
                                )),
                            Text('Ward',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
                          ],
                        ),
                      ),
                      _bindWard(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 0, right: 2),
                                child: const Icon(
                                  Icons.forward_sharp,
                                  size: 12,
                                  color: Colors.black54,
                                )),
                            Text('Address',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
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
                              focusNode: locationfocus,
                              controller: _locationController,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: const InputDecoration(
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
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 0, right: 2),
                                child: const Icon(
                                  Icons.forward_sharp,
                                  size: 12,
                                  color: Colors.black54,
                                )),
                            Text('Landmark',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Container(
                          height: 42,
                          //  color: Colors.black12,
                          color: Color(0xFFf2f3f5),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              focusNode: descriptionfocus,
                              controller: _descriptionController,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: const InputDecoration(
                                // labelText: AppStrings.txtMobile,
                                //  border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppPadding.p10),
                                //prefixIcon: Icon(Icons.phone,color:Color(0xFF255899),),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Enter Description';
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 0, right: 2),
                                child: const Icon(
                                  Icons.forward_sharp,
                                  size: 12,
                                  color: Colors.black54,
                                )),
                            Text('Mention your concerns here',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: Container(
                          height: 42,
                          //  color: Colors.black12,
                          color: Color(0xFFf2f3f5),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              focusNode: descriptionfocus,
                              controller: _descriptionController,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: const InputDecoration(
                                // labelText: AppStrings.txtMobile,
                                //  border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: AppPadding.p10),
                                //prefixIcon: Icon(Icons.phone,color:Color(0xFF255899),),
                              ),
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Enter Description';
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 0, right: 2),
                                child: const Icon(
                                  Icons.forward_sharp,
                                  size: 12,
                                  color: Colors.black54,
                                )),
                            Text('Upload Photo',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
                          ],
                        ),
                      ),
                      //ContainerWithRow(),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFf2f3f5),
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Click Photo',
                                        style: AppTextStyle
                                            .font14penSansExtraboldBlack45TextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // pickImage();
                                  // _getImageFromCamera();
                                  pickImage();
                                  print('---------530-----');
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 10, top: 5),
                                  //child: Image(image: AssetImage('assets/images/ic_camera.PNG'),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/ic_camera.PNG'),
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            image != null
                                ? Stack(
                                    children: [
                                      GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             FullScreenPage(
                                          //               child: image!,
                                          //               dark: true,
                                          //             )));
                                        },
                                        child: Container(
                                            color: Colors.lightGreenAccent,
                                            height: 100,
                                            width: 70,
                                            child: Image.file(
                                              image!,
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      Positioned(
                                          bottom: 65,
                                          left: 35,
                                          child: IconButton(
                                            onPressed: () {
                                              image = null;
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.red,
                                              size: 30,
                                            ),
                                          ))
                                    ],
                                  )
                                : Text("Photo is required.",
                                    style: AppTextStyle
                                        .font14penSansExtraboldRedTextStyle),
                          ]),
                      SizedBox(height: 5),
                      Center(
                        child: Container(
                          height: 45,
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
                            text: 'Post Grievance',
                            onTap: () {
                              print('---Live Darshan-----');
                              // Navigator.of(context).push(MaterialPageRoute(builder: (_) => TempleGallery(
                              //)));
                            },
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       var location = _locationController.text;
                      //       // apply condition
                      //       if (_formKey.currentState!.validate()) {
                      //         print('---call Api---');
                      //         //   var markPointSubmitResponse =
                      //       } else {
                      //         if (_dropDownValueMarkLocation == null) {
                      //           //  displayToast('select Point Type');
                      //         } else if (_dropDownValueDistric == null) {
                      //           //displayToast('select sector');
                      //         } else if (location == "") {}
                      //       }
                      //       // if(result2=="1"){
                      //       //   displayToast(msg2);
                      //       //   //Navigator.pop(context);
                      //       //   // Navigator.push(
                      //       //   //   context,
                      //       //   //   MaterialPageRoute(
                      //       //   //       builder: (context) => const HomePage()),
                      //       //   // );
                      //       // }else{
                      //       //   displayToast(msg2);
                      //     },
                      //     /// Todo next Apply condition
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Color(
                      //           0xFF255899), // Hex color code (FF for alpha, followed by RGB)
                      //     ),
                      //     child: const Text(
                      //       "Submit",
                      //       style: TextStyle(
                      //           fontFamily: 'Montserrat',
                      //           color: Colors.white,
                      //           fontSize: 16.0,
                      //           fontWeight: FontWeight.bold),
                      //     ))
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
