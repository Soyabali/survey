import 'dart:math';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../app/generalFunction.dart';
import '../../app/navigationUtils.dart';
import '../../provider/bindComplaintProvider.dart';
import '../../services/getEmergencyContactTitleRepo.dart';
import '../complaints/grievanceStatus/grievanceStatus.dart';
import '../nodatavalue/NoDataValue.dart';
import '../resources/app_text_style.dart';
import 'fireemergency/fireemergency.dart';

class EmergencyContacts extends StatefulWidget {
  final name;

  EmergencyContacts({super.key, this.name});

  @override
  State<EmergencyContacts> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<EmergencyContacts> {
  GeneralFunction generalFunction = GeneralFunction();


  List<Map<String, dynamic>>? emergencyTitleList;
  bool isLoading = true;
  String? sName, sContactNo;
  // GeneralFunction generalFunction = GeneralFunction();
  getEmergencyTitleResponse() async {
    emergencyTitleList = await GetEmergencyContactTitleRepo().getEmergencyContactTitle(context);
    print('------31----$emergencyTitleList');
    setState(() {
      isLoading = false;
    });
  }


    final List<Map<String, dynamic>> itemList2 = [
    {
      //'leadingIcon': Icons.account_balance_wallet,
      'leadingIcon': 'assets/images/credit-card.png',
      'title': 'ICICI BANK CC PAYMENT',
      'subtitle': 'Utility & Bill Payments',
      'transactions': '1 transaction',
      'amount': ' 7,86,698',
      'temple': 'Fire Emergency'
    },
    {
      //  'leadingIcon': Icons.ac_unit_outlined,
      'leadingIcon': 'assets/images/shopping-bag.png',
      'title': 'APTRONIX',
      'subtitle': 'Shopping',
      'transactions': '1 transaction',
      'amount': '@ 1,69,800',
      'temple': 'Police'
    },
    {
      //'leadingIcon': Icons.account_box,
      'leadingIcon': 'assets/images/shopping-bag2.png',
      'title': 'MICROSOFT INDIA',
      'subtitle': 'Shopping',
      'transactions': '1 transaction',
      'amount': '@ 30,752',
      'temple': 'Women Help'
    },
    {
      //'leadingIcon': Icons.account_balance_wallet,
      'leadingIcon': 'assets/images/credit-card.png',
      'title': 'SARVODAYA HOSPITAL U O',
      'subtitle': 'Medical',
      'transactions': '1 transaction',
      'amount': '@ 27,556',
      'temple': 'Medical Emergency'
    },
    {
      //  'leadingIcon': Icons.ac_unit_outlined,
      'leadingIcon': 'assets/images/shopping-bag.png',
      'title': 'MOHAMMED ZUBER',
      'subtitle': 'UPI Payment',
      'transactions': '1 transaction',
      'amount': '@ 25,000',
      'temple': 'Other Important Numbers'
    },
    ];

  final List<Color> borderColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.cyan,
    Colors.amber,
  ];

  Color getRandomBorderColor() {
    final random = Random();
    return borderColors[random.nextInt(borderColors.length)];
  }

  @override
  void initState() {
    // TODO: implement initState
    getEmergencyTitleResponse();
    super.initState();
  }

  @override
  void dispose() {
    // BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack(context, '${widget.name}'),

        drawer:
      generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),

      body:
      isLoading
          ? Center(child: Container())
          : (emergencyTitleList == null || emergencyTitleList!.isEmpty)
          ? NoDataScreenPage()
          :
      Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    middleHeader(context, '${widget.name}'),
                    Container(
                      height: MediaQuery.of(context).size
                          .height * 0.8, // Adjust the height as needed
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: emergencyTitleList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 1.0),
                                child: GestureDetector(
                                  onTap: () {
                                    var name = emergencyTitleList![index]['sHeadName'];
                                    var iHeadCode = emergencyTitleList![index]['iHeadCode'];
                                    var sIcon = emergencyTitleList![index]['sIcon'];



                                    // sIcon
                                    print('----categoryNmae---$name');
                                    print('----categoryCode---$iHeadCode');
                                    print('----sIcon---$sIcon');

                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FireEmergency(name: name,iHeadCode:iHeadCode,sIcon:sIcon),
                                                            ),
                                                          );


                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         OnlineComplaintForm(
                                    //             complaintName: categoryName,
                                    //             categoryCode : categoryCode
                                    //         ),
                                    //   ),
                                    // );
                                  },

                                  child: ListTile(
                                    leading: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: const LinearGradient(
                                          colors: [Colors.red, Colors.orange],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          itemList2[index]['leadingIcon']!,
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      emergencyTitleList![index]['sHeadName']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'assets/images/arrow.png',
                                          height: 12,
                                          width: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12, right: 12),
                                child: Container(
                                  height: 1,
                                  color: Colors
                                      .grey, // Gray color for the bottom line
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),

              );
            }

      // body: Padding(
      //   padding: const EdgeInsets.only(bottom: 5),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: <Widget>[
      //       middleHeader(context, '${widget.name}'),
      //       Container(
      //         height: MediaQuery.of(context).size.height *
      //             0.8, // Adjust the height as needed
      //         child: ListView.builder(
      //           shrinkWrap: true,
      //           itemCount: itemList2.length,
      //           itemBuilder: (context, index) {
      //             return Column(
      //               children: <Widget>[
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(vertical: 1.0),
      //                   child: GestureDetector(
      //                     onTap: () {
      //                       var name = itemList2[index]['temple'];
      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) =>
      //                               FireEmergency(name: name),
      //                         ),
      //                       );
      //                     },
      //                     child: ListTile(
      //                       leading: Container(
      //                         width: 35,
      //                         height: 35,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(5),
      //                           gradient: const LinearGradient(
      //                             colors: [Colors.red, Colors.orange],
      //                             begin: Alignment.topLeft,
      //                             end: Alignment.bottomRight,
      //                           ),
      //                         ),
      //                         child: Center(
      //                           child: Image.asset(
      //                             itemList2[index]['leadingIcon']!,
      //                             width: 30,
      //                             height: 30,
      //                             fit: BoxFit.cover,
      //                           ),
      //                         ),
      //                       ),
      //                       title: Text(
      //                         itemList2[index]['temple']!,
      //                         style: const TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 14,
      //                           color: Colors.black87,
      //                         ),
      //                       ),
      //                       trailing: Row(
      //                         mainAxisSize: MainAxisSize.min,
      //                         children: [
      //                           Image.asset(
      //                             'assets/images/arrow.png',
      //                             height: 12,
      //                             width: 12,
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 12,right: 12),
      //                   child: Container(
      //                     height: 1,
      //                     color: Colors.grey, // Gray color for the bottom line
      //                   ),
      //                 ),
      //               ],
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

  }

