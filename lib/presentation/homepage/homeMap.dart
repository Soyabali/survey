
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../app/generalFunction.dart';
import 'homePageWebView.dart';


class HomePageMap extends StatefulWidget {

  final lat;
  final long;
  //HomePageMap({super.key, this.name});
  HomePageMap({super.key, required this.lat, required this.long});

  @override
  State<HomePageMap> createState() => _BirthAndDeathState();
}

class _BirthAndDeathState extends State<HomePageMap> {

  GeneralFunction generalFunction = GeneralFunction();

  @override
  void initState() {
    super.initState();
     //final lat = double.parse('${widget.lat}');
    //final lat = double.parse('${widget.lat}');

   // print('----27--${widget.lat}');
    //print('----28--${widget.long}');
    // BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: getAppBarBack(context,'${widget.name}'),
      appBar: getAppBarBack(context,"Map"),
      drawer: generalFunction.drawerFunction(context, 'Suaib Ali', '9871950881'),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: HomePageWebViewStack('${widget.lat}','${widget.long}')),
    );
  }
}
