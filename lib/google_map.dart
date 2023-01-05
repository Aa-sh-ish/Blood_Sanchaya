import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation = LatLng(27.7172, 85.3240);

class Google_map extends StatefulWidget {
  @override
  State<Google_map> createState() => _Google_mapState();
}

class _Google_mapState extends State<Google_map> {
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  final Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 0.01),
      "assets/Logo1.png",
    ).then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  final List<Marker> _markers = <Marker>[
    Marker(markerId: MarkerId('1'),
    position: LatLng(27.676435938958118, 85.31298520024238),
      infoWindow: InfoWindow(
        title:'Nepal Red Cross Society Lalitpur Blood Bank'
      )
    ),
    Marker(markerId: MarkerId('2'),
    position: LatLng(27.699987553306677, 85.29008913886423),
      infoWindow: InfoWindow(
        title:'नेपाल रेडक्रस सोसाईटी रक्त बैंक, सोल्टीमोड'
      )
    ),
    Marker(markerId: MarkerId('3'),
    position: LatLng(27.700899476916465, 85.29129076851122),
      infoWindow: InfoWindow(
        title:'central blood bank Rabibhawan'
      )
    ),
    Marker(markerId: MarkerId('4'),
    position: LatLng(27.681899494282664, 85.30880022908163),
      infoWindow: InfoWindow(
        title:'Hamro LifeBank'
      )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 12,

        ),
        markers: Set<Marker>.of(_markers),

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() + " " + value.longitude.toString());
            _markers.add(Marker(
                markerId: MarkerId('0'),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: InfoWindow(title: 'Current Location'),
                icon: markerIcon));

            CameraPosition cameraPosition = CameraPosition(
                zoom: 14, target: LatLng(value.latitude, value.longitude));
            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          });
        },
        child: Icon(Icons.location_on),
      ),

    );
  }
}
