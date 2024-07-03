
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:puri/app/generalFunction.dart';


class TempleGoogleMap extends StatefulWidget {
  final double fLatitude;
  final double fLongitude;
  final String locationName;
  final String sLocationAddress;

  const TempleGoogleMap({
    Key? key,
    required this.fLatitude,
    required this.fLongitude,
    required this.locationName,
    required this.sLocationAddress,
  }) : super(key: key);

  @override
  State<TempleGoogleMap> createState() => _TemplesHomeState();
}

class _TemplesHomeState extends State<TempleGoogleMap> {
  GoogleMapController? mapController;
  late LatLng _center;
  final Set<Marker> _markers = {};
  LatLng? _currentMapPosition;

  void _onAddMarkerButtonPressed() {
    if (_currentMapPosition != null) {
      setState(() {
        _markers.add(Marker(
          markerId: MarkerId(_currentMapPosition.toString()),
          position: _currentMapPosition!,
          infoWindow: InfoWindow(
              title: widget.locationName,
              snippet: widget.sLocationAddress
          ),
          icon: BitmapDescriptor.defaultMarker,
        ));
      });
    } else {
    }
  }
  void _onCameraMove(CameraPosition position) {
    _currentMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    print('--35--lati--${widget.fLatitude}');
    print('--36--longi--${widget.fLongitude}');
    _center = LatLng(widget.fLatitude, widget.fLongitude);
    _currentMapPosition = _center;
    _onAddMarkerButtonPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: getAppBarBack(context,'${widget.locationName}'),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 10.0,
            ),
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
        ],
      ),
    );
  }
}
