import 'package:flutter/cupertino.dart';

import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel _weatherData;
  set WeatherData(WeatherModel weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel get weatherData => _weatherData;
}
