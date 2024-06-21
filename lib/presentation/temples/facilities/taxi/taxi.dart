
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puri/presentation/temples/facilities/taxi/taxiStand.dart';
import 'package:puri/presentation/temples/facilities/taxi/taxihome.dart';


class Taxi extends StatefulWidget {
  const Taxi({super.key});

  @override
  State<Taxi> createState() => _FacilitiesHomeState();
}

class _FacilitiesHomeState extends State<Taxi> with SingleTickerProviderStateMixin {

  TabController? _tabController;
  final List<Map<String, String>> itemList = [
    {'image': 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201804/ola_1.jpeg','texi': 'Ola Cabs'},
    {'image': 'https://www.ft.com/__origami/service/image/v2/images/raw/https%3A%2F%2Fd1e00ek4ebabms.cloudfront.net%2Fproduction%2F72721ab5-fb03-40f9-bfa6-332d5c02e2c7.jpg?source=next-article&fit=scale-down&quality=highest&width=700&dpr=1','texi': 'Uber'},
    {'image': 'https://play-lh.googleusercontent.com/JfA0mDgT-llt2A7R848ooAIfvu00eSgE1GKNs6hybN8SU-lgwcRnqtJL8nIUt178s8I','texi': 'Savaari Car Rentals'},
    {'image': ' https://content.jdmagicbox.com/comp/bhubaneshwar/u4/0674px674.x674.220914102230.u2u4/catalogue/sadashiv-travels-budheshwari-colony-bhubaneshwar-taxi-services-xj9oivsf08.jpg','texi': 'Odisha Taxi'},
    {'image': 'https://i.pinimg.com/236x/1d/b2/ae/1db2ae9b0700f5911e74208d713882ce.jpg','texi': 'Puri Taxi Service'},
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    //BackButtonInterceptor.add(myInterceptor);
  }
  @override
  void dispose() {
    //BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   NavigationUtils.onWillPop(context);
  //   return true;
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar
            body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.red,
                    isScrollable:true,
                    labelPadding: EdgeInsets.only(right: 45.0),
                    unselectedLabelColor: Colors.black45,

                    tabs: const [
                      Tab(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text('TAXI STAND',style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('TAXI',style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),


                    ]),
              ),
              SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height - 50.0,
                width:  double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    /// here you put gallery code
                    // CookiePage(),
                    TaxiStand(),
                    TaxiHome(),

                  ],
                ),
              ),

            ]
        )
      // ],
    );
  }
}
