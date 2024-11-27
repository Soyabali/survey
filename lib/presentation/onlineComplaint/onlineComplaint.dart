
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../app/generalFunction.dart';
import '../../services/bindComplaintCategoryRepo.dart';
import '../../services/getEmergencyContactTitleRepo.dart';
import '../complaints/complaintHomePage.dart';
import 'onlineComplaintForm.dart';
import '../nodatavalue/NoDataValue.dart';


class OnlineComplaint extends StatefulWidget {

  final name;

  OnlineComplaint({super.key, this.name});

  @override
  State<OnlineComplaint> createState() => _OnlineComplaintState();
}

class _OnlineComplaintState extends State<OnlineComplaint> {

  GeneralFunction generalFunction = GeneralFunction();

  List<Map<String, dynamic>>? emergencyTitleList;

  bool isLoading = true; // logic
  String? sName, sContactNo;
  // GeneralFunction generalFunction = GeneralFunction();

  getEmergencyTitleResponse() async {
    emergencyTitleList = await BindComplaintCategoryRepo().bindComplaintCategory(context);
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
      appBar: AppBar(
        // statusBarColore
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF12375e),
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        // backgroundColor: Colors.blu
        backgroundColor: Color(0xFF255898),
        leading: GestureDetector(
          onTap: (){
            print("------back---");
           // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ComplaintHomePage()),
            );
          },
          child: Icon(Icons.arrow_back_ios,
            color: Colors.white,),
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Online Complaint',
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
      //appBar: getAppBarBack(context, '${widget.name}'),
      drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: isLoading
          ? Center(child: Container())
          : (emergencyTitleList == null || emergencyTitleList!.isEmpty)
          ? NoDataScreenPage()
          :
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // middleHeader(context, '${widget.name}'),
          Container(
            height: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed
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
                          var iCategoryCode = emergencyTitleList![index]['iCategoryCode'];
                          var sCategoryName = emergencyTitleList![index]['sCategoryName'];


                          // sIcon
                          print('----sCategoryName---$sCategoryName');
                          print('----iCategoryCode---$iCategoryCode');


                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OnlineComplaintForm(name:sCategoryName,iCategoryCode:iCategoryCode),
                            ),
                          );

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
                            // child: Center(
                            //   child: Image.asset(
                            //     itemList2[index]['leadingIcon']!,
                            //     width: 30,
                            //     height: 30,
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                          ),
                          title: Text(
                            emergencyTitleList![index]['sCategoryName']!,
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
                        color: Colors.grey, // Gray color for the bottom line
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
}

