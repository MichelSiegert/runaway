
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

//this file is for interacting with the location sensor of the phone.
Future<Position> getLongLat() async {
  Position p = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
  return p;
}

Future<Placemark?> getAddressFromLatLng(Position pos) async {
  try {
    final List<Placemark> placemarks =
    await placemarkFromCoordinates(pos.latitude, pos.longitude);

    final Placemark place = placemarks[0];
    return place;
  } catch (e) {
    print(e);
  }
  return null;
}