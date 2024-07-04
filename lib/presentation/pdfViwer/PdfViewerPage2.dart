
import 'package:flutter/material.dart';

// class PdfViewerPage extends StatefulWidget {
//   const PdfViewerPage({super.key});
//
//   @override
//   _PdfViewerPageState createState() => _PdfViewerPageState();
// }
//
// class _PdfViewerPageState extends State<PdfViewerPage> {
//   bool _isLoading = true;
//   late PDFDocument document;
//
//   @override
//   void initState() {
//     super.initState();
//     loadDocument();
//   }
//
//   loadDocument() async {
//     document = await PDFDocument.fromURL('https://upegov.in/purione/assets/images/RathyatraSchedule.pdf');
//     setState(() => _isLoading = false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : PDFViewer(document: document),
//       ),
//     );
//   }
// }
