import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class ReachWebView extends StatefulWidget {
  const ReachWebView({super.key});

  @override
  State<ReachWebView> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<ReachWebView> {

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
        Uri.parse('https://www.google.com/maps/place/Puri,+Odisha/@19.8088216,85.7804002,13z/data=!3m1!4b1!4m6!3m5!1s0x3a19c4180256e495:0x496a9d8b30c1fad7!8m2!3d19.8134554!4d85.8312359!16zL20vMDR0cTUy?entry=ttu'),
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
