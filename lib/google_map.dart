import 'package:blood_sanchaya/Providers/userProvider.dart';
import 'package:blood_sanchaya/services/location_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

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
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  late GoogleMapController googleMapController;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void initState() {
    addCustomIcon();
    super.initState();
  }

 

  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(27.676435938958118, 85.31298520024238),
        infoWindow:
            InfoWindow(title: 'Nepal Red Cross Society Lalitpur Blood Bank')),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(27.699987553306677, 85.29008913886423),
      infoWindow:
          InfoWindow(title: 'नेपाल रेडक्रस सोसाईटी रक्त बैंक, सोल्टीमोड'),
    ),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(27.700899476916465, 85.29129076851122),
        infoWindow: InfoWindow(title: 'central blood bank Rabibhawan')),
    Marker(
      markerId: MarkerId('4'),
      position: LatLng(27.681899494282664, 85.30880022908163),
      infoWindow: InfoWindow(title: 'Hamro LifeBank'),
    ),
  ];

  void GetUserLocation(BuildContext context, num latitude,num lolongitude, id) {
    LocationServices().getLocation(
      context: context,
      lattitude: latitude.toString(),
      longitude: lolongitude.toString(),
      userId: id.toString()
    );
  }
   void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/Logo1.png",
    ).then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override

  Widget build(BuildContext context) {
      final user = Provider.of<UserProvider>(context).userModel;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 12,
        ),
        myLocationEnabled: false,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.1),
        child: FloatingActionButton(
          onPressed: () async {
            Position position = await getUserCurrentLocation();
            print("Location is ${position.latitude}");
            print("Location is ${position.longitude}");
            googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14)));

            _markers.add(Marker(
                markerId: MarkerId('0'),
                position: LatLng(position.latitude, position.longitude),
                infoWindow: InfoWindow(title: 'Current Location'),
                icon: markerIcon));

            GetUserLocation(context,position.latitude,position.longitude,user.id);
          },
          child: Icon(
            Icons.my_location_outlined,
          ),
        ),
      ),
    );
  }
}
