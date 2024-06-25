import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/presentation/complaints/grievanceStatus/searchBar.dart';
import '../../../app/generalFunction.dart';
import '../../resources/app_text_style.dart';

class GrievanceStatus extends StatefulWidget {

  final name;
  GrievanceStatus({super.key, this.name});

  @override
  State<GrievanceStatus> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<GrievanceStatus> {

  GeneralFunction generalFunction = GeneralFunction();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack(context,'${widget.name}'),
      drawer:
          generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 10, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
               Padding(
                padding: EdgeInsets.only(left: 5,right: 5,top: 5),
                child: SearchBar2(),
              ),
              SizedBox(height: 5),
              SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.white,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 2,right: 2),
                            child: Container(
                               height: 50,
                               decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                color :Colors.white,
                                border: Border.all(
                                  color: Colors.grey, // Border color
                                  width: 1, // Border width
                                ),
                              ),

                              child: Stack(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                        color :Color(0xFFF5F5F5),
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                         // color: Colors.blueGrey,
                                          width: 35,
                                          height: 35,
                                          // Height and width must be equal to make it circular
                                          decoration: const BoxDecoration(
                                           // color: Colors.orange,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              'assets/images/home12.jpeg',
                                              height: 25,
                                              width: 25,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        title: const Text(
                                          "Ward No -5",
                                          style: TextStyle(
                                              color: Colors.black45, fontSize: 14),
                                        ),
                                      )),
                                  Positioned(
                                    top: 10,
                                    right: 15,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      // Height and width must be equal to make it circular
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        // Makes the container circular
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Center(

                                        child: Image.asset(
                                          'assets/images/picture.png',
                                          height: 25,
                                          width: 25,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 5),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(width: 5),
                              Text('Complaint No',
                                  style: AppTextStyle
                                      .font16penSansExtraboldBlack45TextStyle),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('202405310001',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack26TextStyle),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 5),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(width: 5),
                              Text('Category',
                                  style: AppTextStyle
                                      .font16penSansExtraboldBlack45TextStyle),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('Sanitation & Public Health',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack26TextStyle),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 5),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(width: 5),
                              Text('Sub Category',
                                  style: AppTextStyle
                                      .font16penSansExtraboldBlack45TextStyle),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('Night Sweeping',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack26TextStyle),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 5),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(width: 5),
                              Text('Complaint Details',
                                  style: AppTextStyle
                                      .font16penSansExtraboldBlack45TextStyle),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('complaint related to Category',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack26TextStyle),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 5),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(width: 5),
                              Text('Address',
                                  style: AppTextStyle
                                      .font16penSansExtraboldBlack45TextStyle),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('Puri Odisha',
                                style: AppTextStyle
                                    .font14penSansExtraboldBlack26TextStyle),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 5),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(width: 5),
                              Text('Status',
                                  style: AppTextStyle
                                      .font16penSansExtraboldBlack45TextStyle),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('Pending',
                                style:
                                    AppTextStyle.font14penSansExtraboldRedTextStyle),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5,left: 5,right: 5,top: 5),
                            child: Row(
                              children: [
                                // First Container
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    //color: Colors.blue,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: const LinearGradient(
                                        colors: [Colors.red, Colors.orange],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),

                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10, top: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Posted By',
                                              style: AppTextStyle
                                                  .font140penSansExtraboldWhiteTextStyle),
                                          Text('Soyab',
                                              style: AppTextStyle
                                                  .font140penSansExtraboldWhiteTextStyle)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                // Second Container
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: Container(
                                      height: 50,
                                      //color: Colors.blue,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: const LinearGradient(
                                          colors: [Colors.red, Colors.orange],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 5),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Posted At',
                                                style: AppTextStyle
                                                    .font140penSansExtraboldWhiteTextStyle),
                                            Text('31/May/2024 15:53',
                                                style: AppTextStyle
                                                    .font140penSansExtraboldWhiteTextStyle)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
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
    );
  }
}
