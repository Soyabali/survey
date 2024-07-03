import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewPropertyTax extends StatefulWidget {
  const WebViewPropertyTax({super.key});

  @override
  State<WebViewPropertyTax> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewPropertyTax> {

  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
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
        Uri.parse('https://sujogportal.odisha.gov.in/puri/service/property-tax/'),
       // Uri.parse('https://sujog.odisha.gov.in/home'),
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
