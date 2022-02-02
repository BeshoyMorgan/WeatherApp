import 'package:flutter/material.dart';

class WeatherModel {
  final String weatherStateName;
  final String date;
  final double temp;
  final double minTimp;
  final double maxTemp;
  WeatherModel({@required this.weatherStateName, @required this.date, @required this.temp, @required this.minTimp, @required this.maxTemp});

  factory WeatherModel.fomJson(Map<String, dynamic> data) {
    return WeatherModel(
      weatherStateName: data['weather_state_name'],
      date: data['applicable_date'],
      maxTemp: data['max_temp'],
      minTimp: data['min_temp'],
      temp: data['the_temp'],
    );
  }
  MaterialColor getColorTheme() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' || weatherStateName == 'Showers') {
      return Colors.blue;
    }
  }
}
