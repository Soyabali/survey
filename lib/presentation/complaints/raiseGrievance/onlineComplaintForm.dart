import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app/generalFunction.dart';
import '../../../services/bindCityzenWardRepo.dart';
import '../../resources/app_text_style.dart';
import 'package:http/http.dart' as http;

class OnlineComplaintForm extends StatefulWidget {
  final complaintName;
  final categoryCode;

  OnlineComplaintForm({super.key, this.complaintName, this.categoryCode, required String name});

  @override
  State<OnlineComplaintForm> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<OnlineComplaintForm> {

  GeneralFunction generalFunction = GeneralFunction();

   final _formKey = GlobalKey<FormState>();
   List bindComplintWard = [];
    var _selectedValueWard;

  var _dropDownValueWard;
  // Focus
  FocusNode namefieldfocus = FocusNode();
  final distDropdownFocus = GlobalKey();
  // focus
  FocusNode categoryfocus = FocusNode();
  FocusNode addressfocus = FocusNode();
  FocusNode landMarkfocus = FocusNode();
  FocusNode mentionfocus = FocusNode();
  var uplodedImage;
  var sCitizenName,sContactNo;
  // TextField dynamic create
  int edtField = 2; // Change this dynamically (2, 4, 5 etc.)
  List<TextEditingController> controllers = [];
  // textField Controller function
  void generateTextFields() {
    controllers = List.generate(edtField, (index) => TextEditingController());
  }
  // dynamic TextView
  void generateTextViews() {
    texts = List.generate(
        textViewCount, (index) => "This is TextView ${index + 1}");
  }

  // dynamic textview
  int textViewCount = 3; // Change this (2, 4, 5 etc.)
  List<String> texts = [];

  bindCityzenData() async {
    bindComplintWard = await BindCityzenWardRepo().getbindWard();
    print(" -----xxxxx---- 78---> $bindComplintWard");
    setState(() {});
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
              isExpanded: true, // Important to prevent overflow
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              hint: Text(
                "Select Ward",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyle.font14penSansExtraboldBlack45TextStyle,
              ),
              value: _dropDownValueWard,
              onChanged: (newValue) {
                setState(() {
                  _dropDownValueWard = newValue;
                  bindComplintWard.forEach((element) {
                    if (element["sSectorName"] == _dropDownValueWard) {
                      _selectedValueWard = element['iSectorCode'];
                    }
                  });
                });
              },
              items: bindComplintWard.map((dynamic item) {
                return DropdownMenuItem(
                  value: item["iSectorCode"].toString(),
                  child: Text(
                    item['sSectorName'].toString(),
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

  @override
  void initState() {
    // TODO: implement initState
    callFunctionOnInit();
    super.initState();
  }
  callFunctionOnInit(){
    bindCityzenData();
    getLocalDataFromLocalDataBase();
    generateTextFields();
    generateTextViews();
  }

  getLocalDataFromLocalDataBase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     sCitizenName = prefs.getString('sCitizenName');
     sContactNo = prefs.getString('sContactNo');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarFunction(context,"Create Survey"),
      drawer: generalFunction.drawerFunction(context, '${sCitizenName}', '${sContactNo}'),

      body: ListView(
        children: <Widget>[
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5,bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.circular(5),
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
              padding: const EdgeInsets.only(left: 10, right: 10,top:0,bottom: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 0, right: 10, top: 10),
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
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                  color: Colors.black54
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('Location',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
                          ],
                        ),
                      ),
                      _bindWard(),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black54
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('Project',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
                          ],
                        ),
                      ),
                      _bindWard(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black54
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('Survey Type',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
                          ],
                        ),
                      ),
                      _bindWard(),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black54
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('Survey Parameter',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack45TextStyle),
                          ],
                        ),
                      ),
                      /// todo here you should hit rest api
                      /// behafe of project and surveryType and creare
                      /// a dynamic value.
                      ...List.generate(edtField, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controllers[index],
                            decoration: InputDecoration(
                              labelText: "Field ${index + 1}",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 10),
                      ...List.generate(textViewCount, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            texts[index],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        );
                      }),
                    ]
                  )

                ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
