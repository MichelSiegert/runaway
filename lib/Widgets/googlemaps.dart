import 'package:away/Logic/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import "package:google_maps_flutter/google_maps_flutter.dart";

Widget googleMap(BuildContext context) {
  late GoogleMapController mapController;
  var pos = const CameraPosition(target: LatLng(0.0, 0.0));
  return SizedBox(
    height: calculateHeight(0.4, context),
    width: calculateWidth(1, context),
    child: GoogleMap(
      initialCameraPosition: pos,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
    ),
  );
}
