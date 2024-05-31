import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/temples/temple_gallery.dart';
import 'package:readmore/readmore.dart';
import '../../app/generalFunction.dart';
import '../../resources/app_text_style.dart';
import '../../resources/assets_manager.dart';
import '../../resources/custom_elevated_button.dart';


class HowToReach extends StatefulWidget {
  HowToReach({super.key});

  @override
  State<HowToReach> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<HowToReach> {
  GeneralFunction generalFunction = GeneralFunction();
  final List<Map<String, String>> itemList = [
    {
      'image':
      'https://www.drishtiias.com/images/uploads/1698053713_image1.png',
      'temple': 'Jagannath Temple'
    },
    {
      'image':
      'https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-hinohp2v89f6sovfrqk7d6bfj7-20231002122234.Medi.jpeg',
      'temple': 'PanchaTirtha'
    },
    {
      'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
      'temple': 'Lokanath Temple'
    },
    {
      'image':
      'https://t4.ftcdn.net/jpg/03/57/53/11/360_F_357531159_cumH01clbXOo32Ytvkb7qGYspCJjj4gB.jpg',
      'temple': 'Vimala Temple'
    },
    {
      'image':
      'https://w0.peakpx.com/wallpaper/672/441/HD-wallpaper-puri-jagannath-temple-cloud.jpg',
      'temple': 'Varahi Temple'
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar("HOW TO REACH"),
        drawer: generalFunction.drawerFunction(context,'Suaib Ali','9871950881'),

        body: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/images/reachmathura.png",fit:BoxFit.cover),
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
                                MaterialPageRoute(builder: (_) => TempleGallery(templeName:'Puri')));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              middleHeader(context,'Puri'),
              SizedBox(height: 5),
              Center(
                child: Text('By Road',
                    style: AppTextStyle.font16penSansExtraboldRedTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  //height: 315,
                  width: MediaQuery.of(context).size.width - 50,
                  //color: Color(0xFFD3D3D3),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Text(''' 
                         Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,
                         remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                       ''',textAlign: TextAlign.justify,
                          style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
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
                    text: 'BUS DETAILS',
                    onTap: () {
                      print('---Live Darshan-----');
                      // Navigator.of(context).push(MaterialPageRoute(builder: (_) => TempleGallery(
                      //)));
                    },
                  ),
                ),
              ),

              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Image.asset('assets/images/line.png',
                    // Replace with your first image path
                    height: 50.0,
                    width: MediaQuery.of(context).size.width),
              ),
              SizedBox(height: 15),
              Center(
                child: Text('BY TRAIN',
                    style: AppTextStyle
                        .font18penSansExtraboldRedTextStyle),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 315,
                  width: MediaQuery.of(context).size.width - 50,
                  //color: Color(0xFFD3D3D3),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Text(''' 
                         Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,
                         remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                       ''',textAlign: TextAlign.justify,
                          style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
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
                    text: 'TRAIN DETAILS',
                    onTap: () {
                      print('---Live Darshan-----');
                      // Navigator.of(context).push(MaterialPageRoute(builder: (_) => TempleGallery(
                      //)));
                    },
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Image.asset('assets/images/line.png',
                    // Replace with your first image path
                    height: 50.0,
                    width: MediaQuery.of(context).size.width),
              ),
              SizedBox(height: 10),
              Center(
                child: Text('BY Air',
                    style: AppTextStyle
                        .font18penSansExtraboldRedTextStyle),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 315,
                  width: MediaQuery.of(context).size.width - 50,
                  //color: Color(0xFFD3D3D3),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Text(''' 
                         Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,
                         remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                       ''',textAlign: TextAlign.justify,
                          style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                    ],
                  ),
                ),
              ),
              Image.asset('assets/images/templeelement3.png',
                  // Replace with your first image path
                  height: 20.0,
                  width: MediaQuery.of(context).size.width),
              SizedBox(height: 50)


                ],

              ),
          ),
        ));
  }
}
