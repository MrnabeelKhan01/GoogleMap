import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLineView extends StatefulWidget {
  const PolyLineView({super.key});

  @override
  State<PolyLineView> createState() => _PolyLineViewState();
}

class _PolyLineViewState extends State<PolyLineView> {
  final Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor? destinationIcon;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  List<LatLng> latlng = [
    LatLng(33.7023, 72.9496),
    LatLng(37.42796133580664, -122.085749655962),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < latlng.length; i++) {
      _markers.add(
         Marker(
          infoWindow: InfoWindow(title: "My Shops"),
          markerId: MarkerId("1"),
          position:latlng[i],
          icon:BitmapDescriptor.defaultMarker
        ),
      );
      _polyline.add( Polyline(polylineId: PolylineId("1"), color: Colors.lightBlue,points: latlng));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        polylines: _polyline,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
      ),
    );
  }
}
