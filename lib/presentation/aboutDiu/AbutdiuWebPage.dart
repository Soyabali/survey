import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class AbutDiuWebPage extends StatefulWidget {

  final webPage;
  AbutDiuWebPage(this.webPage, {super.key});

  @override
  State<AbutDiuWebPage> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<AbutDiuWebPage> {

  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    var page = "${widget.webPage}";
    print("------21--->>>>---xxxx----$page");

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
        //  sPageLink
        //Uri.parse(page),
       // Uri.parse('http://49.50.66.156/website/history.aspx')
        Uri.parse('${widget.webPage}'),
        // Uri.parse(sPageLink),,
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
