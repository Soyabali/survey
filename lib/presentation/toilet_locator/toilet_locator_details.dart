import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../app/generalFunction.dart';
import '../../app/navigationUtils.dart';
import '../resources/app_text_style.dart';


class LoiletLocatorDetails extends StatefulWidget {

  final name;
  LoiletLocatorDetails({super.key, this.name});

  @override
  State<LoiletLocatorDetails> createState() => _KnowYourWardState();
}

class _KnowYourWardState extends State<LoiletLocatorDetails> {

  GeneralFunction generalFunction = new GeneralFunction();

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
        appBar: getAppBarBack(context,'${widget.name}'),
        drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
        body: ListView(
            children: [
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 8,
                      color: Colors.white,
                     // color: Color(0xFFF0F8FF),
                     // color: Color(0xFFD3D3D3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        // color: AppColors.appGrey,
                        // width: _width! * 90,
                        color: Colors.white,
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                           Container(
                                 height:55,
                                 //color: Color(0xFFF5F5F5),
                              decoration: BoxDecoration(
                               //color: Colors.blue, // Background color
                               color: Color(0xFFF5F5F5),
                               borderRadius: BorderRadius.circular(5), // Border radius
                             ),

                             child: Padding(
                               padding: const EdgeInsets.only(bottom: 15),
                               child: ListTile(
                                      leading: Image.asset(
                                        'assets/images/toilet.png',
                                        width: 30, // Set the width of the image
                                        height: 30,
                                        fit: BoxFit.fill,
                                        // Set the height of the image
                                      ),
                                      title: Text('Name',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                      subtitle: Text('SBM Toilet',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                      trailing: Container(
                                        child: Text('Free',style: AppTextStyle.font16OpenSansRegularRedTextStyle),
                                      ),
                                      onTap: () {
                                        // Handle the tap event here
                                      },
                                    ),
                             ),
                                ),

                            SizedBox(height: 5),
                            Text(
                                "Male",
                                style: AppTextStyle.font16OpenSansRegularRedTextStyle,
                              ),
                            SizedBox(height: 5),
                            Container(
                              height: 40,
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.0, // Thickness of the border
                                        ),
                                        borderRadius: BorderRadius.circular(5.0), // Radius of the rounded corners
                                      ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Western Sheet',
                                              style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                          ),
                                        //SizedBox(width: 20),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 5),
                                          child: Container(
                                              //color: Colors.white,
                                              height: 30,
                                              width: 30,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.green,
                                                  width: 4.0, // Thickness of the bottom line
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                                child: Text('4',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle
                                                ),
                                              ),
                                            ),
                                        ),
                                      ],
                                    )
                                  ),
                                ),
                                SizedBox(width: 10), // Add some spacing between the containers
                                Expanded(
                                  child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.0, // Thickness of the border
                                        ),
                                        borderRadius: BorderRadius.circular(5.0), // Radius of the rounded corners
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              'Indian Sheet',
                                                style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                            ),
                                          //SizedBox(width: 20),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5),
                                            child: Container(
                                              //color: Colors.white,
                                              height: 30,
                                              width: 30,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.green,
                                                    width: 4.0, // Thickness of the bottom line
                                                  ),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text('4',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ),

                              ],
                              ),
                             ),
                            SizedBox(height: 5),
                            Container(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0, // Thickness of the border
                                            ),
                                            borderRadius: BorderRadius.circular(5.0), // Radius of the rounded corners
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                               Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Toilet',
                                                    style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                ),

                                              //SizedBox(width: 20),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 5),
                                                child: Container(
                                                  //color: Colors.white,
                                                  height: 30,
                                                  width: 30,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.red,
                                                        width: 4.0, // Thickness of the bottom line
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('Yes',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle,),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 10), // Add some spacing between the containers
                                    Expanded(
                                      child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0, // Thickness of the border
                                            ),
                                            borderRadius: BorderRadius.circular(5.0), // Radius of the rounded corners
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                               Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Bathroom',
                                                    style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                ),
                                              //SizedBox(width: 20),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 5),
                                                child: Container(
                                                  //color: Colors.white,
                                                  height: 30,
                                                  width: 30,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.red,
                                                        width: 4.0, // Thickness of the bottom line
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('No',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                           SizedBox(height: 5),
                            Text(
                                "Female",
                                style: AppTextStyle.font16OpenSansRegularRedTextStyle,
                              ),
                            SizedBox(height: 5),
                              Container(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0, // Thickness of the border
                                            ),
                                            borderRadius: BorderRadius.circular(5.0), // Radius of the rounded corners
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Western Sheet',
                                                    style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                ),
                                              //SizedBox(width: 20),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 5),
                                                child: Container(
                                                  //color: Colors.white,
                                                  height: 30,
                                                  width: 30,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.green,
                                                        width: 4.0, // Thickness of the bottom line
                                                      ),
                                                    ),
                                                  ),
                                                  child:Center(
                                                    child: Text('4',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 10), // Add some spacing between the containers
                                    Expanded(
                                      child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0, // Thickness of the border
                                            ),
                                            borderRadius: BorderRadius.circular(5.0), // Radius of the rounded corners
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Indian Sheet',
                                                    style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                ),
                                              //SizedBox(width: 20),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 5),
                                                child: Container(
                                                  //color: Colors.white,
                                                  height: 30,
                                                  width: 30,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.green,
                                                        width: 4.0, // Thickness of the bottom line
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('4',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0, // Thickness of the border
                                            ),
                                            borderRadius: BorderRadius.circular(5.0), // Radius of the rounded corners
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Toilet',
                                                    style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                ),
                                              //SizedBox(width: 20),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 5),
                                                child: Container(
                                                  //color: Colors.white,
                                                  height: 30,
                                                  width: 30,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.red,
                                                        width: 4.0, // Thickness of the bottom line
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('Yes',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 10), // Add some spacing between the containers
                                    Expanded(
                                      child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0, // Thickness of the border
                                            ),
                                            borderRadius: BorderRadius.circular(5.0), // Radius of the rounded corners
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Bathroom',
                                                    style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                ),
                                              //SizedBox(width: 20),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 5),
                                                child: Container(
                                                  //color: Colors.white,
                                                  height: 30,
                                                  width: 30,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.red,
                                                        width: 4.0, // Thickness of the bottom line
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('No',
                                                        style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Handicap",
                                style: AppTextStyle.font16OpenSansRegularRedTextStyle,
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0, // Thickness of the border
                                            ),
                                            borderRadius: BorderRadius.circular(5.0), // Radius of the rounded corners
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                               Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Toilet',
                                                    style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                ),
                                              //SizedBox(width: 20),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 5),
                                                child: Container(
                                                  //color: Colors.white,
                                                  height: 30,
                                                  width: 30,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.red,
                                                        width: 4.0, // Thickness of the bottom line
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('No',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 10), // Add some spacing between the containers
                                    Expanded(
                                      child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.0, // Thickness of the border
                                            ),
                                            borderRadius: BorderRadius.circular(5.0), // Radius of the rounded corners
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Bathroom',
                                                    style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                ),
                                              //SizedBox(width: 20),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 5),
                                                child: Container(
                                                  //color: Colors.white,
                                                  height: 30,
                                                  width: 30,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.red,
                                                        width: 4.0, // Thickness of the bottom line
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text('No',
                                                        style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // This aligns the children widgets to the left and right ends
                                  children: <Widget>[
                                    Text(
                                      'Address',
                                      style: AppTextStyle.font16OpenSansRegularRedTextStyle),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Image.asset(
                                        'assets/images/map2.png', // Replace with your actual path
                                        width: 18, // Adjust as needed
                                        height: 18, // Adjust as needed
                                        fit: BoxFit.fill, // Adjust as needed
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Text(
                              //   "Address",
                              //   style: AppTextStyle.font16OpenSansRegularRedTextStyle,
                              // ),
                              SizedBox(height: 5),
                              Text(
                                "Badambadi,Cuttack,Odisha 753012",
                                  style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                              SizedBox(height: 5),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                   Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Distance :",
                                          style: AppTextStyle.font16OpenSansRegularRedTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "1272.82 km",
                                                style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),


                                          ],
                                        ),
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
              ),
            ]
        )
    );
  }
}
