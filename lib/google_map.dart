import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
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
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  //late LatLng userLocation;

  late List<LatLng> LatLen = [
    LatLng(27.676435938958118, 85.31298520024238),
    LatLng(27.699987553306677, 85.29008913886423),
    LatLng(27.700899476916465, 85.29129076851122),
    LatLng(27.681899494282664, 85.30880022908163),
  ];
  late GoogleMapController googleMapController;
  Set<Polyline> _polylines = Set<Polyline>();
  String googleapikey = "AIzaSyCwCNBb-1NKBWaAUlEEBFNBjHvhhFF0lYw";

  late PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void initState() {
    addCustomIcon();
    super.initState();
    polylinePoints = PolylinePoints();
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

  @override
  Widget build(BuildContext context) {
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
        polylines: _polylines,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
          setPolylines();
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.1),
        child: FloatingActionButton(
          onPressed: () async {
            Position position = await getUserCurrentLocation();
            googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14)));
            //userLocation=(position.latitude/position.longitude) as LatLng;

            _markers.add(Marker(
                markerId: MarkerId('0'),
                position: LatLng(position.latitude, position.longitude),
                infoWindow: InfoWindow(title: 'Current Location'),
                icon: markerIcon));

            //  userLocation = (position.latitude / position.longitude) as LatLng;
          },
          child: Icon(
            Icons.my_location_outlined,
          ),
        ),
      ),
    );
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyCwCNBb-1NKBWaAUlEEBFNBjHvhhFF0lYw",
        PointLatLng(currentLocation.latitude, currentLocation.longitude),
        PointLatLng(27.676435938958118, 85.31298520024238));

    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

     if(mounted) setState(() {
        _polylines.add(Polyline(
            width: 10,
            polylineId: PolylineId('polyLine'),
            color: Color(0xFF08A5CB),
            points: polylineCoordinates));
      });
    }
  }
}
