import 'package:blood_sanchaya/Providers/userProvider.dart';
import 'package:blood_sanchaya/services/donateDate_Services.dart';
import 'package:blood_sanchaya/services/location_services.dart';
import 'package:blood_sanchaya/utils/utils.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

const LatLng currentLocation = LatLng(27.7172, 85.3240);

class Google_map extends StatefulWidget {
  Google_map({required this.userId});
  String userId;
  @override
  State<Google_map> createState() => _Google_mapState();
}

class _Google_mapState extends State<Google_map> {
  final List<String> bloods = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-"
  ];
  String? selectedBlood;
  DateTime today = DateTime.now();
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
    });
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  final LocationServices _locationServices = LocationServices();
  List<Map<String, dynamic>> _locationList = [];
  Set<Marker> _markers = {};
  Map<String, dynamic> data = {};
  int oneId = 0;

  late GoogleMapController googleMapController;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    addCustomIcon();
    DonateDateServices()
        .getDonateDate(context: context, userId: widget.userId)
        .then((result) {
      setState(() {
        if (result == null) {
          DonateDateServices().postDonateDate(
              context: context,
              donateDate: "2022-02-02",
              userId: widget.userId,
              nextDonateDate: "2022-02-02");
        } else {
          data = result;
        }
      });
    });
    LocationServices().getOneId(context, widget.userId).then((result) {
      oneId = result;
    });
  }

  Future<void> fetchData(String bloodGrouo, num lattitude, num longitude,
      String updatedate) async {
    try {
      final List<Map<String, dynamic>> locationList =
          await _locationServices.getLocation(
        context: context,
        bloodGrouo: bloodGrouo,
        lattitude: lattitude,
        longitude: longitude,
        updatedate: updatedate,
      );
      setState(() {
        _locationList = locationList;
        print(_locationList);
        _addMarkers();
      });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void _addMarkers() {
    _locationList.forEach((location) {
      final marker = Marker(
        markerId: MarkerId(location['userId']),
        position: LatLng((location['lattitude']), (location['longitude'])),
        infoWindow: InfoWindow(
          title: "${location['userName']}",
          snippet: "${location['phone']}",
        ),
      );
      _markers.add(marker);
    });
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

  void postUserLocation(
    context,
    id,
    String userName,
    String phone,
    String bloodGrouo,
    num lattitude,
    num longitude,
  ) {
    LocationServices().postLocation(
      context: context,
      userId: id,
      userName: userName,
      phone: phone,
      bloodGrouo: bloodGrouo,
      lattitude: lattitude,
      longitude: longitude,
      updatedate: "${data["donateDate"]}",
    );
  }

  void updateUserLocation(
    context,
    id,
    String userName,
    String phone,
    String bloodGrouo,
    num lattitude,
    num longitude,
  ) {
    LocationServices().updateLocation(
      context: context,
      userId: id,
      userName: userName,
      phone: phone,
      bloodGrouo: bloodGrouo,
      lattitude: lattitude,
      longitude: longitude,
      updatedate: "${data["donateDate"]}",
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
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: size.height * 0.2),
        child: Column(
          children: [
            CustomDropdownButton2(
              hint: "Blood",
              buttonDecoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  width: 2,
                  color: Color(0xfff70010),
                ),
              ),
              value: selectedBlood,
              dropdownItems: bloods,
              buttonHeight: size.height * 0.04,
              buttonWidth: size.height * 0.1,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Color(0xfff70010),
                ),
              ),
              onChanged: ((value) {
                setState(() {
                  selectedBlood = value;
                });
              }),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            FloatingActionButton(
              onPressed: () async {
                Position position = await getUserCurrentLocation();
                googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(position.latitude, position.longitude),
                        zoom: 12),
                  ),
                );

                _markers.add(Marker(
                    markerId: MarkerId('0'),
                    position: LatLng(position.latitude, position.longitude),
                    infoWindow: InfoWindow(title: user.name),
                    icon: markerIcon));

                if (oneId != 1234) {
                  updateUserLocation(
                      context,
                      user.id,
                      user.name,
                      user.phoneNumber,
                      user.bloodGroup,
                      position.latitude,
                      position.longitude);
                } else {
                  postUserLocation(
                      context,
                      user.id,
                      user.name,
                      user.phoneNumber,
                      user.bloodGroup,
                      position.latitude,
                      position.longitude);
                }
                print(today.toString());
                fetchData(
                    selectedBlood.toString() == null
                        ? user.bloodGroup
                        : selectedBlood.toString(),
                    position.latitude,
                    position.longitude,
                    today.toString());

                setState(() {});
              },
              child: Icon(
                Icons.my_location_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
