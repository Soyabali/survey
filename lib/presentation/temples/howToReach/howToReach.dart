
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/presentation/temples/howToReach/reachmap.dart';
import '../../../app/generalFunction.dart';
import '../../resources/app_text_style.dart';
import '../../resources/custom_elevated_button.dart';
import '../temple_gallery.dart';


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
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar("How To Reach"),
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
                    child: Image.asset("assets/images/puribanner.jpeg",fit:BoxFit.fill),
                  ),
                  // Positioned(
                  //   top: 155,
                  //   left: 0,
                  //   right: 0,
                  //   child: Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Container(
                  //       height: 35,
                  //       decoration: BoxDecoration(
                  //         color: Colors.red,
                  //         // Background color of the container
                  //         borderRadius: BorderRadius.circular(17.0),
                  //         // Circular border radius
                  //         border: Border.all(
                  //           color: Colors.yellow, // Border color
                  //           width: 0.5, // Border width
                  //         ),
                  //       ),
                  //       child: CustomElevatedButton(
                  //         text: 'VIEW GALLERY',
                  //         onTap: () {
                  //           Navigator.of(context).push(
                  //               MaterialPageRoute(builder: (_) => TempleGallery(templeName:'Puri')));
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                      Look for bus operators that provide services from Delhi to Puri. Some well-known operators include Odisha State Road Transport Corporation (OSRTC), private operators like RedBus, and other interstate bus services.
                      Online Booking: Websites like RedBus, MakeMyTrip, and AbhiBus allow you to search for and book bus tickets online. You can compare prices, read reviews, and select your preferred bus type (AC, non-AC, sleeper, etc.).
 
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
                    borderRadius: BorderRadius.circular(17.0),
                    // Circular border radius
                    border: Border.all(
                      color: Colors.yellow, // Border color
                      width: 0.5, // Border widt0
                    ),
                  ),
                  child: CustomElevatedButton(
                    text: 'Direction',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReachDirectionMap()),
                      );
                      // double lat = 19.817743;
                      // double long = 85.859839;
                      // launchGoogleMaps(lat,long);

                    },
                  ),
                ),
                // child: Container(
              ),
              // InkWell(
              //
              //   onTap: (){
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => ReachDirectionMap()),
              //     );
              //     print('----By Road ---Details---');
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 130,right: 95),
              //     child: Center(
              //       child: Container(
              //         height: 35,
              //         width: 250,
              //         decoration: BoxDecoration(
              //           color: Colors.red,
              //           // Background color of the container
              //           borderRadius: BorderRadius.circular(28.0),
              //           // Circular border radius
              //           border: Border.all(
              //             color: Colors.yellow, // Border color
              //             width: 0.5, // Border width
              //           ),
              //         ),
              //         child: Container(
              //             height: 35,
              //             decoration: BoxDecoration(
              //               color: Colors.red,
              //               // Background color of the container
              //               borderRadius: BorderRadius.circular(17.0),
              //               // Circular border radius
              //               border: Border.all(
              //                 color: Colors.yellow, // Border color
              //                 width: 0.5, // Border width
              //               ),
              //             ),
              //             child: ElevatedButton(
              //               onPressed: (){
              //                 print('----Road Detail---');
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(builder: (context) => ReachDirectionMap()),
              //                 );
              //                // ReachDirectionMap
              //               },
              //               style: ElevatedButton.styleFrom(
              //                 foregroundColor: Colors.white,
              //                 backgroundColor: Colors.red,
              //                 shadowColor: Colors.red, // Custom shadow color
              //                 elevation: 5, // Text color
              //               ).copyWith(
              //                 overlayColor: MaterialStateProperty.resolveWith<Color?>(
              //                       (Set<MaterialState> states) {
              //                     if (states.contains(MaterialState.pressed)) {
              //                       return Colors.yellow; // Splash color when pressed
              //                     }
              //                     return null; // Default splash color
              //                   },
              //                 ),
              //               ),
              //               child: Center(
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                            Text('Directions',style: AppTextStyle
              //                           .font14penSansExtraboldWhiteTextStyle,),
              //                         SizedBox(width: 5),
              //                         Icon(Icons.directions,size: 20,color: Colors.white,)
              //                     ],
              //                 ),
              //               ),
              //               // child: Text('Details',style: AppTextStyle
              //               //     .font14penSansExtraboldWhiteTextStyle,),
              //             )
              //         )
              //       ),
              //     ),
              //   ),
              // ),

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
                child: Text('By Train',
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
                      Train Operators: Indian Railways operates several trains to Puri from various cities across India.
Online Booking: Use the IRCTC website or app for booking. Other platforms like MakeMyTrip, Cleartrip, and Paytm also offer train booking services.
From Delhi: Purushottam Express (12802), Nandan Kanan Express (12816), Neelachal Express (12876)
From Kolkata: Puri Express (12837), Dhauli Express (12821)
From Mumbai: Konark Express (11019)
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
                    borderRadius: BorderRadius.circular(17.0),
                    // Circular border radius
                    border: Border.all(
                      color: Colors.yellow, // Border color
                      width: 0.5, // Border width
                    ),
                  ),
                  child: CustomElevatedButton(
                    text: 'Train Details',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => CityMap()),
                      // );
                      // double lat = 19.817743;
                      // double long = 85.859839;
                      // launchGoogleMaps(lat,long);

                    },
                  ),
                ),
                // child: Container(
              ),
              // InkWell(
              //   onTap: (){
              //     print('----By Road ---Details---');
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 130,right: 130),
              //     child: Center(
              //       child: Container(
              //           height: 35,
              //           decoration: BoxDecoration(
              //             color: Colors.red,
              //             // Background color of the container
              //             borderRadius: BorderRadius.circular(28.0),
              //             // Circular border radius
              //             border: Border.all(
              //               color: Colors.yellow, // Border color
              //               width: 0.5, // Border width
              //             ),
              //           ),
              //           child: Container(
              //               height: 35,
              //               decoration: BoxDecoration(
              //                 color: Colors.red,
              //                 // Background color of the container
              //                 borderRadius: BorderRadius.circular(17.0),
              //                 // Circular border radius
              //                 border: Border.all(
              //                   color: Colors.yellow, // Border color
              //                   width: 0.5, // Border width
              //                 ),
              //               ),
              //               child: ElevatedButton(
              //                 onPressed: (){
              //                   print('----Road Detail---');
              //                 },
              //                 style: ElevatedButton.styleFrom(
              //                   foregroundColor: Colors.white,
              //                   backgroundColor: Colors.red,
              //                   shadowColor: Colors.red, // Custom shadow color
              //                   elevation: 5, // Text color
              //                 ).copyWith(
              //                   overlayColor: MaterialStateProperty.resolveWith<Color?>(
              //                         (Set<MaterialState> states) {
              //                       if (states.contains(MaterialState.pressed)) {
              //                         return Colors.yellow; // Splash color when pressed
              //                       }
              //                       return null; // Default splash color
              //                     },
              //                   ),
              //                 ),
              //                 child: Center(
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       Text('Details',style: AppTextStyle
              //                           .font14penSansExtraboldWhiteTextStyle,),
              //                       SizedBox(width: 15),
              //                       Icon(Icons.directions,size: 20,color: Colors.white,)
              //                     ],
              //                   ),
              //                 ),
              //                 // child: Text('Details',style: AppTextStyle
              //                 //     .font14penSansExtraboldWhiteTextStyle,),
              //               )
              //           )
              //       ),
              //     ),
              //   ),
              // ),
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
                child: Text('By Air',
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
                        Nearest Airport: The closest airport to Puri is Biju Patnaik International Airport (BBI) in Bhubaneswar, located about 60 kilometers away.
Airlines: Major Indian airlines like Air India, IndiGo, Vistara, SpiceJet, and GoAir operate flights to Bhubaneswar from various cities.
Online Booking: Use flight booking platforms such as MakeMyTrip, Cleartrip, Yatra, and the airlines' own websites to book your tickets.
                      Delhi to Bhubaneswar: Multiple daily flights with an approximate flight duration of 2-2.5 hours.
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
                    borderRadius: BorderRadius.circular(17.0),
                    // Circular border radius
                    border: Border.all(
                      color: Colors.yellow, // Border color
                      width: 0.5, // Border width
                    ),
                  ),
                  child: CustomElevatedButton(
                    text: 'Air Details',
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => CityMap()),
                      // );
                      // double lat = 19.817743;
                      // double long = 85.859839;
                      // launchGoogleMaps(lat,long);

                    },
                  ),
                ),
                // child: Container(
              ),
              // InkWell(
              //   onTap: (){
              //     print('----By Road ---Details---');
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => ReachDirectionMap()),
              //     );
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 130,right: 130),
              //     child: Center(
              //       child: Container(
              //           height: 35,
              //           decoration: BoxDecoration(
              //             color: Colors.red,
              //             // Background color of the container
              //             borderRadius: BorderRadius.circular(28.0),
              //             // Circular border radius
              //             border: Border.all(
              //               color: Colors.yellow, // Border color
              //               width: 0.5, // Border width
              //             ),
              //           ),
              //           child: Container(
              //               height: 35,
              //               decoration: BoxDecoration(
              //                 color: Colors.red,
              //                 // Background color of the container
              //                 borderRadius: BorderRadius.circular(17.0),
              //                 // Circular border radius
              //                 border: Border.all(
              //                   color: Colors.yellow, // Border color
              //                   width: 0.5, // Border width
              //                 ),
              //               ),
              //               child: ElevatedButton(
              //                 onPressed: (){
              //                   print('----Road Detail---');
              //                 },
              //                 style: ElevatedButton.styleFrom(
              //                   foregroundColor: Colors.white,
              //                   backgroundColor: Colors.red,
              //                   shadowColor: Colors.red, // Custom shadow color
              //                   elevation: 5, // Text color
              //                 ).copyWith(
              //                   overlayColor: MaterialStateProperty.resolveWith<Color?>(
              //                         (Set<MaterialState> states) {
              //                       if (states.contains(MaterialState.pressed)) {
              //                         return Colors.yellow; // Splash color when pressed
              //                       }
              //                       return null; // Default splash color
              //                     },
              //                   ),
              //                 ),
              //                 child: Center(
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       Text('Details',style: AppTextStyle
              //                           .font14penSansExtraboldWhiteTextStyle,),
              //                       SizedBox(width: 15),
              //                       Icon(Icons.directions,size: 20,color: Colors.white,)
              //                     ],
              //                   ),
              //                 ),
              //                 // child: Text('Details',style: AppTextStyle
              //                 //     .font14penSansExtraboldWhiteTextStyle,),
              //               )
              //           )
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 5),
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
