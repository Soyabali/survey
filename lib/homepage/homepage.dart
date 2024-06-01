import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/resources/app_strings.dart';
import 'package:puri/resources/assets_manager.dart';
import '../complaints/complaintHomePage.dart';
import '../resources/app_text_style.dart';
import '../resources/routes_managements.dart';
import '../temples/templehome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTextVisible2 = false;
  bool isTextVisible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[
         Container(
              width: MediaQuery.of(context).size.width-50,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(ImageAssets.templepuri4,
              fit: BoxFit.cover,),
            ),
          Positioned(
            top: 70,
              right: 10,
              left: 10,
              child: Center(
                child: Container(
                   child: Stack(
                     children: <Widget>[
                       Image.asset(ImageAssets.cityname,
                           height: 180),
                               Positioned(
                                 top: 65,
                                 left: 100,
                                 child: Text(AppStrings.puriOne,
                                   style: AppTextStyle.font30penSansExtraboldWhiteTextStyle
                                 )

                               )

                     ],
                   )
                ),
              )
          ),
          // circle
          Positioned(
            top: 280,
            left: 15,
            right: 15,
            child: LayoutBuilder(
              builder: (context, constraints) {
                double containerSize = constraints.maxWidth;
                return Container(
                  height: containerSize,
                  width: containerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(containerSize / 2), // Make it circular
                    image: const DecorationImage(
                      image: AssetImage(ImageAssets.changecitybackground), // Provide your image path here
                      fit: BoxFit.cover, // Cover the entire container
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: containerSize * 0.47,
                        left: containerSize * 0.38,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "SELECT PLACE",
                            style: AppTextStyle.font10penSansExtraboldWhiteTextStyle,
                          ),
                        ),
                      ),
                      Positioned(
                        top: containerSize * 0.09,
                        left: containerSize * 0.40,
                        child: InkWell(
                          onTap: () {
                            print("-----105----");
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => TemplesHome()),
                            );
                          },
                          child: Container(
                            width: containerSize * 0.2,
                            height: containerSize * 0.2,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Text(
                              'Temples',
                              style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: containerSize * 0.35,
                        left: containerSize * 0.07,
                        child: InkWell(
                          onTap: () {
                            print('-----114-----');
                          },
                          child: Container(
                            width: containerSize * 0.2,
                            height: containerSize * 0.2,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Text(
                              'Help Line',
                              style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: containerSize * 0.35,
                        right: containerSize * 0.06,
                        left: containerSize * 0.65,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ComplaintHomePage()),
                            );
                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(builder: (context) => ComplaintHomePage()),
                            // );
                          },
                          child: Container(
                            width: containerSize * 0.2,
                            height: containerSize * 0.2,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Text(
                              'Grievance',
                              style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: containerSize * 0.12,
                        right: containerSize * 0.18,
                        child: InkWell(
                          onTap: () {
                            print('----130------');
                          },
                          child: Container(
                            width: containerSize * 0.2,
                            height: containerSize * 0.2,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Text(
                              'Near by Place',
                              style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: containerSize * 0.12,
                        left: containerSize * 0.20,
                        child: InkWell(
                          onTap: () {
                            print('----138------');
                          },
                          child: Container(
                            width: containerSize * 0.2,
                            height: containerSize * 0.2,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Text(
                              'Toilet Locator ',
                              style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
          // Positioned(
          //   top: 280,
          //   left: 15,
          //   right: 15,
          //   child: LayoutBuilder(
          //     builder: (context, constraints) {
          //       double containerSize = constraints.maxWidth;
          //       return Container(
          //         height: containerSize,
          //         width: containerSize,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(containerSize / 2), // Make it circular
          //           image: const DecorationImage(
          //             image: AssetImage(ImageAssets.changecitybackground), // Provide your image path here
          //             fit: BoxFit.cover, // Cover the entire container
          //           ),
          //         ),
          //         child: Stack(
          //           children: <Widget>[
          //             Positioned(
          //               top: containerSize * 0.47,
          //               left: containerSize * 0.38,
          //               child: Padding(
          //                 padding: const EdgeInsets.all(2.0),
          //                 child: Text(
          //                   "SELECT PLACE",
          //                   style: AppTextStyle.font10penSansExtraboldWhiteTextStyle,
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: containerSize * 0.11,
          //               left: containerSize * 0.40,
          //               child: InkWell(
          //                 onTap: () {
          //                   print("-----105----");
          //                   Navigator.of(context).pushReplacement(
          //                     MaterialPageRoute(builder: (context) => TemplesHome()),
          //                   );
          //                 },
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(2.0),
          //                   child: Text(
          //                     'Temples',
          //                     style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: containerSize * 0.40,
          //               left: containerSize * 0.07,
          //               child: InkWell(
          //                 onTap: () {
          //                   print('-----114-----');
          //                 },
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(2.0),
          //                   child: Text(
          //                     'Help Line',
          //                     style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               top: containerSize * 0.40,
          //               right: containerSize * 0.07,
          //               child: InkWell(
          //                 onTap: () {
          //                   Navigator.of(context).pushReplacement(
          //                     MaterialPageRoute(builder: (context) => ComplaintHomePage()),
          //                   );
          //                 },
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(2.0),
          //                   child: Text(
          //                     'Complaints',
          //                     style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               bottom: containerSize * 0.15,
          //               right: containerSize * 0.18,
          //               child: InkWell(
          //                 onTap: () {
          //                   print('----130------');
          //                 },
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(2.0),
          //                   child: Text(
          //                     'Near by Place',
          //                     style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Positioned(
          //               bottom: containerSize * 0.14,
          //               left: containerSize * 0.16,
          //               child: InkWell(
          //                 onTap: () {
          //                   print('----138------');
          //                 },
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Text(
          //                     'Toilet Locator ',
          //                     style: AppTextStyle.font14penSansExtraboldWhiteTextStyle,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      )
    );
  }
}

