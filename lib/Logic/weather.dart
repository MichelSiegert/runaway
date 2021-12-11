import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;

Future<Weather> getWeatherByLongLat(final double lat, final double lon) async {
  final WeatherFactory wf = WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
      language: Language.GERMAN);
  final Weather weather = await wf.currentWeatherByLocation(lat, lon);
  print(weather.temperature);
  return weather;
}