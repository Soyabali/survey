import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/presentation/marriageCertificate/web_view_stack.dart';
import '../../app/generalFunction.dart';


class MarriageCertificate extends StatefulWidget {

  final name;
  MarriageCertificate({super.key, this.name});

  @override
  State<MarriageCertificate> createState() => _MarriageCertificateState();
}

class _MarriageCertificateState extends State<MarriageCertificate> {


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
          child: WebViewStack()),

    );

  }
}
