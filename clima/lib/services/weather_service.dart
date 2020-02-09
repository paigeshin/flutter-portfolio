import 'dart:convert';

import 'package:clima/model/weather_data.dart';
import 'package:clima/secret/API.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  Future<WeatherData> getWeatherData() async {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      var url =
          '${API.OpenWeatherBaseUrl}?lat=${position.latitude}&lon=${position.longitude}&appid=${API.OpenWeatherApi}';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var openWeatherData = jsonDecode(response.body);
        print(openWeatherData);
        var kelvinTemperature = openWeatherData['main']['temp'];

        double celsiusTemperature = kelvinTemperature - 273.15;
        var cityName = openWeatherData['name'];
        print(cityName);
        //Kelvin To Celsius, -273.15

      }

  }

  String getText(double celsius) {
    if (celsius < -20) {
      return "Super Cold";
    } else if (celsius >= -20 && celsius < -10) {
      return "Very Cold";
    } else if (celsius >= -10 && celsius < 0) {
      return "Cold";
    } else if (celsius >= 0 && celsius < 10) {
      return "Normal";
    } else if (celsius >= 10 && celsius < 20) {
      return "Hot";
    } else if (celsius >= 20 && celsius < 30) {
      return "Very Hot";
    } else if (celsius >= 30) {
      return "Super Hot";
    } else {
      return "UnknownWeather";
    }
  }

  String getIcon(double celsius) {
    if (celsius < -20) {
      return "🥶";
    } else if (celsius >= -20 && celsius < -10) {
      return "🧊";
    } else if (celsius >= -10 && celsius < 0) {
      return "⛄️";
    } else if (celsius >= 0 && celsius < 10) {
      return "😁";
    } else if (celsius >= 10 && celsius < 20) {
      return "♨️";
    } else if (celsius >= 20 && celsius < 30) {
      return "🥵";
    } else if (celsius >= 30) {
      return "🔥";
    } else {
      return "UnknownWeather";
    }
  }
}
