import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:puri/complaints/onlineComplaint/onlineComplaintForm.dart';
import '../../app/generalFunction.dart';
import '../../resources/app_text_style.dart';
import '../../resources/custom_elevated_button.dart';
import '../../temples/temple_gallery.dart';


class OnlineComplaint extends StatefulWidget {
  final name;
  OnlineComplaint({super.key, this.name});
  @override
  State<OnlineComplaint> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<OnlineComplaint> {
  GeneralFunction generalFunction = GeneralFunction();

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
        children: <Widget>[
          middleHeader(context,'${widget.name}'),
          Image.asset('assets/images/templelement2.png',
              // Replace with your first image path
              height: 30.0,
              width: MediaQuery.of(context).size.width),
          SizedBox(height: 10),
          Container(
            height: 450,
            child: ListView.builder(
              itemCount: 10, // Set the number of items in the list
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Add your onTap functionality here
                        var complaintName = 'Online Complaint $index';
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  OnlineComplaintForm(complaintName:complaintName)),
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
                          title: Text('Online Complaint $index', style: AppTextStyle.font16penSansExtraboldRedTextStyle), // Example title with index
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

