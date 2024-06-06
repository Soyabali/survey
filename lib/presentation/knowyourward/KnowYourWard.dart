import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../app/generalFunction.dart';
import '../../app/navigationUtils.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_strings.dart';
import '../../resources/app_text_style.dart';

class KnowYourWard extends StatefulWidget {
  final name;

  KnowYourWard({super.key, this.name});

  @override
  State<KnowYourWard> createState() => _KnowYourWardState();
}

class _KnowYourWardState extends State<KnowYourWard> {
  // Date PICKER
  DateTime selectedDate = DateTime.now();
  GeneralFunction generalFunction = GeneralFunction();
  final _formKey = GlobalKey<FormState>();
  String _toDate = 'Pick a date';
  String _fromDate = 'Pick a date';
  File? image;
  List distList = [];
  var _dropDownValueDistric;
  List stateList = [];
  List blockList = [];
  List marklocationList = [];
  var _dropDownValueMarkLocation;
  var _selectedPointId;

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
    print('-----27--${widget.name}');
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    NavigationUtils.onWillPop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack('${widget.name}'),
      drawer:
          generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),

       body: ListView(
         children: [
           middleHeader(context, '${widget.name}'),
      Column(
        children: [
          Card(
            // margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            elevation: 8,
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            child: Container(
              // color: AppColors.appGrey,
              // width: _width! * 90,
              padding: const EdgeInsets.all(10),
                child: Column(
                children: [
                  _bindSubCategory(),
                   SizedBox(height: 10),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${"BHANU SENAPATI"}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${"Contact No"}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${"Agency Name"}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${"Description Of Ward"}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${"Address"}: ",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "${"Party Name :-INC"}",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${"8847875092"}",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${"Not Specified"}",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${"Bidansi, Kumbharasahi"}",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),
                          Text(
                            "${"Not Specified"}",
                            style: AppTextStyle
                                .font14OpenSansRegularWhiteTextStyle,
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              )
            ),
          ),
         ],
       ),

      // body: ListView(
      //   children: <Widget>[
      //     middleHeader(context, '${widget.name}'),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      //       child: Container(
      //         width: MediaQuery.of(context).size.width - 30,
      //         decoration: BoxDecoration(
      //             color: Colors.white, // Background color of the container
      //             borderRadius: BorderRadius.circular(20),
      //             boxShadow: [
      //               BoxShadow(
      //                 color:
      //                     Colors.grey.withOpacity(0.5), // Color of the shadow
      //                 spreadRadius: 5, // Spread radius
      //                 blurRadius: 7, // Blur radius
      //                 offset: Offset(0, 3), // Offset of the shadow
      //               ),
      //             ]),
      //         child: Padding(
      //           padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      //           child: Form(
      //             key: _formKey,
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: <Widget>[
      //                 SizedBox(height: 5),
      //                 _bindSubCategory(),
      //                 SizedBox(height: 5),
      //                 Container(
      //                   color: Colors.white,
      //                   height: 75,
      //                   width: MediaQuery.of(context).size.width,
      //                   child: Card(
      //                     elevation: 3,
      //                     child: Padding(
      //                       padding: EdgeInsets.only(top: 5, left: 5),
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.start,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text('BHANU SENAPATI',
      //                               style: AppTextStyle
      //                                   .font14penSansExtraboldBlack45TextStyle),
      //                           SizedBox(height: 5),
      //                           Row(
      //                             children: [
      //                               Text('Party Name :-',
      //                                   style: AppTextStyle
      //                                       .font14penSansExtraboldBlack26TextStyle),
      //                               SizedBox(width: 5),
      //                               Text('INC',
      //                                   style: AppTextStyle
      //                                       .font14penSansExtraboldBlack26TextStyle),
      //                             ],
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(bottom: 5, top: 10),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: <Widget>[
      //                       Container(
      //                           margin: const EdgeInsets.only(
      //                               left: 0, right: 2, bottom: 2),
      //                           child: const Icon(
      //                             Icons.forward_sharp,
      //                             size: 12,
      //                             color: Colors.black54,
      //                           )),
      //                       Text('Contact No',
      //                           style: AppTextStyle
      //                               .font14penSansExtraboldBlack45TextStyle),
      //                     ],
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 12),
      //                   child: Text('8847875092',
      //                       style: AppTextStyle
      //                           .font14penSansExtraboldBlack26TextStyle),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(bottom: 5, top: 10),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: <Widget>[
      //                       Container(
      //                           margin: const EdgeInsets.only(
      //                               left: 0, right: 2, bottom: 2),
      //                           child: const Icon(
      //                             Icons.forward_sharp,
      //                             size: 12,
      //                             color: Colors.black54,
      //                           )),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.start,
      //                         children: [
      //                           Text('Agency Name',
      //                               style: AppTextStyle
      //                                   .font14penSansExtraboldBlack45TextStyle),
      //                            SizedBox(width: 50),
      //                           Text('Ward NO - 1',
      //                               style: AppTextStyle
      //                                   .font14penSansExtraboldBlack45TextStyle),
      //                         ],
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 12),
      //                   child: Text('Not Specified',
      //                       style: AppTextStyle
      //                           .font14penSansExtraboldBlack26TextStyle),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(bottom: 5, top: 10),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: <Widget>[
      //                       Container(
      //                           margin: const EdgeInsets.only(
      //                               left: 0, right: 2, bottom: 2),
      //                           child: const Icon(
      //                             Icons.forward_sharp,
      //                             size: 12,
      //                             color: Colors.black54,
      //                           )),
      //                       Text('Description Of Ward',
      //                           style: AppTextStyle
      //                               .font14penSansExtraboldBlack45TextStyle),
      //                     ],
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 12),
      //                   child: Text(
      //                       'Bidansi,Kumbharasahi,Gopalsahi(P), Harijan Sahi,Tareni Vihar, Laxmi Vihar, Jyoti Vihar, Satabdi Vihar, Krushak Bazar(P)',
      //                       style: AppTextStyle
      //                           .font14penSansExtraboldBlack26TextStyle),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(bottom: 5, top: 10),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: <Widget>[
      //                       Container(
      //                           margin: const EdgeInsets.only(
      //                               left: 0, right: 2, bottom: 2),
      //                           child: const Icon(
      //                             Icons.forward_sharp,
      //                             size: 12,
      //                             color: Colors.black54,
      //                           )),
      //                       Text('Address',
      //                           style: AppTextStyle
      //                               .font14penSansExtraboldBlack45TextStyle),
      //                     ],
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 12),
      //                   child: Text('Not Specified',
      //                       style: AppTextStyle
      //                           .font14penSansExtraboldBlack26TextStyle),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
     ]
    )
    );

  }
}
