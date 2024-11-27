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
import '../../app/generalFunction.dart';
import '../../app/loader_helper.dart';
import '../../services/baseurl.dart';
import '../../services/bindCityzenWardRepo.dart';
import '../../services/bindSubCategoryRepo.dart';
import 'onlineComplaint.dart';
import '../resources/app_text_style.dart';
import '../resources/values_manager.dart';

class OnlineComplaintForm extends StatefulWidget {
  var name, iCategoryCode;

  OnlineComplaintForm(
      {super.key, required this.name, required this.iCategoryCode});

  @override
  State<OnlineComplaintForm> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OnlineComplaintForm> {
  List stateList = [];
  List<dynamic> subCategoryList = [];
  List<dynamic> wardList = [];
  List<dynamic> bindreimouList = [];
  List blockList = [];
  List shopTypeList = [];
  var result2, msg2;
  bool _hasError = false;

  // Distic List
  bindSubCategory(String subCategoryCode) async {
    subCategoryList = (await BindSubCategoryRepo()
        .bindSubCategory(context, subCategoryCode))!;
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

  // FocusNode descriptionfocus = FocusNode();
  String? todayDate;
  String? consumableList;
  int count = 0;
  List? data;
  List? listCon;
  var _dropDownValueDistric;
  var _dropDownValueShopeType;

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
  var _dropDownValueBindReimType;

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
  // takeaLocation
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

  // uplode images
  Future<void> uploadImage(String token, File imageFile) async {
    var baseURL = BaseRepo().baseurl;
    var endPoint = "UploadTrackingImage/UploadTrackingImage";
    var uplodeImageApi = "$baseURL$endPoint";
    try {
      print('-----xx-x----214----');
      showLoader();
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$uplodeImageApi'),
      );
      // Add headers
      request.headers['token'] = token;
      // Add the image file as a part of the request
      request.files.add(await http.MultipartFile.fromPath(
        'sImagePath',
        imageFile.path,
      ));
      // Send the request
      var streamedResponse = await request.send();

      // Get the response
      var response = await http.Response.fromStream(streamedResponse);
      // Parse the response JSON
      List<dynamic> responseData = json.decode(response.body);
      // Extracting the image path
      uplodedImage = responseData[0]['Data'][0]['sImagePath'];
      print('Uploaded Image Path----245--: $uplodedImage');
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
    // TODO: implement initState
    // updatedSector();
    var subCategoryCode = "${widget.iCategoryCode}";
    print("---------240-------$subCategoryCode");
    bindSubCategory(subCategoryCode);
    bindWard();
    getLocation();

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

  // Todo bind sector code
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
              isDense: true,
              // Helps to control the vertical size of the button
              isExpanded: true,
              // Allows the DropdownButton to take full width
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              hint: RichText(
                text: const TextSpan(
                  text: "Select Sub Category",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              value: dropDownSubCategory,
              key: subCategoryFocus,
              onChanged: (newValue) {
                setState(() {
                  dropDownSubCategory = newValue;
                  subCategoryList.forEach((element) {
                    if (element["sSubCategoryName"] == dropDownSubCategory) {
                      _selectedSubCategoryId = element['iSubCategoryCode'];
                      setState(() {});
                    }
                  });
                });
              },
              items: subCategoryList.map((dynamic item) {
                return DropdownMenuItem(
                  value: item["sSubCategoryName"].toString(),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item['sSubCategoryName'].toString(),
                          overflow: TextOverflow.ellipsis, // Handles long text
                          style:
                              AppTextStyle.font16OpenSansRegularBlackTextStyle,
                          // style: TextStyle(
                          //   fontSize: 16,
                          //   fontWeight: FontWeight.normal,
                          // ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  // bind Ward
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
              isDense: true,
              // Helps to control the vertical size of the button
              isExpanded: true,
              // Allows the DropdownButton to take full width
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              hint: RichText(
                text: const TextSpan(
                  text: "Select Ward",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              value: _dropDownWard,
              // key: sectorFocus,
              onChanged: (newValue) {
                setState(() {
                  _dropDownWard = newValue;
                  wardList.forEach((element) {
                    if (element["sWardName"] == _dropDownWard) {
                      _selectedWardId = element['sWardCode'];

                      setState(() {});
                    }
                    print("------392----wardId--$_selectedWardId");
                  });
                });
              },
              items: wardList.map((dynamic item) {
                return DropdownMenuItem(
                  value: item["sWardName"].toString(),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item['sWardName'].toString(),
                          overflow: TextOverflow.ellipsis, // Handles long text
                          style:
                              AppTextStyle.font16OpenSansRegularBlackTextStyle,
                          // style: TextStyle(
                          //   fontSize: 16,
                          //   fontWeight: FontWeight.normal,
                          // ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  //
  Widget _bindReimout() {
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
                  text: "UOM",
                  // style: AppTextStyle.font16OpenSansRegularBlack45TextStyle,
                  // style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                    TextSpan(
                        text: '',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              // Not necessary for Option 1
              value: _dropDownValueBindReimType,
              // key: distDropdownFocus,
              onChanged: (newValue) {
                setState(() {
                  _dropDownValueBindReimType = newValue;
                  print('---837-------$_dropDownValueBindReimType');
                  //  _isShowChosenDistError = false;
                  // Iterate the List
                  bindreimouList.forEach((element) {
                    if (element["sUoM"] == _dropDownValueShopeType) {
                      setState(() {
                        // _selectedShopId = element['sUoM'];
                        //print('----349--sExpHeadCode id ------$_selectedShopId');
                      });
                      //print('-----Point id----241---$_selectedShopId');
                      if (_selectedShopId != null) {
                        // updatedBlock();
                      } else {
                        print('-------');
                      }
                      // print("Distic Id value xxxxx.... $_selectedDisticId");
                      // print("Distic Name xxxxxxx.... $_dropDownValueDistric");
                      //print("Block list Ali xxxxxxxxx.... $blockList");
                    }
                  });
                });
              },
              items: bindreimouList.map((dynamic item) {
                return DropdownMenuItem(
                  child: Text(item['sUoM'].toString(),
                      style: AppTextStyle.font16OpenSansRegularBlackTextStyle),
                  value: item["sUoM"].toString(),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
  /// Algo.  First of all create repo, secodn get repo data in the main page after that apply list data on  dropdown.
  // function call

  void validateAndCallApi() async {
    // Trim values to remove leading/trailing spaces

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? iCitizenCode = prefs.getString('iCitizenCode');

    var address = _addressController.text.trim();
    var landmark = _landmarkController.text.trim();
    var mentionYourConcerns = _mentionController.text.trim();

    // Debug logs
    print("Address: $address");
    print("Landmark: $landmark");
    print("Mention Your Concerns: $mentionYourConcerns");
    //  print("Uploaded Image: $uplodedImage");
    print("Selected Sub Category ID: $_selectedSubCategoryId");
    print("Selected Ward ID: $_selectedWardId");
    //  iCategoryCode
    // sCitizenName
    print("iCategoryCode: ${widget.iCategoryCode}");
    print("iCitizenCode: $iCitizenCode");
    print("lat :    $lat");
    print("long :    $long");

    //     lat = position.latitude;
    //     long = position.longitude;

    // Check Form Validation
    final isFormValid = _formKey.currentState!.validate();
    print("Form Validation: $isFormValid");

    // Validate all conditions
    if (isFormValid &&
        _selectedSubCategoryId != null &&
        _selectedWardId != null &&
        address.isNotEmpty &&
        landmark.isNotEmpty &&
        mentionYourConcerns.isNotEmpty) {
      // All conditions met; call the API
      print('---Call API---');

      // call here to api
      // Your API call logic here
    } else {
      // If conditions fail, display appropriate error messages
      print('--Not Call API--');
      if (_selectedSubCategoryId == null) {
        displayToast('Select Sub Category');
      }
      if (_selectedWardId == null) {
        displayToast('Select Ward');
      }
      if (address.isEmpty) {
        displayToast('Please Enter Address');
      }
      if (landmark.isEmpty) {
        displayToast('Please Enter Landmark');
      }
      if (mentionYourConcerns.isEmpty) {
        displayToast('Please Enter Mention Your Concerns');
      }
      // if (uplodedImage == null) {
      //   displayToast('Please Upload an Image');
      // }
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
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnlineComplaint()),
                );
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "${widget.name}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            //centerTitle: true,
            elevation: 0, // Removes shadow under the AppBar
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 10),
                  child: SizedBox(
                    height: 150, // Height of the container
                    // width: 200, // Width of the container
                    //step3.jpg
                    child: Image.asset(
                      'assets/images/onlinecomplaint.jpeg',
                      // Replace 'image_name.png' with your asset image path
                      fit: BoxFit
                          .cover, // Adjust the image fit to cover the container
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // Background color of the container
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            // Color of the shadow
                            spreadRadius: 5,
                            // Spread radius
                            blurRadius: 7,
                            // Blur radius
                            offset: Offset(0, 3), // Offset of the shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  // 'assets/images/favicon.png',
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 0, right: 10, top: 10),
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
                                            .font60penSansExtraboldBlack45TextStyle),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              // category
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 2),
                                        child: const Icon(
                                          Icons.forward_sharp,
                                          size: 12,
                                          color: Colors.black54,
                                        )),
                                    const Text('Category',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF707d83),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 0),
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  // Increased height to accommodate error message without resizing
                                  color: Colors.grey[300],
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              "${widget.name}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign
                                                  .left, // Aligns the text to the left
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Sub Category
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 2),
                                        child: const Icon(
                                          Icons.forward_sharp,
                                          size: 12,
                                          color: Colors.black54,
                                        )),
                                    const Text('Sub Category',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF707d83),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              _bindSubCategory(),
                              SizedBox(height: 10),
                              // WARD
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 2),
                                        child: const Icon(
                                          Icons.forward_sharp,
                                          size: 12,
                                          color: Colors.black54,
                                        )),
                                    const Text('Ward',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF707d83),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              _bindWard(),
                              SizedBox(height: 10),
                              // Address
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 2),
                                        child: const Icon(
                                          Icons.forward_sharp,
                                          size: 12,
                                          color: Colors.black54,
                                        )),
                                    const Text('Address',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF707d83),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              // this is my TextFormFoield
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 0),
                                child: Container(
                                  height: 70,
                                  // Increased height to accommodate error message without resizing
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            focusNode: _addressfocus,
                                            controller: _addressController,
                                            textInputAction:
                                                TextInputAction.next,
                                            onEditingComplete: () =>
                                                FocusScope.of(context)
                                                    .nextFocus(),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 10.0),
                                              filled: true,
                                              // Enable background color
                                              fillColor: Color(
                                                  0xFFf2f3f5), // Set your desired background color here
                                            ),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Landmark
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 2),
                                        child: const Icon(
                                          Icons.forward_sharp,
                                          size: 12,
                                          color: Colors.black54,
                                        )),
                                    const Text('Landmark',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF707d83),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 0),
                                child: Container(
                                  height: 70,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: TextFormField(
                                      focusNode: _landmarkfocus,
                                      controller: _landmarkController,
                                      textInputAction: TextInputAction.next,
                                      onEditingComplete: () =>
                                          FocusScope.of(context).nextFocus(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        filled: true, // Enable background color
                                        fillColor: Color(
                                            0xFFf2f3f5), // Set your desired background color here
                                      ),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                  ),
                                ),
                              ),
                              // Mention your concerns here
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 2),
                                        child: const Icon(
                                          Icons.forward_sharp,
                                          size: 12,
                                          color: Colors.black54,
                                        )),
                                    const Text('Mention your Concerns here',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF707d83),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 0),
                                child: Container(
                                  height: 70,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: TextFormField(
                                      controller: _mentionController,
                                      textInputAction: TextInputAction.next,
                                      onEditingComplete: () =>
                                          FocusScope.of(context).nextFocus(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        filled: true, // Enable background color
                                        fillColor: Color(
                                            0xFFf2f3f5), // Set your desired background color here
                                      ),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                  ),
                                ),
                              ),
                              // uplode Photo
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 2),
                                        child: const Icon(
                                          Icons.forward_sharp,
                                          size: 12,
                                          color: Colors.black54,
                                        )),
                                    const Text('Uplode Photo',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF707d83),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              //----Card
                              Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  height: 100,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Column Section
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Click Photo",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF707d83),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Text(
                                                "Please click here to take a photo",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.red[300]),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.red[300],
                                                size: 16,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // Container Section
                                      GestureDetector(
                                        onTap: () {
                                          print("---------image-----");
                                          pickImage();
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.camera_alt,
                                              size: 30,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    image != null
                                        ? Stack(
                                            children: [
                                              GestureDetector(
                                                behavior:
                                                    HitTestBehavior.translucent,
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
                                                    color:
                                                        Colors.lightGreenAccent,
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
                                        : Text(
                                            "",
                                            style: TextStyle(
                                                color: Colors.red[700]),
                                          )
                                  ]),
                              SizedBox(height: 10),

                              InkWell(
                                onTap: () {
                                  validateAndCallApi();
                                },
                                child: Container(
                                  width: double.infinity,
                                  // Make container fill the width of its parent
                                  height: AppSize.s45,
                                  padding: EdgeInsets.all(AppPadding.p5),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF255898),
                                    // Background color using HEX value
                                    borderRadius: BorderRadius.circular(
                                        AppMargin.m10), // Rounded corners
                                  ),
                                  //  #00b3c7
                                  child: Center(
                                    child: Text(
                                      "Post Complaint",
                                      style: AppTextStyle
                                          .font16OpenSansRegularWhiteTextStyle,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
