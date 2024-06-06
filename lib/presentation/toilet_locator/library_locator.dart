import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../app/generalFunction.dart';
import '../../resources/app_text_style.dart';

class LiibraryLocator extends StatefulWidget {

  final name;
  LiibraryLocator({super.key, this.name});

  @override
  State<LiibraryLocator> createState() => _KnowYourWardState();
}

class _KnowYourWardState extends State<LiibraryLocator> {

  GeneralFunction generalFunction = new GeneralFunction();

  @override
  void initState() {
    print('-----27--${widget.name}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBarBack('${widget.name}'),
        drawer:
        generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
        body: ListView(
            children: [
              SizedBox(height: 5),
              Column(
                children: [
                  Card(
                    elevation: 8,
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0), // Rounded corners
                            border: Border.all(
                              color: Colors.orange, // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0), // Clip image to match container's rounded corners
                            child: Image.asset(
                              'assets/images/hotel_1.png',
                              fit: BoxFit.cover,
                              height: 200,
                              width: 200, // Match the height and width of the container
                            ),
                          ),
                        ),
                          ListTile(
                             // leading: Icon(Icons.account_circle),
                              title: Text('District Library',style: AppTextStyle.font16OpenSansRegularWhiteTextStyle),
                              subtitle: Text('Swaraj Ashram, Nimchouri, Cuttack,Odisha 753002',style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                              trailing: Image.asset(
                                'assets/images/arrow.png',
                                height: 12,
                                width: 12,
                              ),
                              onTap: () {
                                print('ListTile 1 tapped');
                              },
                            ),
                          ],
                        )
                    ),
                  ),
                  SizedBox(height: 5),
                  Card(
                    elevation: 8,
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0), // Rounded corners
                                border: Border.all(
                                  color: Colors.orange, // Border color
                                  width: 2.0, // Border width
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0), // Clip image to match container's rounded corners
                                child: Image.asset(
                                  'assets/images/hotel_2.png',
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: 200, // Match the height and width of the container
                                ),
                              ),
                            ),
                            ListTile(
                              // leading: Icon(Icons.account_circle),
                              title: Text('Biju Memorial Library',style: AppTextStyle.font16OpenSansRegularWhiteTextStyle),
                              subtitle: Text('Anand Bhawan, Tulsipur,Cuttack,Odisha 753008',
                                  style: AppTextStyle.font14penSansExtraboldBlack45TextStyle),
                              trailing: Image.asset(
                                'assets/images/arrow.png',
                                height: 12,
                                width: 12,
                              ),
                              onTap: () {
                                print('ListTile 1 tapped');
                              },
                            ),
                          ],
                        )
                    ),
                  ),

                ],
              ),

            ]
        )
    );
  }
}
