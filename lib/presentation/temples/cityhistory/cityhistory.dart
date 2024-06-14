import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../app/generalFunction.dart';
import '../../../app/navigationUtils.dart';
import '../../resources/custom_elevated_button.dart';
import '../temple_gallery.dart';
import 'citymap.dart';



class CityHistory extends StatefulWidget {

  final templeName;
  final image;

  CityHistory({super.key, this.templeName, this.image});
  @override
  State<CityHistory> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<CityHistory> {
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

 // get generalFunction => null;

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
      appBar: getAppBar("City History"),
      drawer: generalFunction.drawerFunction(context,'Suaib Ali','9871950881'),

      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.network('https://www.drishtiias.com/images/uploads/1698053713_image1.png', fit: BoxFit.cover),
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
          middleHeader(context,'City History'),
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
                borderRadius: BorderRadius.circular(17.0),
                // Circular border radius
                border: Border.all(
                  color: Colors.yellow, // Border color
                  width: 0.5, // Border width
                ),
              ),
              child: CustomElevatedButton(
                text: 'CITY MAP',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CityMap()),
                  );
                  // double lat = 19.817743;
                  // double long = 85.859839;
                  // launchGoogleMaps(lat,long);

                  },
              ),
            ),
            // child: Container(
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
