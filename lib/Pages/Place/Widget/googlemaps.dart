import 'package:away/Logic/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import "package:google_maps_flutter/google_maps_flutter.dart";

class GoogleMapWidget extends StatelessWidget {
  final double lat, lon;
  final Position myPos;

  const GoogleMapWidget(
      {Key? key, required this.lat, required this.lon, required this.myPos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;
    var camPos = CameraPosition(
        target: LatLng(myPos.latitude, myPos.longitude), zoom: 16);
    var markers = getPoints(lat, lon, myPos);
    List<double> bounds = calcBounds(myPos.latitude, myPos.longitude, lat, lon);

    return FutureBuilder(
        future: createPolyLine(myPos.latitude, myPos.longitude, lat, lon),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: calculateHeight(0.4, context),
              width: calculateWidth(1, context),
              child: GoogleMap(
                initialCameraPosition: camPos,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                  mapController.animateCamera(CameraUpdate.newLatLngBounds(
                    LatLngBounds(
                      northeast: LatLng(bounds[2], bounds[3]),
                      southwest: LatLng(bounds[0], bounds[1]),
                    ),
                    100.0,
                  ));
                },
                markers: markers,
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Text("forgot to catch this case!");
          }
        });
  }

  List<double> calcBounds(double lat1, double lon1, double lat2, double lon2) {
    List<double> bounds = [];

    //south
    bounds.add((lat1 <= lat2) ? lat1 : lat2);
    //west
    bounds.add(lon1 <= lon2 ? lon1 : lon2);
    //north
    bounds.add(lat1 <= lat2 ? lat2 : lat1);
    //east
    bounds.add(lon1 <= lon2 ? lon2 : lon1);

    return bounds;
  }

  Set<Marker> getPoints(double lat, double lon, Position start) {
    Marker destMar = Marker(
        position: LatLng(lat, lon),
        markerId: const MarkerId("nice"),
        icon: BitmapDescriptor.defaultMarker);
    Marker startMar = Marker(
        position: LatLng(start.latitude, start.longitude),
        markerId: const MarkerId("you are here"),
        icon: BitmapDescriptor.defaultMarker);
    return {startMar, destMar};
  }

//<Map<PolylineId, Polyline>>
  Future createPolyLine(
      double lat1, double lon1, double lat2, double lon2) async {
    return {};
    /** ATTENTION!
     *  this code works, however the routing costs money,
     *  but we wanted to show that we were able to do this.
     *  so we decided to comment it out.
     *
     * List<LatLng> polylineCoordinates = [];
        Map<PolylineId, Polyline> polylines = {};

        PolylinePoints polylinePoints = PolylinePoints();

        PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyBBB88fLENGI4HlLM3jrYUN9tQtv5bWylc",
        PointLatLng(lat1, lon1),
        PointLatLng(lat2, lon2),
        travelMode: TravelMode.walking);

        print("!"+result.errorMessage!+"!");
        if (result.points.isNotEmpty) {
        for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }
        }
        PolylineId id = const PolylineId('poly');

        Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.green,
        points: polylineCoordinates,
        width: 3,
        );

        polylines[id] = polyline;
        return polylines; */
  }
}
