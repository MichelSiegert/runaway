
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> getLongLat() async => await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.best,
    forceAndroidLocationManager: true);

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