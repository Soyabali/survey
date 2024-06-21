import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/app/generalFunction.dart';
import '../../resources/app_text_style.dart';


class NearByPlace extends StatefulWidget {
  final name;
  const NearByPlace({super.key, required this.name});

  @override
  State<NearByPlace> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<NearByPlace> {
  GeneralFunction generalFunction = GeneralFunction();

  final List<Map<String, String>> itemList = [
    {'image': "https://media2.thrillophilia.com/images/photos/000/191/420/original/1581338298_A-kettle-elegantly-painted-using-Odisha'-traditional-art-forms..jpg?w=753&h=450&dpr=1.0",'nearbyPlace': 'Raghurajpur','distance':'10.0 Km'},
    {'image': "https://media2.thrillophilia.com/images/photos/000/191/431/original/1581339067_Konark_Surya_Temple.jpg?w=753&h=450&dpr=1.0",'nearbyPlace': 'Konark','distance':'35.8 Km'},
    {'image': "https://media2.thrillophilia.com/images/photos/000/191/432/original/1581339281_1*q4MrUIdwiuVg13iZ71wjTw.jpeg?w=753&h=450&dpr=1.0",'nearbyPlace': 'Chilika Lake','distance':'37.0 Km'},
    {'image': "https://media2.thrillophilia.com/images/photos/000/191/429/original/1581338781_fixedw_large_4x.jpg?w=753&h=450&dpr=1.0",'nearbyPlace': 'Pipili','distance':'37.2 Km'},
    {'image': "https://media2.thrillophilia.com/images/photos/000/191/436/original/1581339706_Chandipur_Bearch_2B2.jpg?w=753&h=450&dpr=1.0",'nearbyPlace': 'Astaranga Beach','distance':'60.8 Km'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBarBack(context,'Near by Place'),
        drawer:
        generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
        // appBar
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: itemList.length,
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
                                var templeName = "${itemList[index]['nearbyPlace']}";
                                var image  =  "${itemList[index]['image']}";
                                print('-----165---$templeName');
                                print('-----166---$image');
                                // navigator
                                // Navigator.of(context).push(MaterialPageRoute(builder: (_) => TemplesDetail(
                                //     templeName:templeName,image:image)));
                              },

                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5.0),
                                          child: Image.network('${itemList[index]['image']}',
                                            height: 90,
                                            width: 90,
                                            fit: BoxFit.fill)),

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
                                              Text('${itemList[index]['nearbyPlace']}',style: AppTextStyle.font14penSansExtraboldRedTextStyle),
                                              //   style: TextStyle(
                                              //     color: Colors.red,fontSize: 16
                                              // ),),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Rating',style:AppTextStyle.font14penSansExtraboldRedTextStyle

                                                  ),
                                                  SizedBox(width: 50,),
                                                  Text('Rate',style:AppTextStyle.font14penSansExtraboldRedTextStyle),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  Icon(Icons.star,size: 15,color: Colors.orange,),
                                                  Icon(Icons.star,size: 15,color: Colors.grey,),
                                                  SizedBox(width: 20),
                                                  Text('₹3274.0',style:AppTextStyle.font10penSansExtraboldBlack45TextStyle),
                                                  Text(' - ',style:AppTextStyle.font10penSansExtraboldBlack45TextStyle),
                                                  Text('₹4811.0',style:AppTextStyle.font10penSansExtraboldBlack45TextStyle),

                                                ],
                                              ),
                                              SizedBox(height: 2),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.location_on, size: 16, color: Colors.red),
                                                  SizedBox(width: 5),
                                                  Expanded(
                                                    child: Text(
                                                      '${itemList[index]['distance']}',
                                                      style: AppTextStyle.font10penSansExtraboldBlack45TextStyle,
                                                      overflow: TextOverflow.ellipsis, // Optional: Adds "..." at the end if text is too long
                                                    ),
                                                  ),
                                                ],
                                              )


                                            ],

                                          ),

                                        ),

                                        // child: ListTile(
                                        //     title: Text(
                                        //       "${itemList[index]['temple']}",
                                        //       style: TextStyle(
                                        //         color: Colors.red,
                                        //         fontSize: 14,
                                        //       ),
                                        //     ),
                                        //     trailing: Image.asset('assets/images/arrow.png',
                                        //       height: 12,
                                        //       width: 12,
                                        //     )
                                        // ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),

                                        ),
                                        child: Image.asset('assets/images/arrow.png',
                                          height: 12,
                                          width: 12,
                                        )

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
          ),
        )
      // ],
    );
  }
}
