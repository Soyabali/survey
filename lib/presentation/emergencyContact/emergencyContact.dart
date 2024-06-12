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
      appBar: getAppBarBack(context,'${widget.name}'),
      drawer:
      generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: ListView(
        children: <Widget>[
          middleHeader(context,'${widget.name}'),
          Image.asset('assets/images/templelement2.png',
              height: 20.0,
              width: MediaQuery.of(context).size.width),
          const SizedBox(height: 10),
          Container(
            height: 450,
            child: ListView.builder(
              itemCount: items.length, // Set the number of items in the list
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
                          MaterialPageRoute(builder: (context) =>
                              FireEmergency(name:name)),
                        );

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
                            title: Text('${items[index]}', style: AppTextStyle.font16penSansExtraboldRedTextStyle), // Example title with index
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
          const SizedBox(height: 10),

          Image.asset('assets/images/templeelement3.png',
              height: 20.0,
              width: MediaQuery.of(context).size.width),

        ],
      ),
    );
  }
}

