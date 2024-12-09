import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import '../../../app/generalFunction.dart';
import '../../../app/loader_helper.dart';
import '../../../services/baseurl.dart';
import '../../../services/bindCityzenWardRepo.dart';
import '../../../services/bindSubCategoryRepo.dart';
import '../../../services/markpointSubmit.dart';
import '../../resources/app_text_style.dart';

class PropertyAssessment extends StatefulWidget {

  var name, iCategoryCode;

  PropertyAssessment({super.key, required this.name, required this.iCategoryCode});

  @override
  State<PropertyAssessment> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PropertyAssessment> {

  List stateList = [];
  List<dynamic> subCategoryList = [];
  List<dynamic> wardList = [];
  List<dynamic> bindreimouList = [];
  List blockList = [];
  List shopTypeList = [];
  var result2, msg2;

  bool isFormVisible = true; // Track the visibility of the form
  bool isIconRotated = false;


  bindSubCategory(String subCategoryCode) async {
    subCategoryList = (await BindSubCategoryRepo().bindSubCategory(context,subCategoryCode))!;
    print(" -----xxxxx-  subCategoryList--43---> $subCategoryList");
    setState(() {});
  }

  bindWard() async {
    wardList = await BindCityzenWardRepo().getbindWard();
    print(" -----xxxxx-  wardList--50---> $wardList");
    setState(() {});
  }

  var msg;
  var result;
  var SectorData;
  var stateblank;
  final stateDropdownFocus = GlobalKey();

  TextEditingController _addressController = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();
  TextEditingController _mentionController = TextEditingController();

  FocusNode _addressfocus = FocusNode();
  FocusNode _landmarkfocus = FocusNode();
  FocusNode _wardfocus = FocusNode();

  String? todayDate;
  String? consumableList;
  int count = 0;
  List? data;
  List? listCon;

  //var _dropDownSector;
  var dropDownSubCategory;
  var _dropDownWard;
  var sectorresponse;
  String? sec;
  final distDropdownFocus = GlobalKey();
  final subCategoryFocus = GlobalKey();
  final wardFocus = GlobalKey();
  File? _imageFile;
  var _selectedShopId;
  var _selectedSubCategoryId;
  var _selectedWardId;
  final _formKey = GlobalKey<FormState>();
  var iUserTypeCode;
  var userId;
  var slat;
  var slong;
  File? image;
  var uplodedImage;
  double? lat, long;

  // pick image from a Camera

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
        print('Image File path Id Proof-------167----->$image');
        // multipartProdecudre();
        uploadImage(sToken!, image!);
      } else {
        print('no image selected');
      }
    } catch (e) {}
  }

  // generateRandomNumber
  String generateRandom20DigitNumber() {
    final Random random = Random();
    String randomNumber = '';

    for (int i = 0; i < 10; i++) {
      randomNumber += random.nextInt(10).toString();
    }

    return randomNumber;
  }

  Future<void> uploadImage(String token, File imageFile) async {
    print("--------225---tolen---$token");
    print("--------226---imageFile---$imageFile");
    var baseURL = BaseRepo().baseurl;
    var endPoint = "PostImage/PostImage";
    var uploadImageApi = "$baseURL$endPoint";
    try {
      print('-----xx-x----214----');
      showLoader();
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST', Uri.parse('$uploadImageApi'),
      );
      // Add headers
      //request.headers['token'] = '04605D46-74B1-4766-9976-921EE7E700A6';
      request.headers['token'] = token;
      request.headers['sFolder'] = 'CompImage';
      // Add the image file as a part of the request
      request.files.add(await http.MultipartFile.fromPath('sFolder',imageFile.path,
      ));
      // Send the request
      var streamedResponse = await request.send();
      // Get the response
      var response = await http.Response.fromStream(streamedResponse);

      // Parse the response JSON
      var responseData = json.decode(response.body); // No explicit type casting
      print("---------248-----$responseData");
      if (responseData is Map<String, dynamic>) {
        // Check for specific keys in the response
        uplodedImage = responseData['Data'][0]['sImagePath'];
        print('Uploaded Image Path----194--: $uplodedImage');
      } else {
        print('Unexpected response format: $responseData');
      }

      hideLoader();
    } catch (error) {
      hideLoader();
      print('Error uploading image: $error');
    }
  }

  // build dialog sucess
  Widget _buildDialogSucces2(BuildContext context, String msg) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: 190,
            padding: EdgeInsets.fromLTRB(20, 45, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 0),
                // Space for the image
                //  Text('Success', style: AppTextStyle.font16OpenSansRegularBlackTextStyle),
                SizedBox(height: 10),
                Text(
                  msg,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const ExpenseManagement()),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        // Set the background color to white
                        foregroundColor:
                        Colors.black, // Set the text color to black
                      ),
                      child: Text('Ok',
                          style:
                          AppTextStyle.font16OpenSansRegularBlackTextStyle),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: -30, // Position the image at the top center
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueAccent,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/sussess.jpeg',
                  // Replace with your asset image path
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    bindWard();
    generateRandom20DigitNumber();
    super.initState();
    _addressfocus = FocusNode();
    _landmarkfocus = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _addressController.dispose();
    _landmarkController.dispose();
    _mentionController.dispose();
    FocusScope.of(context).unfocus();
  }



  /// Algo.  First of all create repo, secodn get repo data in the main page after that apply list data on  dropdown.
  // function call

  void validateAndCallApi() async {
    // Trim values to remove leading/trailing spaces

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Contact No
    String? sContactNo = prefs.getString('sContactNo');
    // random number
    String random20DigitNumber = generateRandom20DigitNumber();

    // TextFormField value
    var address = _addressController.text.trim();
    var landmark = _landmarkController.text.trim();
    var mentionYourConcerns = _mentionController.text.trim();
    // Debug logs
    print('---iCompCode----$random20DigitNumber');
    print("--iSubCategoryCode--: $_selectedSubCategoryId");
    print("---sWardCode--: $_selectedWardId");
    print("---sAddress---: $address");
    print("---sLandmark---: $landmark");
    print("---sComplaintDetails--: $mentionYourConcerns");
    print('---sComplaintPhoto----$uplodedImage');
    print("sPostedBy: $sContactNo");
    print("---fLatitude-- :    $lat");
    print("---fLongitude-- :    $long");
    // Check Form Validation
    final isFormValid = _formKey.currentState!.validate();
    print("Form Validation: $isFormValid");

    // Validate all conditions
    if (isFormValid &&
        _selectedSubCategoryId != null &&
        _selectedWardId != null &&
        address.isNotEmpty &&
        landmark.isNotEmpty &&
        mentionYourConcerns.isNotEmpty &&
        uplodedImage!=null) {
      // All conditions met; call the API
      print('---Call API---');

      var onlineComplaintResponse = await OnlineComplaintFormRepo().onlineComplaintFormApi(
          context,
          random20DigitNumber,
          _selectedSubCategoryId,
          _selectedWardId,
          address,
          landmark,
          mentionYourConcerns,
          uplodedImage,
          sContactNo,
          lat,
          long
      );
      print('----562---$onlineComplaintResponse');
      result2 = onlineComplaintResponse['Result'];
      msg2 = onlineComplaintResponse['Msg'];
      if(result2=="1"){
        displayToast(msg2);
        Navigator.pop(context);
      }else{
        displayToast(msg2);
      }
      //displayToast(msg2);
      // print('---806---xxxxx----$result');
      //print('---807--$msg');

      // call here to api
      // Your API call logic here
    } else {
      // If conditions fail, display appropriate error messages
      print('--Not Call API--');
      if (_selectedSubCategoryId == null) {
        displayToast('Select Sub Category');
        return;
      }
      if (_selectedWardId == null) {
        displayToast('Select Ward');
        return;
      }
      if (address.isEmpty) {
        displayToast('Please Enter Address');
        return;
      }
      if (landmark.isEmpty) {
        displayToast('Please Enter Landmark');
        return;
      }
      if (mentionYourConcerns.isEmpty) {
        displayToast('Please Enter Mention Your Concerns');
        return;
      }
      if (uplodedImage == null) {
        displayToast('Please Upload an Image');
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: getAppBarBack(context,"Online Complaint"),
          appBar: AppBar(
            // statusBarColore
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xFF12375e),
              statusBarIconBrightness: Brightness.dark,
              // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            // backgroundColor: Colors.blu
            backgroundColor: Color(0xFF255898),
            leading: GestureDetector(
              onTap: () {
                print("------back---");
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "${widget.name}",
                style: AppTextStyle.font16OpenSansRegularWhiteTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            //centerTitle: true,
            elevation: 0, // Removes shadow under the AppBar
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,

                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "1. Owner Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            icon: AnimatedRotation(
                              turns: isIconRotated ? 0.5 : 0.0, // Rotates the icon
                              duration: Duration(milliseconds: 300),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                // Toggle form visibility and icon rotation
                                isFormVisible = !isFormVisible;
                                isIconRotated = !isIconRotated;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                   // Conditional visibility for the form
                    Expanded(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: isFormVisible ? MediaQuery.of(context).size.height-60 : 0, // Show or hide based on form visibility
                        child: Visibility(
                          visible: isFormVisible,
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Owner Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Owner Address',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Submit'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
          ),
            ),
          ),
        );

  }
}
