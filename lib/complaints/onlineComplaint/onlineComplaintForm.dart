import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/temples/temple_gallery.dart';

import '../../app/generalFunction.dart';
import '../../resources/app_text_style.dart';
import '../../resources/custom_elevated_button.dart';


class OnlineComplaintForm extends StatefulWidget {
  final complaintName;

  OnlineComplaintForm({super.key, this.complaintName});
  @override
  State<OnlineComplaintForm> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<OnlineComplaintForm> {
  GeneralFunction generalFunction = GeneralFunction();

  @override
  void initState() {
    print('-----27--${widget.complaintName}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack('${widget.complaintName}'),
      drawer:
      generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: ListView(
        children: <Widget>[
          middleHeader(context,'${widget.complaintName}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.invert_colors_on_sharp,size: 20),
              SizedBox(width: 5),
              Text('Fill the below details',style:
              AppTextStyle.font16penSansExtraboldBlack45TextStyle)

            ],
          ),

        ],
      ),
    );
  }
}
