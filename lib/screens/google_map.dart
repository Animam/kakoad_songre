import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kakoad_songre/screens/soil_page_info.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Set<Marker> _markers = {};
  void _onMapCreator(GoogleMapController controller){
    setState(() {
      _markers.add(
        const Marker(
        markerId: MarkerId('id-01'),
        position: LatLng(11.905720, -1.293255),)
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GREEN,
          title: const Text('Google Map'),
          centerTitle: true,
        ),
        body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(11.905720, -1.293255), zoom: 11),
          onMapCreated: _onMapCreator,
          markers: _markers,
        ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
         bottomSheet(context);
      },
      backgroundColor: GREEN,
      child:const Icon(Icons.place_outlined),
    ),);
  }


}
