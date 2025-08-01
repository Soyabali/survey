import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:puri/services/bindProjectRepo.dart';
import 'package:puri/services/bindSurveyTypeRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/generalFunction.dart';
import '../../app/loader_helper.dart';
import '../../services/baseurl.dart';
import '../../services/bindCityzenWardRepo.dart';
import '../../services/dynamicFieldRepo.dart';
import '../../services/dynamicServeRepo.dart';
import '../../services/dynamicuiServeform.dart';
import '../resources/app_text_style.dart';
import '../resources/values_manager.dart';
import 'package:dotted_border/dotted_border.dart';

//  ---------Provider-----------to get a Api

final bindCityzenWardProvider = FutureProvider<List>((ref) async {

  return await BindCityzenWardRepo().getbindWard(); // Already a List

});
//  Get bind Project Provider
final bindProjectProvider = FutureProvider<List>((ref) async {
  return await BindProjectRepo().getbindProject(); // Already a List
});
// bind Survery Type

//  BindSurveytypeRepo
final bindSurveyTypeProvider = FutureProvider<List>((ref) async {
  return await BindSurveytypeRepo().getbindSurveyType(); // Already a List
});

class SurveryForm extends ConsumerStatefulWidget {

  @override
  ConsumerState<SurveryForm> createState() => _SurveryFormState();
}

// 2. extend [ConsumerState]

class _SurveryFormState extends ConsumerState<SurveryForm> {

  final wardListStateProvider = StateProvider<List>((ref) => []);
  List bindcityWardList = [];
  List bindProjectList = [];
  List bindSurveyList = [];
  //final bindcityWardList;
  var _selectedValueWard;
  var _selectedValueProjct;
  var _selectedValueSurveyType;
  GeneralFunction generalFunction = GeneralFunction();
  var _dropDownValueWard;
  var SurveyCode;
  var _dropDownValueProject;
  var _dropDownValueSurveyType;
  final _formKey = GlobalKey<FormState>();
  bool showDropDownLocation = false;
  bool showDropDownProject = false;
  bool showDropDownSurveyType = false;
  var codeName;
  var result, msg, loginMap;
  var sContactNo, sCitizenName, sEmilId;
  int edtField = 1; // Change this dynamically (2, 4, 5 etc.)
  int textViewCount = 1;
  List<TextEditingController> controllers = [];
  List<String> texts = [];
  // boolean fields
  int booleanWidget = 1; // Initially 0, will set after API response
  //List<bool> booleanValues = [];
  int checkBoxCount = 2; // you can change dynamically
  List<bool> checkBoxValues = [];
  int buttonCount = 1; // Can change dynamically
  List<String> buttonLabels = [];
  File? image;
  var uplodedImage;
  var locationAddress;

  List<String> allCaptions = [];
  List<String> allValues = [];

  List<DynamicField> _formFields = [];
  Map<String, TextEditingController> _controllers = {};
  Map<String, bool?> _booleanSelections = {};
  bool? _selectedOption;
  List<String> booleanCaptions = [];
  List<bool?> booleanValues = [];
  Map<String, File?> _pickedImages = {};
  Map<String, String> _uploadedImageUrls = {};
  List<String> allCaptionsImages = [];
  List<String> allImageUrls = [];
  var surveyCode;

  List<Map<String, dynamic>> seleccteddates = [];
  List<Map<String, dynamic>> thirdFormCombinedList = [];
  List<Map<String, dynamic>> firstFormCombinedList = [];
  var result2,msg2;
  var sUserName2,sContactNo2;

  // dynamic ui
  // textField Controller function
  void generateTextFields() {
    controllers = List.generate(edtField, (index) => TextEditingController());
  }

  // dynamic TextView
  void generateTextViews() {
    texts = List.generate(
      textViewCount,
      (index) => "This is TextView ${index + 1}",
    );
  }

  // generate boolean function
  void generateBooleanButtons() {
    booleanValues = List.generate(booleanWidget, (index) => false);
  }

  // checkBox function
  void generateCheckBoxButtons() {
    checkBoxValues = List.generate(checkBoxCount, (index) => false);
  }

  // generateButton
  void generateButtons() {
    buttonLabels = List.generate(buttonCount, (index) => "Button ${index + 1}");
  }
  // getALocation
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

  Future pickImage(String caption) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sToken = prefs.getString('sToken');
    print('---Token----113--$sToken');

    try {
      final pickFileid = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 65);
      if (pickFileid != null) {

        image = File(pickFileid.path);

        // setState(() {});
        // _pickedImages[caption] = image; // local Preview
        // print('Image File path Id Proof-------167----->$image');
        uploadImage(sToken!, image!,caption);
        setState(() {

        });
      } else {
        print('no image selected');
      }
    } catch (e) {}
  }

  // uplode images
  Future<void> uploadImage(String token, File imageFile, String caption) async {

    print("----216-----$imageFile");
    print("----217-----$token");

    var baseURL = BaseRepo().baseurl;
    var endPoint = "PostImage/PostImage";
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
        'sImagePath', imageFile.path,
      ));
      // Send the request
      var streamedResponse = await request.send();
      // Get the response
      var response = await http.Response.fromStream(streamedResponse);
      // Parse the response JSON
      Map<String, dynamic> responseData = json.decode(response.body);

      // Extracting the image path
      String? imagePath = responseData['Data']?[0]?['sImagePath'];

      if (imagePath != null) {
        setState(() {
          _uploadedImageUrls[caption] = imagePath;
        });
       // uplodedImage = imagePath;
        print('Uploaded Image Path for [$caption]: $imagePath');
      } else {
        print("Image path not found in response");
      }
      hideLoader();
    } catch (error) {
      hideLoader();
      print('Error uploading image: $error');
    }
  }


  // dynamicui draw with a api function

  dynamicUiDrawFunction(SurveyCode) async {
    final fields = await DynamicUiSurveryFormRepo().dynamicUi(SurveyCode);
    setState(() {
      _formFields = fields;
      _controllers.clear();

      for (var field in fields) {
        if (field.Field_DataType == 'Text') {
          _controllers[field.Field_Caption] = TextEditingController();
        }else if (field.Field_DataType == 'Boolean') {
          _booleanSelections[field.Field_Caption] = null; // or false/true as default
        }else if(field.Field_DataType == 'Photo'){
          _pickedImages[field.Field_Caption] = null;
        }
      }
    });
  }

  // Validite and call Api
  void validateAndCallApi() async {
    firstFormCombinedList = [];
       var booleanValue;
    /// todo  here you should mention your api data----

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? sUserName = prefs.getString('sUserName');

      setState(() {
        booleanCaptions.clear();
        booleanValues.clear();
        allCaptions.clear();
        allValues.clear();
        allCaptionsImages.clear();
        allImageUrls.clear();
      });
      // get a formValue
      final formValues = getFormValues();
      // Print or use the data
      formValues.forEach((field, value) {
        allCaptions.add(field);
        allValues.add(value);
        print('$field: $value');

      });
      print("------334-formCaption-$allCaptions");
      print("------335-formValue-$allValues");
      //  Get a boolena value
      _booleanSelections.forEach((key, value) {
        booleanCaptions.add(key);
        booleanValues.add(value);
        if(booleanValues==true){
          setState(() {
            booleanValue="1";
          });

        }else{
         setState(() {
           booleanValue="0";
         });
        }

      });
      // to take a image records
      _uploadedImageUrls.forEach((caption, imageUrl) {
        allCaptionsImages.add(caption);
        allImageUrls.add(imageUrl);
      });
      // to check that TextFormField value is null or not

    for (var field in _formFields) {
      if (field.iMandatory == 1) {
        String? value = _controllers[field.Field_Caption]?.text;
        if (value == null || value.trim().isEmpty) {
          displayToastError('${field.Field_Caption} is mandatory');
          return;
        }
      }
    }
    // to chek Boolean value validation
    // for (var field in _formFields) {
    //   if (field.iMandatory == 1 && field.Field_DataType == 'Boolean') {
    //     final caption = field.Field_Caption;
    //     final isSelected = _booleanSelections[caption];
    //
    //     if (isSelected == null) {
    //       displayToastError('$caption is mandatory');
    //       return;
    //     }
    //   }
    // }


      final isFormValid = _formKey.currentState!.validate();
      /// todo Above you get a data and set structur data here you should applie condition
     // to check That data is filed or not to apply validation



    if (isFormValid &&
        allValues.isNotEmpty &&
        booleanValues.isNotEmpty

    ) {
      // All conditions met; call the API
      print('---Call API---');



      Map<String, dynamic> finalJson = {
        "SurveyCode": _dropDownValueProject,
        "SubmittedBy": sUserName,
        "fLatitude": lat,
        "fLongitude": long,
        "Responses": []
      };
      // Store all responses
      List<Map<String, dynamic>> responseList = [];
      // 📝 Add text fields
      for (int i = 0; i < allCaptions.length; i++) {
        responseList.add({
          "Field_Caption": allCaptions[i],
          "Field_Value": allValues[i]
        });
      }
      // boolean value
      for (int i = 0; i < booleanCaptions.length; i++) {
        responseList.add({
          "Field_Caption": booleanCaptions[i],
          "Field_Value": booleanValues[i].toString() // Convert bool to String
        });
      }
      // 🖼️ Add image fields
      for (int i = 0; i < allCaptionsImages.length; i++) {
        responseList.add({
          "Field_Caption": allCaptionsImages[i],
          "Field_Value": allImageUrls[i]
        });
      }
      // Assign final list to JSON
      finalJson["Responses"] = responseList;
      print("------389---");
      // lIST to convert json string
      String allThreeFormJson = jsonEncode(finalJson);

      print('----410--->>.---$allThreeFormJson');
     // Api call here

      var onlineComplaintResponse = await DynamicServerRepo()
          .dynamicServe(context, allThreeFormJson);

      result2 = onlineComplaintResponse['Result'];
      msg2 = onlineComplaintResponse['Msg'];
      if (result2 == "1") {
        displayToast(msg2);
        //Navigator.pop(context);
      } else {
        displayToastError(msg2);
      }
      // Call your API here
    } else {
      // If conditions fail, display appropriate error messages
      print('--Not Call API--');

      if (allValues.isEmpty) {
        displayToastError('Please Enter TextField Value');
        return;
      }
      if (booleanValues.isEmpty) {
        displayToastError('Please Select boolean Value');
        return;
      }
    }
  }

  // Dynamic Field dataType

  Widget buildDynamicForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _formFields.map((field) {
          switch (field.Field_DataType) {
            case 'Text':
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 5, right: 5),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        field.Field_Caption,
                        style: AppTextStyle.font12OpenSansRegularBlackTextStyle,
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _controllers[field.Field_Caption],
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(field.field_Length),
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLines: 2, // ✅ Max 2 lines
                        minLines: 1, // ✅ Minimum 1 line
                        showCursor: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white, // ✅ Background white
                          isDense: true,
                          counterText: '', // hides character counter
                          errorMaxLines: 2,
                        ),
                        // validator: (value) {
                        //   if (field.iMandatory == 1 && (value == null || value.trim().isEmpty)) {
                        //     return '${field.Field_Caption} is required';
                        //   }
                        //   if (value != null && value.length > field.field_Length) {
                        //     return '${field.Field_Caption} must be less than ${field.field_Length} characters';
                        //   }
                         // return null;
                       // },
                      ),
                    ],
                  ),
                ),
              );
            case 'Boolean':
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        field.Field_Caption,
                        style: AppTextStyle.font12OpenSansRegularBlackTextStyle,
                      ),
                      Row(
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: _booleanSelections[field.Field_Caption],
                            onChanged: (value) {
                              setState(() {
                                _booleanSelections[field.Field_Caption] = value;
                              });
                              print("Selected YES for ${field.Field_Caption}");
                            },
                          ),
                          const Text("Yes"),
                          Radio<bool>(
                            value: false,
                            groupValue: _booleanSelections[field.Field_Caption],
                            onChanged: (value) {
                              setState(() {
                                _booleanSelections[field.Field_Caption] = value;
                              });
                              print("Selected NO for ${field.Field_Caption}");
                            },
                          ),
                          const Text("No"),
                        ],
                      ),
                    ],
                  ),
                ),
              );

            case 'Photo':
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(field.Field_Caption),
                      SizedBox(height: 5),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 1.0,
                          dashPattern: [4, 2],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(5.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    print('----click photo---');
                                    pickImage(field.Field_Caption);
                                  },
                                  child: _pickedImages[field.Field_Caption] != null
                                      ? Image.file(
                                    _pickedImages[field.Field_Caption]!,
                                    height: 190,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )
                                      : (_uploadedImageUrls[field.Field_Caption] != null
                                      ? Image.network(
                                    _uploadedImageUrls[field.Field_Caption]!,
                                    height: 190,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )
                                      : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/camra.jpeg',
                                        height: 25,
                                        width: 25,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Click Photo',
                                        style: AppTextStyle
                                            .font12OpenSansRegularBlackTextStyle,
                                      )
                                    ],
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            case 'Button':
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () async {
                    validateAndCallApi();

                    },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                      width: double.infinity, // Make container fill the width of its parent
                      height: AppSize.s45,
                      //  padding: EdgeInsets.all(AppPadding.p5),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFF255899,
                        ), // Background color using HEX value
                        borderRadius: BorderRadius.circular(AppMargin.m10), // Rounded corners
                      ),
                      child: Center(
                        child: Text(
                          (field.Field_Caption),
                          style: TextStyle(
                            fontSize: AppSize.s16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            default:
              return SizedBox.shrink();
          }
        }).toList(),
      ),
    );
  }
  // GET TextFormFields values
  Map<String, String> getFormValues() {
    final Map<String, String> formData = {};
    _controllers.forEach((key, controller) {
      formData[key] = controller.text.trim();
    });
    return formData;
  }


  // bind Location
  Widget _bindLocation(List bindcityWardList) {
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
              isExpanded: true, // Important to prevent overflow
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              hint: Text(
                "Select Project",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyle.font14penSansExtraboldBlack45TextStyle,
              ),
              value: _dropDownValueProject,

              onChanged: (newValue) {
                setState(() {
                  _dropDownValueProject = newValue;
                  print('-----140-----serveyCode---$_dropDownValueProject');
                  bindcityWardList.forEach((element) {
                    if (element["Surver_Name"] == _dropDownValueProject) {
                      _selectedValueProjct = element['Survey_Code'];
                    }
                  });
                  print("----143---$_selectedValueProjct");
                });
                if (_dropDownValueProject != null &&
                    _dropDownValueProject != '') {
                  print("----call Api---");
                  /// todo here we call a api to change the data

                  dynamicUiDrawFunction(_dropDownValueProject);

                } else {
                  print("----not call Api---");
                }
              },
              items: bindcityWardList.map((dynamic item) {
                return DropdownMenuItem(
                  value: item["Survey_Code"].toString(),
                  child: Text(
                    item['Surver_Name'].toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
  // bind project

  // dynamic ui function


  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    toGatlocalDataBase();
    super.initState();

    // Wait for the FutureProvider to complete and set the list into state provider
    // First microtask
    Future.microtask(() async {
      try {
        final response = await ref.read(bindCityzenWardProvider.future);
        await Future.delayed(Duration(seconds: 2)); // ⏳ Delay for 2 seconds

        if (response != null && response.isNotEmpty) {
          print("-----308----Response----$response");

          bindcityWardList = response;
          showDropDownLocation = true;
          // to put list in a dropDownBox
          _bindLocation(bindcityWardList);
          setState(() {}); // 🔁 Trigger UI rebuild
          print('✅ List loaded: $bindcityWardList');
        } else {
          print('⚠️ Empty or null list');
        }
      } catch (e) {
        print('❌ Error: $e');
      }
    });
  }

  toGatlocalDataBase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sUserName2 = prefs.getString('sUserName');
    sContactNo2 = prefs.getString('sContactNo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarFunction(context, "Create Survey"),
      drawer: generalFunction.drawerFunction(
        context,
        sUserName2 ?? "",
        sContactNo2 ?? "",
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 10, bottom: 20),
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(
                        0.5,
                      ), // Color of the shadow
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset of the shadow
                    ),
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: 0,
                              right: 10,
                              top: 10,
                            ),
                            child: Image.asset(
                              'assets/images/ic_expense.png', // Replace with your image asset path
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Fill the below details',
                              style: AppTextStyle
                                  .font16penSansExtraboldBlack45TextStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: showDropDownLocation
                            ? _bindLocation(bindcityWardList)
                            :
                              //CircularProgressIndicator()
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white, // White background
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ), // Circular container
                                  border: Border.all(
                                    color: Colors.black26, // Light black border
                                    width: 1.2,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3.5,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black,
                                    ), // Black spinner
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(height: 1, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      buildDynamicForm(),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
