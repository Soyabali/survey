import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puri/app/generalFunction.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../services/getEmergencyContactList.dart';
import '../../complaints/grievanceStatus/grievanceStatus.dart';
import '../../nodatavalue/NoDataValue.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_text_style.dart';


class FireEmergency extends StatefulWidget {

  final name;
  final iHeadCode;
  final sIcon;
  const FireEmergency({super.key, required this.name, required this.iHeadCode, required this.sIcon});

  @override
  State<FireEmergency> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<FireEmergency> {
  // GeneralFunction? generalFunction;
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {'image': 'https://www.drishtiias.com/images/uploads/1698053713_image1.png','temple': 'Fire Helpline'},
    {'image': 'https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-hinohp2v89f6sovfrqk7d6bfj7-20231002122234.Medi.jpeg','temple': 'Control Room'},
    {'image': 'https://images.indianexpress.com/2021/08/Puri-temple-1.jpeg','temple': 'Shri Debendra'},
    {'image': 'https://t4.ftcdn.net/jpg/03/57/53/11/360_F_357531159_cumH01clbXOo32Ytvkb7qGYspCJjj4gB.jpg','temple': 'Dy. Fire Officr'},
    {'image': 'https://w0.peakpx.com/wallpaper/672/441/HD-wallpaper-puri-jagannath-temple-cloud.jpg','temple': 'Shri Parthasarathi Sahoo'},
  ];
  //

  List<Map<String, dynamic>>? emergencyListResponse;

  String? sName, sContactNo;

  // GeneralFunction generalFunction = GeneralFunction();

  getEmergencyListResponse() async {
    emergencyListResponse = await GetEmergencyContactListeRepo().getEmergencyContactList(context,'${widget.iHeadCode}');
    print('------42----$emergencyListResponse');
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getEmergencyListResponse();
    print('-----52--${widget.iHeadCode}');
    print('-----55---images--${widget.sIcon}');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
       // appBar: getAppBarBack(context,"${widget.name}"),
        appBar: getAppBarBack(context,"${widget.name}"),
        drawer:
        generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
        // appBar
        body:
        emergencyListResponse == null
            ? NoDataScreenPage()
            :
        ListView(
            children: <Widget>[
              middleHeader(context,'${widget.name}'),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,bottom: 80),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: emergencyListResponse?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        // padding: EdgeInsets.only(left: 5,right: 5),
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            //color: Colors.red,
                            border: Border.all(
                              color: Colors.orange, // Set the golden border color
                              width: 1.0, // Set the width of the border
                            ),
                          ),
                          child: InkWell(
                            onTap: (){
                              var templeName = "${emergencyListResponse![index]['sName']}";
                              sContactNo  =  "${emergencyListResponse![index]['sContactNo']}";

                              print('-----165---$sContactNo');

                              // navigator
                              // Navigator.of(context).push(MaterialPageRoute(builder: (_) => TemplesDetail(
                              //     templeName:templeName,image:image)));
                            },

                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    child: ClipOval(
                                      child: Image.network(
                                        '${widget.sIcon}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 110,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('${emergencyListResponse![index]['sName']}', style: GoogleFonts.openSans(
                                              color: AppColors.green,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                            ),),
                                            // Text('${itemList[index]['temple']}',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                                            SizedBox(height: 5),
                                            Text('${emergencyListResponse![index]['sDesignation']}',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                                            // Row(
                                            //   mainAxisAlignment: MainAxisAlignment.start,
                                            //   children: [
                                            //     Text('${emergencyListResponse![index]['sDesignation']}',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                                            //     // SizedBox(width: 5),
                                            //     //
                                            //     // Text('${emergencyListResponse![index]['sName']}',
                                            //     //     style:AppTextStyle.font10penSansExtraboldBlack45TextStyle),
                                            //     //
                                            //
                                            //   ],
                                            // ),
                                            SizedBox(height: 5),
                                            Text('${emergencyListResponse![index]['sContactNo']}',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    print('----calling ---');
                                    var sContactNo  =  "${emergencyListResponse![index]['sContactNo']}";
                                    launchUrlString("tel:$sContactNo");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),

                                        ),
                                        child: Image.asset('assets/images/callicon.png',
                                          height: 12,
                                          width: 12,
                                        )

                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Image.asset(
                                          "assets/images/listelementtop.png",
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                      SizedBox(height: 35),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          "assets/images/listelementbottom.png",
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ]
        )
      // ],
    );
  }
}
