import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../app/generalFunction.dart';
import '../../app/navigationUtils.dart';
import '../resources/app_text_style.dart';
import 'cookipage.dart';

class TempleGallery extends StatefulWidget {
  final templeName;
  TempleGallery({super.key, required this.templeName,});

  @override
  State<TempleGallery> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<TempleGallery> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    print('-----27--${widget.templeName}');
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
   // BackButtonInterceptor.add(myInterceptor);
  }
  @override
  void dispose() {
   // BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }
  //
  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   NavigationUtils.onWillPop(context);
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack(context,"Gallery"),
      body: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
        child: ListView(
          children: <Widget>[
            middleHeader(context,'${widget.templeName}'),
            PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: Color(0xFFC88D67),
                  isScrollable:true,
                  labelPadding: EdgeInsets.only(right: 45.0),
                  unselectedLabelColor: Color(0xFFCDCDCD),
                  tabs:  [
                    Tab(
                      child: Text('PHOTOS',style: AppTextStyle.fontTab16penSansExtraboldRedTextStyle,
                        //style: AppTextStyle.fontTab16penSansExtraboldRedTextStyle),
                      ),
                    ),
                    Tab(
                      child: Text('VIDEOS',
                        style: AppTextStyle.fontTab16penSansExtraboldRedTextStyle,
                      ),
                    ),
                  ]),
            ),
            Image.asset('assets/images/templelement2.png',
                // Replace with your first image path
                height: 35.0,
                width: MediaQuery.of(context).size.width),
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width:  double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>
                [
                  /// here you put gallery code
                  CookiePage(),
                  CookiePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
