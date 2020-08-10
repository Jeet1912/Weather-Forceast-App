import 'dart:convert';
import 'package:http/http.dart';
import 'package:weatherforecastapp/model/podo_model.dart';
import 'package:weatherforecastapp/util/util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl = "http://api.openweathermap.org/data/2.5/forecast?q=" +
        cityName +
        "&appid=" +
        Util.appId +
        "&units=imperial";
    // change to metric (for celcius)
    Response response = await get(Uri.encodeFull(finalUrl));
    print("URL: $finalUrl");

    if (response.statusCode == 200) {
      print(response.body);
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
