import 'dart:math';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../app/generalFunction.dart';
import '../../app/navigationUtils.dart';
import '../resources/app_text_style.dart';
import 'fireemergency/fireemergency.dart';

class EmergencyContacts extends StatefulWidget {
  final name;

  EmergencyContacts({super.key, this.name});

  @override
  State<EmergencyContacts> createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {
  GeneralFunction generalFunction = GeneralFunction();

  final List<String> items = [
    'Fire Emergency',
    'Police',
    'Women Help',
    'Medical Emergency',
    'Other Important Numbers',
  ];
  final List<Map<String, String>> itemList = [
    {
      'image':
          'https://www.drishtiias.com/images/uploads/1698053713_image1.png',
      'temple': 'Fire Emergency'
    },
    {
      'image':
          'https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-hinohp2v89f6sovfrqk7d6bfj7-20231002122234.Medi.jpeg',
      'temple': 'Police'
    },
    {
      'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg',
      'temple': 'Women Help'
    },
    {
      'image':
          'https://t4.ftcdn.net/jpg/03/57/53/11/360_F_357531159_cumH01clbXOo32Ytvkb7qGYspCJjj4gB.jpg',
      'temple': 'Medical Emergency'
    },
    {
      'image':
          'https://w0.peakpx.com/wallpaper/672/441/HD-wallpaper-puri-jagannath-temple-cloud.jpg',
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
      appBar: getAppBarBack(context, '${widget.name}'),
      drawer:
          generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              middleHeader(context, '${widget.name}'),
              Image.asset(
                'assets/images/templelement2.png',
                height: 18.0,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 10),

              Container(
                //  height: MediaQuery.of(context).size.height,
                height: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            var name = '${items[index]}';
                            print('---59--$name');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FireEmergency(name: name)),
                            );
                          },
                          splashColor: Colors.red.withAlpha(30),
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: getRandomBorderColor(),
                                  width: 3.0,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                title: Text(
                                  '${itemList[index]['temple']}',
                                  style: AppTextStyle
                                      .font14penSansExtraboldRedTextStyle,
                                ),
                                trailing: Image.asset(
                                  'assets/images/arrow.png',
                                  height: 12,
                                  width: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 15),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/templeelement3.png',
                  height: 30.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
