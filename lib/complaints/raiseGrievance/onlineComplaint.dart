import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:puri/complaints/raiseGrievance/onlineComplaintForm.dart';
import '../../app/generalFunction.dart';
import '../../app/navigationUtils.dart';
import '../../resources/app_text_style.dart';



class OnlineComplaint extends StatefulWidget {
  final name;
  OnlineComplaint({super.key, this.name});
  @override
  State<OnlineComplaint> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<OnlineComplaint> {
  GeneralFunction generalFunction = GeneralFunction();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    NavigationUtils.onWillPop(context);
    return true;
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack('${widget.name}'),
      // appBar: AppBar(
      //     backgroundColor: Colors.red,
      //     elevation: 10,
      //     shadowColor: Colors.orange,
      //     toolbarOpacity: 0.5,
      //     leading: Builder(
      //       builder: (BuildContext context) {
      //         return InkWell(
      //           onTap: () {
      //           },
      //           child: InkWell(
      //             onTap: (){
      //               print('------75---');
      //               Navigator.pop(context);
      //               //Navigator.pop(context);
      //             },
      //             child: Padding(
      //               padding: const EdgeInsets.only(left: 16.0),
      //               // Adjust the left margin as needed
      //               child: Transform.scale(
      //                 scale: 0.6,
      //                 // Adjust the scale factor as needed to reduce the image size
      //                 child: Container(
      //                   height: 25,
      //                   width: 25,
      //                   child: Image.asset("assets/images/back.png"),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //     title: Row(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: <Widget>[
      //         Image.asset(
      //           "assets/images/header_line1.png",
      //           width: 80,
      //           height: 15,
      //         ),
      //         SizedBox(width: 10),
      //         Text(
      //             'Online Complaint',
      //             style: AppTextStyle
      //                 .font16penSansExtraboldWhiteTextStyle
      //         ),
      //         SizedBox(width: 10),
      //         Image.asset(
      //           "assets/images/header_line2.png",
      //           width: 75,
      //           height: 10,
      //         ),
      //       ],
      //     ),
      //   ),

      drawer:
      generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: ListView(
        children: <Widget>[
          middleHeader(context,'${widget.name}'),
          Image.asset('assets/images/templelement2.png',
              // Replace with your first image path
              height: 18.0,
              width: MediaQuery.of(context).size.width),
          SizedBox(height: 10),
          Container(
            height: 450,
            child: ListView.builder(
              itemCount: 10, // Set the number of items in the list
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OnlineComplaintForm(complaintName:"Online Complaint")),
                        );
                        // Add your onTap functionality here
                      //  var complaintName = 'Online Complaint $index';

                      },
                      splashColor: Colors.red.withAlpha(30),
                      borderRadius: BorderRadius.circular(10.0),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.info, color: Colors.orange),
                          title: Text('Online Complaint $index', style: AppTextStyle.font16penSansExtraboldRedTextStyle), // Example title with index
                            trailing: Image.asset(
                              'assets/images/arrow.png',
                              height: 12,
                              width: 12,
                            )
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Image.asset('assets/images/templeelement3.png',
              // Replace with your first image path
              height: 30.0,
              width: MediaQuery.of(context).size.width),

        ],
      ),
    );
  }
}

