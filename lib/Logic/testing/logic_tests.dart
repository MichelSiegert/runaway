import 'package:away/Logic/esoLang/eso_lang.dart';
import 'package:away/Pages/Place/Widget/googlemaps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';

import '../distcalculator.dart';

void main() {
  test("check the distance between one point", () {
    double dist = calculateDistanceBetween2PointsBasedOnLatLon(10, 10, 10, 10);
    expect(dist, equals(0));
  });

  test("check the distance between 2 points", () {
    int dist =
    calculateDistanceBetween2PointsBasedOnLatLon(10, 12, 10, 10).round();
    expect(dist, equals(219));
  });

  test("testing morsecode on a panagramm!", () {
    String long =
        "Sphinx of black quartz, judge my vow.";
    String longer = translateStringToMoseCode(long);
    expect(
        longer,
        equals(
            "... .--. .... .. -. -..- / --- ..-. / -... .-.. .- -.-. -.- / --.- ..- .- .-. - --.. --..-- / .--- ..- -.. --. . / -- -.-- / ...- --- .-- .-.-.-"
        ));
  });

  test("testing binary on a panagramm!", () {
    String long =
        "Sphinx of black quartz, judge my vow.";
    String longer = translateStringtoBinary(long);
    expect(
        longer,
        equals(
            "01010011 01110000 01101000 01101001 01101110 01111000 00100000 01101111 01100110 00100000 01100010 01101100 01100001 01100011 01101011 00100000 01110001 01110101 01100001 01110010 01110100 01111010 00101100 00100000 01101010 01110101 01100100 01100111 01100101 00100000 01101101 01111001 00100000 01110110 01101111 01110111 00101110"
        ));
  });

  test("Evaluating the bounds of a map!", () {
    var res = GoogleMapWidget(lat: 10, lon: 10, myPos: Position(latitude: 10, longitude: 10, speedAccuracy: 2,accuracy: 1,altitude: 1,heading: 1,speed: 1,floor: 1,isMocked: true,timestamp: Timestamp.now().toDate())).calcBounds(420, 42, 3.14, 9000);
    expect(res, allOf([contains(3.14), contains(42)]));
  });


}
