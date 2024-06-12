import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/generalFunction.dart';
import '../../../app/navigationUtils.dart';
import '../../resources/app_text_style.dart';
import 'onlineComplaintForm.dart';


class OnlineComplaint extends StatefulWidget {
  final name;
  OnlineComplaint({super.key, this.name});
  @override
  State<OnlineComplaint> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<OnlineComplaint> {
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {
      'image':
      'https://www.drishtiias.com/images/uploads/1698053713_image1.png',
      'temple': 'Sanitation & Public Health'
    },
    {
      'image':
      'https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-hinohp2v89f6sovfrqk7d6bfj7-20231002122234.Medi.jpeg',
      'temple': 'Water, Drainage & Sewerage'
    },
    {
      'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
      'temple': 'Lokanath Temple'
    },
    {
      'image':
      'https://t4.ftcdn.net/jpg/03/57/53/11/360_F_357531159_cumH01clbXOo32Ytvkb7qGYspCJjj4gB.jpg',
      'temple': 'Stay Animals Catching Services'
    },
    {
      'image':
      'https://w0.peakpx.com/wallpaper/672/441/HD-wallpaper-puri-jagannath-temple-cloud.jpg',
      'temple': 'Encroachment'
    },
    {
      'image':
      'https://www.drishtiias.com/images/uploads/1698053713_image1.png',
      'temple': 'Miscellaneous'
    },
    {
      'image':
      'https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-hinohp2v89f6sovfrqk7d6bfj7-20231002122234.Medi.jpeg',
      'temple': 'Holding Tax'
    },
    {
      'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
      'temple': 'Civic Infrastructure'
    },
    {
      'image':
      'https://t4.ftcdn.net/jpg/03/57/53/11/360_F_357531159_cumH01clbXOo32Ytvkb7qGYspCJjj4gB.jpg',
      'temple': 'Slum /Project/Welfare Schemes'
    },
    {
      'image':
      'https://w0.peakpx.com/wallpaper/672/441/HD-wallpaper-puri-jagannath-temple-cloud.jpg',
      'temple': 'Licence & Parking'
    },
  ];

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
      appBar: getAppBarBack(context,'${widget.name}'),
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
              itemCount: itemList.length, // Set the number of items in the list
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                         var name = '${itemList[index]['temple']}';
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OnlineComplaintForm(complaintName:name)),
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
                          title: Text('${itemList[index]['temple']}', style: AppTextStyle.font16penSansExtraboldRedTextStyle), // Example title with index
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

