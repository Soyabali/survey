import 'dart:io';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/presentation/eventsAndNewsletter/webviewEventsAndNewsletter.dart';
import '../../app/generalFunction.dart';
import '../../app/navigationUtils.dart';


class EventsAndNewSletter extends StatefulWidget {

  final name;
  EventsAndNewSletter({super.key, this.name});

  @override
  State<EventsAndNewSletter> createState() => _MarriageCertificateState();
}

class _MarriageCertificateState extends State<EventsAndNewSletter> {


  GeneralFunction generalFunction = GeneralFunction();

  @override
  void initState() {
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
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: EventsWebViewStack()),

    );

  }
}
