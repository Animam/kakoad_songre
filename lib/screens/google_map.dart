import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kakoad_songre/screens/soil_page_info.dart';
import 'package:kakoad_songre/colors.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController googleMapController;
  static CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(12.416600, -3.419553), zoom: 11);
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GREEN,
        title: const Text('Google Map'),
        centerTitle: true,
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (GoogleMapController controler) {
          googleMapController = controler;
        },
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position position = await _determinePostion();
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          _markers.clear();
          _markers.add(Marker(
            onTap: () {
              bottomSheet(context);
            },
            markerId: const MarkerId(''),
            position: LatLng(position.latitude, position.longitude),
          ));
          setState(() {});
        },
        backgroundColor: GREEN,
        child: const Icon(Icons.place_outlined),
      ),
    );
  }

  Future<Position> _determinePostion() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("Services de location desactivé");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      return Future.error("Permission de location refusé");
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Permission de location refusé permenement");
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
