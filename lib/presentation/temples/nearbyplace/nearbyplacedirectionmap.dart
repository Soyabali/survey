import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:puri/app/generalFunction.dart';
import 'dart:ui' as ui;

import '../templeGoogleMap.dart';


class NearbyMap2 extends StatefulWidget {
  final double fLatitude;
  final double fLongitude;
  final String locationName;
  final String sLocationAddress;

  const NearbyMap2({
    Key? key,
    required this.fLatitude,
    required this.fLongitude,
    required this.locationName,
    required this.sLocationAddress,
  }) : super(key: key);

  @override
  State<NearbyMap2> createState() => _TempleGoogleMapState();
}

class _TempleGoogleMapState extends State<NearbyMap2> {
  GoogleMapController? mapController;
  late LatLng _center;
  final Set<Marker> _markers = {};
  LatLng? _currentMapPosition;
  dynamic? lat,long;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  @override
  void didUpdateWidget(NearbyMap2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fLatitude != widget.fLatitude || oldWidget.fLongitude != widget.fLongitude) {
      _initializeMap();
    }
  }

  void _initializeMap() {
    _center = LatLng(widget.fLatitude, widget.fLongitude);
    _currentMapPosition = _center;
    _clearMarkers();
    _addMarker();
    _moveCamera();
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  void _clearMarkers() {
    setState(() {
      _markers.clear();
    });
  }

  void _addMarker() async {
    if (_currentMapPosition != null) {
      final Uint8List markerIcon = await _createCustomMarkerBitmap(
        widget.locationName,
        widget.sLocationAddress,
      );

      setState(() {
        _markers.add(Marker(
          markerId: MarkerId(_currentMapPosition.toString()),
          position: _currentMapPosition!,
          icon: BitmapDescriptor.fromBytes(markerIcon),
        ));
      });
    }
  }

  void _onCameraMove(CameraPosition position) {
    _currentMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _moveCamera();
  }

  void _moveCamera() {
    mapController?.animateCamera(CameraUpdate.newLatLng(_center));
  }

  Future<Uint8List> _createCustomMarkerBitmap(String title, String snippet) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.white;
    final double width = 300.0;
    final double height = 150.0;  // Increased height to accommodate larger text

    // Draw rounded rectangle
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0.0, 0.0, width, height),
        Radius.circular(10.0),
      ),
      paint,
    );

    const double iconSize = 100.0;
    final Paint markerPaint = Paint()..color = Colors.red;

    // Draw the marker path
    final Path markerPath = Path()
      ..moveTo(width / 2 - iconSize / 2, height)
      ..lineTo(width / 2, height + iconSize / 2)
      ..lineTo(width / 2 + iconSize / 2, height)
      ..close();
    canvas.drawPath(markerPath, markerPaint);

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    // Draw title
    textPainter.text = TextSpan(
      text: title,
      style: TextStyle(
        fontSize: 25.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: width - 20.0,
    );
    textPainter.paint(
      canvas,
      Offset(10.0, 10.0),
    );

    // Draw snippet
    textPainter.text = TextSpan(
      text: snippet,
      style: TextStyle(
        fontSize: 25.0,
        color: Colors.black,
      ),
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: width - 20.0,
    );
    textPainter.paint(
      canvas,
      Offset(10.0, 50.0),
    );

    // Convert canvas to image
    final ui.Image markerAsImage = await pictureRecorder.endRecording().toImage(
      width.toInt(),
      height.toInt() + (iconSize / 2).toInt(),
    );

    final ByteData? byteData = await markerAsImage.toByteData(
      format: ui.ImageByteFormat.png,
    );

    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //  title: Text(widget.locationName),
      // ),
      appBar: getAppBarBack(context,"${widget.locationName}"),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: FloatingActionButton(
              onPressed: _moveCamera,
              child: GestureDetector(
                  onTap: (){

                    setState(() {
                    //  print('-----${widget.fLatitude}');
                     // print('-----${widget.fLongitude}');
                      lat = double.parse('${widget.fLatitude}');
                      long = double.parse('${widget.fLatitude}');
                     // print('---213--$lat');
                      //print('---214--$long');
                      launchGoogleMaps(lat!, long!);
                    });
                    setState(() {

                    });

                    // fLatitude;
                    // fLongitude;
                    //
                    // if (utilityLocator![index]['fLatitude'] is String) {
                    //   fLatitude = double.parse(utilityLocator![index]['fLatitude']);
                    // } else {
                    //   fLatitude = utilityLocator![index]['fLatitude'];
                    // }
                    //
                    // if (utilityLocator![index]['fLongitude'] is String) {
                    //   fLongitude = double.parse(utilityLocator![index]['fLongitude']);
                    // } else {
                    //   fLongitude = utilityLocator![index]['fLongitude'];
                    // }
                    // print('-----165---fLatitude--$fLatitude');
                    // print('-----166---fLongitude--$fLongitude');
                    // launchGoogleMaps(fLatitude!, fLongitude!);
                    //
                    // if(lat !=null && long !=null){
                    // // getlocator(lat!, long!);
                    // }


                    //if (lat != null && long != null) {
                    //     hideLoader();
                    //    // getlocator(lat!, long!);
                    //   }
                    //   // setState(() {
                    //   // });

                  },
                  // child: Icon(Icons.my_location)
                 child: Container(
                     height: 25,
                     width: 25,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                     ),
                     child: Image.asset('assets/images/direction.jpeg',
                       height: 25,
                       width: 25,
                       fit: BoxFit.fill,
                     )
                 ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}

void navigateToTempleGoogleMap(
    BuildContext context,
    double fLatitude,
    double fLongitude,
    String locationName,
    String sLocationAddress,
    ) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NearbyMap2(
        fLatitude: fLatitude,
        fLongitude: fLongitude,
        locationName: locationName,
        sLocationAddress: sLocationAddress,
      ),
    ),
  );
}

// class NearbyMap2 extends StatefulWidget {
//   final double fLatitude;
//   final double fLongitude;
//   final String locationName;
//   final String sLocationAddress;
//
//   const NearbyMap2({
//     Key? key,
//     required this.fLatitude,
//     required this.fLongitude,
//     required this.locationName,
//     required this.sLocationAddress,
//   }) : super(key: key);
//
//   @override
//   State<NearbyMap2> createState() => _TempleGoogleMapState();
// }
//
// class _TempleGoogleMapState extends State<NearbyMap2> {
//   GoogleMapController? mapController;
//   late LatLng _center;
//   final Set<Marker> _markers = {};
//   LatLng? _currentMapPosition;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeMap();
//   }
//
//   @override
//   void didUpdateWidget(NearbyMap2 oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.fLatitude != widget.fLatitude || oldWidget.fLongitude != widget.fLongitude) {
//       _initializeMap();
//     }
//   }
//
//   void _initializeMap() {
//     _center = LatLng(widget.fLatitude, widget.fLongitude);
//     _currentMapPosition = _center;
//     _clearMarkers();
//     _addMarker();
//     _moveCamera();
//   }
//
//   @override
//   void dispose() {
//     mapController?.dispose();
//     super.dispose();
//   }
//
//   void _clearMarkers() {
//     setState(() {
//       _markers.clear();
//     });
//   }
//
//   void _addMarker() async {
//     if (_currentMapPosition != null) {
//       final Uint8List markerIcon = await _createCustomMarkerBitmap(
//         widget.locationName,
//         widget.sLocationAddress,
//       );
//
//       setState(() {
//         _markers.add(Marker(
//           markerId: MarkerId(_currentMapPosition.toString()),
//           position: _currentMapPosition!,
//           icon: BitmapDescriptor.fromBytes(markerIcon),
//         ));
//       });
//     }
//   }
//
//   void _onCameraMove(CameraPosition position) {
//     _currentMapPosition = position.target;
//   }
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//     _moveCamera();
//   }
//
//   void _moveCamera() {
//     mapController?.animateCamera(CameraUpdate.newLatLng(_center));
//   }
//
//   Future<Uint8List> _createCustomMarkerBitmap(String title, String snippet) async {
//     final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);
//     final Paint paint = Paint()..color = Colors.white;
//     final double width = 300.0;
//     final double height = 120.0;
//
//     canvas.drawRRect(
//       RRect.fromRectAndRadius(
//         Rect.fromLTWH(0.0, 0.0, width, height),
//         Radius.circular(10.0),
//       ),
//       paint,
//     );
//
//     const double iconSize = 100.0;
//     final Paint markerPaint = Paint()..color = Colors.red;
//     final Path markerPath = Path()
//       ..moveTo(width / 2 - iconSize / 2, height - iconSize / 2)
//       ..lineTo(width / 2, height)
//       ..lineTo(width / 2 + iconSize / 2, height - iconSize / 2)
//       ..close();
//     canvas.drawPath(markerPath, markerPaint);
//
//     final TextPainter textPainter = TextPainter(
//       textDirection: TextDirection.ltr,
//     );
//
//     textPainter.text = TextSpan(
//       text: title,
//       style: TextStyle(
//         fontSize: 16.0,
//         color: Colors.black,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//     textPainter.layout(
//       minWidth: 0,
//       maxWidth: width - 20.0,
//     );
//     textPainter.paint(
//       canvas,
//       Offset(10.0, 10.0),
//     );
//
//     textPainter.text = TextSpan(
//       text: snippet,
//       style: TextStyle(
//         fontSize: 14.0,
//         color: Colors.black,
//       ),
//     );
//     textPainter.layout(
//       minWidth: 0,
//       maxWidth: width - 20.0,
//     );
//     textPainter.paint(
//       canvas,
//       Offset(10.0, 30.0),
//     );
//
//     final ui.Image markerAsImage = await pictureRecorder.endRecording().toImage(
//       width.toInt(),
//       height.toInt(),
//     );
//
//     final ByteData? byteData = await markerAsImage.toByteData(
//       format: ui.ImageByteFormat.png,
//     );
//
//     return byteData!.buffer.asUint8List();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(widget.locationName),
//       ),
//       body: Stack(
//         children: <Widget>[
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 15.0,
//             ),
//             markers: _markers,
//             onCameraMove: _onCameraMove,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void navigateToTempleGoogleMap(
//     BuildContext context,
//     double fLatitude,
//     double fLongitude,
//     String locationName,
//     String sLocationAddress,
//     ) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => NearbyMap2(
//         fLatitude: fLatitude,
//         fLongitude: fLongitude,
//         locationName: locationName,
//         sLocationAddress: sLocationAddress,
//       ),
//     ),
//   );
// }