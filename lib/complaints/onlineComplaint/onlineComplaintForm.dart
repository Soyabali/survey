import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../app/customform.dart';
import '../../app/generalFunction.dart';
import '../../resources/app_text_style.dart';
import '../../resources/color_manager.dart';


class OnlineComplaintForm extends StatefulWidget {
  final complaintName;

  OnlineComplaintForm({super.key, this.complaintName});
  @override
  State<OnlineComplaintForm> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<OnlineComplaintForm> {
  GeneralFunction generalFunction = GeneralFunction();
  List distList = [];
  var _dropDownValueDistric;
  var _selectedDisticId;
  bool _isShowChosenDistError = false;
  // Focus
  FocusNode namefieldfocus = FocusNode();
  final distDropdownFocus = GlobalKey();
  // controller
  TextEditingController nameTextEditingController = TextEditingController();

  // nameFielfocused
  //Name filed
  Widget _nameFormField() {
    return TextFormField(
      focusNode: namefieldfocus,
      controller: nameTextEditingController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
          label: RichText(
            text: const TextSpan(
              text: 'Enter name ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          border: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 0.5))),
      inputFormatters: [
        //FilteringTextInputFormatter.allow(RegExp('[a-zA-Z_ ]')),
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z_ ]')),
      ],
      /// Validator here we are used multiValidator
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is required.';
        }
        if (value.length < 1) {
          return 'Please enter Valid Name';
        }
        return null;
      },
    );
  }
  // dropDown
  // Dist Dropdown
  Widget _distDropDown() {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
       // height: 50,
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              hint: RichText(
                text: TextSpan(
                  text: "Please choose a Dist",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                    TextSpan(
                        text: '*',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ), // Not necessary for Option 1
              value: _dropDownValueDistric,
              key: distDropdownFocus,
              onChanged: (newValue) {
                setState(() {
                  _dropDownValueDistric = newValue;
                  _isShowChosenDistError = false;
                  // Iterate the List
                  distList.forEach((element) {
                    if (element["districtName"] == _dropDownValueDistric) {
                      setState(() {
                        _selectedDisticId = element['id'];
                      });
                      if (_selectedDisticId != null) {
                       // updatedBlock();
                      } else {
                        print('Please Select Distic name');
                      }
                      print("Distic Id value xxxxx.... $_selectedDisticId");
                      print("Distic Name xxxxxxx.... $_dropDownValueDistric");
                     // print("Block list Ali xxxxxxxxx.... $blockList");
                    }
                  });
                });
              },
              items: distList.map((dynamic item) {
                return DropdownMenuItem(
                  child: Text(item['districtName'].toString()),
                  value: item["districtName"].toString(),
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
          middleHeader(context,'${widget.complaintName}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.invert_colors_on_sharp,size: 20),
              SizedBox(width: 5),
              Text('Fill the below details',style:
              AppTextStyle.font16penSansExtraboldBlack45TextStyle)

            ],
          ),
          GrievanceForm()
         //  GestureDetector(
         //    onTap: (){
         //      FocusScope.of(context).unfocus();
         //    },
         //    child: Form(
         //        child: SingleChildScrollView(
         //          child: Column(
         //            children: [
         //              // Name field
         //              Card(
         //                  margin: EdgeInsets.all(10),
         //                  color: Colors.white,
         //                  elevation: 10,
         //                  shape: RoundedRectangleBorder(
         //                    borderRadius: BorderRadius.circular(8.0),
         //                  ),
         //                  shadowColor: ColorManager.primary,
         //                  child: _nameFormField()),
         //              const SizedBox(
         //                height: 3,
         //              ),
         //              _distDropDown(),
         //              Card(
         //                  margin: EdgeInsets.all(10),
         //                  color: Colors.white,
         //                  elevation: 10,
         //                  shape: RoundedRectangleBorder(
         //                    borderRadius: BorderRadius.circular(8.0),
         //                  ),
         //                  shadowColor: ColorManager.primary,
         //                  child: _distDropDown()),
         //
         //
         //
         //            ],
         //          ),
         //        )),
         //  )
        ],
      ),
    );
  }
}
