import 'package:away/Logic/Database/settings.dart';
import 'package:weather/weather.dart';

//this class handles the open weather api and parses the information.
Future<Weather> getWeatherByLatLon(double lat, double lon) async {
  final WeatherFactory wf = await (getSettings("lang")) == "de"
      ? WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
          language: Language.GERMAN)
      : WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
          language: Language.ENGLISH);
  final Weather weather = await wf.currentWeatherByLocation(lat, lon);
  return weather;
}



Future<Weather> getWeatherByName(String name) async {
  final WeatherFactory wf = await (getSettings("lang")) == "de"
      ? WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
          language: Language.GERMAN)
      : WeatherFactory("1c1a1b5bc5706b35790855762fe5b8c3",
          language: Language.ENGLISH);
  final Weather weather = await wf.currentWeatherByCityName(name);
  return weather;
}
