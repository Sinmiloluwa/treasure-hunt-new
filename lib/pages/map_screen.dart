import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.coordinates});

  final LatLng? coordinates;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng myCurrentLocation;

  @override
  void initState() {
    super.initState();
    myCurrentLocation = widget.coordinates ?? LatLng(7.3775, 3.9470);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: myCurrentLocation,
          zoom: 14,
        ),
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
      ),
    );
  }
}
