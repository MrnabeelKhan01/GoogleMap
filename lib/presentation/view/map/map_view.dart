import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VenuOnMapView extends StatefulWidget {
  @override
  State<VenuOnMapView> createState() => VenuOnMapViewState();
}

class VenuOnMapViewState extends State<VenuOnMapView> {
  final Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor? destinationIcon;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  List<Marker> marker = [];
  final List<Marker> _list = [
    const Marker(
      infoWindow: InfoWindow(
          title: "My Shops"
      ),
      markerId: MarkerId("1"),
      position: LatLng(37.42796133580664, -122.085749655962),
    ),
    const Marker(
      infoWindow: InfoWindow(
          title: "D12"
      ),
      markerId: MarkerId("2"),
      position: LatLng(33.7023, 72.9496),
    )
  ];

  @override
  void initState() {
    marker.addAll(_list);
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 24, right: 24),
        child: MaterialButton(
          color: Colors.black,
          textColor: Colors.white,
          onPressed: () async {
            GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
                const CameraPosition(
                  target: LatLng(33.7023, 72.9496),
                zoom:20)));
            setState(() {

            });
          },
          child: const Text("Move"),),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set<Marker>.of(marker),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}