import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/presentation/eventsAndNewsletter/webviewEventsAndNewsletter.dart';
import 'package:puri/presentation/marriageCertificate/web_view_stack.dart';
import '../../app/generalFunction.dart';


class EventsAndNewSletter extends StatefulWidget {

  final name;
  EventsAndNewSletter({super.key, this.name});

  @override
  State<EventsAndNewSletter> createState() => _MarriageCertificateState();
}

class _MarriageCertificateState extends State<EventsAndNewSletter> {


  GeneralFunction generalFunction = GeneralFunction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack('${widget.name}'),
      drawer:
      generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: EventsWebViewStack()),

    );

  }
}
