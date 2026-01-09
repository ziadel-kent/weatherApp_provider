import 'package:flutter/material.dart';
import 'package:moreeeeee/data/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  String cityName = '';
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
  MaterialColor getColorIcon(String name) {
    switch (name.toLowerCase()) {
      case 'sunny':
        return Colors.orange;
      case 'thunder':
        return Colors.yellow;
      case 'moderate snow':
        return Colors.lightBlue;
      case 'patchy rain nearby':
        return Colors.blueGrey;
      case 'moderate rain':
        return Colors.blueGrey;
      case 'heavy rain':
        return Colors.grey;
      default:
        return Colors.teal;
      // fallback icon
    }
  }
}
