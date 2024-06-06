import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/temples/temple_gallery.dart';
import '../app/generalFunction.dart';
import '../app/navigationUtils.dart';
import '../resources/app_text_style.dart';
import '../resources/custom_elevated_button.dart';

class TemplesDetail extends StatefulWidget {
  final templeName;
  final image;

  TemplesDetail({super.key, this.templeName, this.image});
  @override
  State<TemplesDetail> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<TemplesDetail> {
  GeneralFunction generalFunction = GeneralFunction();

  @override
  void initState() {
    print('-----27--${widget.templeName}');
    print('-----28--${widget.image}');
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
      appBar: getAppBarBack('TEMPLES'),
      drawer:
          generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.network('${widget.image}', fit: BoxFit.cover),
              ),
              Positioned(
                top: 155,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      // Background color of the container
                      borderRadius: BorderRadius.circular(17.0),
                      // Circular border radius
                      border: Border.all(
                        color: Colors.yellow, // Border color
                        width: 0.5, // Border width
                      ),
                    ),
                    child: CustomElevatedButton(
                      text: 'VIEW GALLERY',
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => TempleGallery(templeName:'${widget.templeName}')));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          middleHeader(context,'${widget.templeName}'),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width - 50,
              color: Color(0xFFD3D3D3),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  Text('Temple Timings',
                      style: AppTextStyle.font16penSansExtraboldRedTextStyle),
                  SizedBox(height: 15),
                  Text('Summer',
                      style: AppTextStyle.font16penSansExtraboldRedTextStyle),
                  SizedBox(height: 5),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Morning 05:00 ',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                        Text('am to ',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                        Text('12:00 pm',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Evening 02:00 ',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                        Text('pm to ',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                        Text('8:00 pm',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Winter',
                      style: AppTextStyle.font16penSansExtraboldRedTextStyle),
                  SizedBox(height: 5),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Morning 05:00 ',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                        Text('am to ',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                        Text('12:00 pm',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Evening 02:00 ',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                        Text('pm to ',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                        Text('8:00 pm',
                            style: AppTextStyle
                                .font14penSansExtraboldBlack45TextStyle),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text('Aarti Time',
                      style: AppTextStyle.font16penSansExtraboldRedTextStyle),
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' ',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        Text(
                          ' - ',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        Text(
                          '',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: Colors.red,
                // Background color of the container
                borderRadius: BorderRadius.circular(28.0),
                // Circular border radius
                border: Border.all(
                  color: Colors.yellow, // Border color
                  width: 0.5, // Border width
                ),
              ),
              child: CustomElevatedButton(
                text: 'LIVE DARSHAN',
                onTap: () {
                  print('---Live Darshan-----');
                  // Navigator.of(context).push(MaterialPageRoute(builder: (_) => TempleGallery(
                  //)));
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Image.asset('assets/images/templelement2.png',
              // Replace with your first image path
              height: 30.0,
              width: MediaQuery.of(context).size.width),
          SizedBox(height: 10),
          Center(
            child: Text('About Temple',
                style: AppTextStyle.font16penSansExtraboldRedTextStyle),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: readmore('readmore'),
          ),
          SizedBox(height: 10),
          Image.asset('assets/images/templeelement3.png',
              // Replace with your first image path
              height: 30.0,
              width: MediaQuery.of(context).size.width),
          SizedBox(height: 10),
          Center(
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: Colors.red,
                // Background color of the container
                borderRadius: BorderRadius.circular(28.0),
                // Circular border radius
                border: Border.all(
                  color: Colors.yellow, // Border color
                  width: 0.5, // Border width
                ),
              ),
              child: CustomElevatedButton(
                text: 'CLICK ON MAP TO NAVIGATE',
                onTap: () {
                  print('---Live Darshan-----');
                  // Navigator.of(context).push(MaterialPageRoute(builder: (_) => TempleGallery(
                  //)));
                },
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
