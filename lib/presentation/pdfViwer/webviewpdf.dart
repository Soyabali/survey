import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewPdfStack extends StatefulWidget {
  const WebViewPdfStack({super.key});

  @override
  State<WebViewPdfStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewPdfStack> {
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
        onWebResourceError: (error) {
          print('Error: ${error.description}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to load: ${error.description}')),
          );
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..loadRequest(
        Uri.parse('https://docs.google.com/viewer?url=https://upegov.in/purione/assets/images/RathyatraSchedule.pdf'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}



// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter/material.dart';
//
//
// class WebViewPdfStack extends StatefulWidget {
//   const WebViewPdfStack({super.key});
//
//   @override
//   State<WebViewPdfStack> createState() => _WebViewStackState();
// }
//
// class _WebViewStackState extends State<WebViewPdfStack> {
//
//   var loadingPercentage = 0;
//   late final WebViewController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..setNavigationDelegate(NavigationDelegate(
//         onPageStarted: (url) {
//           setState(() {
//             loadingPercentage = 0;
//           });
//         },
//         onProgress: (progress) {
//           setState(() {
//             loadingPercentage = progress;
//           });
//         },
//         onPageFinished: (url) {
//           setState(() {
//             loadingPercentage = 100;
//           });
//         },
//         onWebResourceError: (error) {
//           print('Error: ${error.description}');
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to load: ${error.description}')),
//           );
//         },
//       ))
//       ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
//       ..loadRequest(
//         Uri.parse('https://upegov.in/purione/assets/images/RathyatraSchedule.pdf'),
//         // Uri.parse('https://sujog.odisha.gov.in/home'),
//       );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WebView PDF Example'),
//       ),
//       body: Stack(
//         children: [
//           WebViewWidget(
//             controller: controller,
//           ),
//           if (loadingPercentage < 100)
//             LinearProgressIndicator(
//               value: loadingPercentage / 100.0,
//             ),
//         ],
//       ),
//     );
//   }
// }
//
//
// // class WebViewPdfStack extends StatefulWidget {
// //   const WebViewPdfStack({super.key});
// //
// //   @override
// //   State<WebViewPdfStack> createState() => _WebViewStackState();
// // }
// //
// // class _WebViewStackState extends State<WebViewPdfStack> {
// //
// //   var loadingPercentage = 0;
// //   late final WebViewController controller;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     controller = WebViewController()
// //       ..setNavigationDelegate(NavigationDelegate(
// //         onPageStarted: (url) {
// //           setState(() {
// //             loadingPercentage = 0;
// //           });
// //         },
// //         onProgress: (progress) {
// //           setState(() {
// //             loadingPercentage = progress;
// //           });
// //         },
// //         onPageFinished: (url) {
// //           setState(() {
// //             loadingPercentage = 100;
// //           });
// //         },
// //       ))
// //       ..setJavaScriptMode(JavaScriptMode.unrestricted)  // Enable JavaScript
// //       ..loadRequest(
// //         Uri.parse('https://upegov.in/purione/assets/images/RathyatraSchedule.pdf'),
// //        // Uri.parse('https://sujog.odisha.gov.in/home'),
// //       );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         WebViewWidget(
// //           controller: controller,
// //         ),
// //         if (loadingPercentage < 100)
// //           LinearProgressIndicator(
// //             value: loadingPercentage / 100.0,
// //           ),
// //       ],
// //     );
// //   }
// // }
