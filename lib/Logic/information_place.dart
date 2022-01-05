class InformationPlace {
  final String place;
  final String lat, lon;
  final String weather;
  final String temp;
  final bool isMetric;

  // this class is for simply storing and passing data.
  const InformationPlace(
      {required this.isMetric,
      required this.place,
      required this.lat,
      required this.lon,
      required this.weather,
      required this.temp});
}
