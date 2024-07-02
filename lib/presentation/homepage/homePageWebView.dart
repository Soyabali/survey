import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class HomePageWebViewStack extends StatefulWidget {
  final lati;
  final longi;
  const HomePageWebViewStack(this.lati,this.longi, {super.key});

  @override
  State<HomePageWebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<HomePageWebViewStack> {

  var loadingPercentage = 0;
  late final WebViewController controller;
  var latitude,longitude;

  @override
  void initState() {

    latitude = '${widget.lati}';
    longitude = '${widget.longi}';
    print('--lati---23----$latitude');
    print('--longi---24----$longitude');
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)  // Enable JavaScript
      ..loadRequest(
        Uri.parse('https://upegov.in/purione/LocationOnMap.aspx?lat=$latitude&lon=$longitude'),
        //Uri.parse('https://upegov.in/purione/LocationOnMap.aspx?lat=28.6064228&lon=77.3695757'),

      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
