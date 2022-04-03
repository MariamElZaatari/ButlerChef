import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import '../constants/app_colors.dart';
import '../constants/styles.dart';
import '../models/address_model.dart';

class GoogleMapScreen extends StatefulWidget {
  final Function(Address) callback;
  const GoogleMapScreen({Key? key, required this.callback}) : super(key: key);

  @override
  GoogleMapScreenState createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(33.8938, 35.5018),
    zoom: 15,
  );

  late GoogleMapController _googleMapController;

  //Default Beirut Latitude and Longitude
  LatLng currentLocation = const LatLng(33.8938, 35.5018);

  Marker _deliveryDestination = Marker(
    position: const LatLng(33.8938, 35.5018),
    markerId: MarkerId('origin'),
    visible: false,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  );

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  Future<LatLng> getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return LatLng(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.green,
          centerTitle: false,
          title: const Text('Google Maps', style: ThemeText.errorMessage),
          actions: [
            TextButton(
                onPressed: () => _googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: _deliveryDestination.position,
                          zoom: 16,
                          tilt: 0,
                        ),
                      ),
                    ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.white,
                ),
                child: const Icon(
                  Icons.location_on_sharp,
                  color: AppColors.green,
                  size: 35,
                )),
          ],
        ),
        body: GoogleMap(
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) {
            _googleMapController = controller;
            getCurrentLocation().then((location) {
              _googleMapController
                  .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: LatLng(location.latitude, location.longitude),
                zoom: 16,
              )));
              _resetMarker(location);
              setState(() {
                currentLocation = location;
              });
            });
          },
          markers: {_deliveryDestination},
          onLongPress: _resetMarker,
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 29),
            child: Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.darkGreen, width: 4),
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000.0),
                    onTap: () async {
                      //TODO add address geolocation and navigation.pop
                      List<dynamic> placemarks = await placemarkFromCoordinates(
                          _deliveryDestination.position.latitude,
                          _deliveryDestination.position.longitude);

                      widget.callback(Address(
                        street: placemarks.first.street,
                        city: placemarks.first.administrativeArea));
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check_rounded,
                        size: 41.0,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )),
          ),
        ));
  }

  void _resetMarker(LatLng pos) async {
    setState(() {
      _deliveryDestination = Marker(
        markerId: MarkerId('origin'),
        infoWindow: const InfoWindow(title: 'Destination'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        visible: true,
        position: pos,
      );
    });
  }
}
