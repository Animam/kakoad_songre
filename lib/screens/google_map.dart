import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kakoad_songre/screens/adapted_crops.dart';
import 'package:kakoad_songre/colors.dart';
//

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  // void displayMarkers() {
  //   setState(() {
  //     _markers.clear();
  //     _markers.add(Marker(
  //       onTap: () {
  //         bottomSheet(context);
  //       },
  //       markerId: MarkerId('1'),
  //       position: LatLng(12.46593663, -3.104782332),
  //     ));
  //   });
  // }

  late GoogleMapController googleMapController;
  static CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(12.416600, -3.419553), zoom: 10


      );
  // final Set<Marker> _markers = {};
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarker(specify, specifyId) async {
    print(specify);
    //developer.log('Anicet', name: specify['latitude']);
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
        markerId: markerId,
        position:
            LatLng(double.parse(specify['latitude']), double.parse(specify['longitude'])),
            //LatLng(specify['latitude'].latitude, specify['longitude'].longitude),

        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            specify['type_de_sol'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Le niveau de fertilité du sol est ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            specify['niveau_de_fertilité'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 25),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdaptedCropsPage(data: specify)));
                            },
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('Voir cultures',
                                    style:
                                        TextStyle(fontSize: 20, color: GREEN))),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
    setState(() {
      markers[markerId] = marker;
    });
  }

  getDataMarker() async {
    FirebaseFirestore.instance
        .collection('soils-data')
        .get()
        .then((mysoildata) {
      if (mysoildata.docs.isNotEmpty) {
        for (int i = 0; i < mysoildata.docs.length; i++) {
          initMarker(mysoildata.docs[i].data(), mysoildata.docs[i].id);
        }
      }
    });
  }

  void initState() {
    getDataMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker() {
      return <Marker>[
        Marker(
            markerId: MarkerId('Soil info'),
            position: LatLng(12.46593663, -3.104782332))
      ].toSet();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GREEN,
        title: const Text('Sols Disponible'),
        centerTitle: true,
      ),
      body: GoogleMap(
        markers: Set<Marker>.of(markers.values),
        // markers: getMarker(),
        // mapType: MapType.hybrid,
        zoomControlsEnabled: false,
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (GoogleMapController controler) {
          googleMapController = controler;
          // displayMarkers();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position position = await _determinePostion();
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 12)));
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
