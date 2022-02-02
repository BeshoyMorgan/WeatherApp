import 'dart:convert';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

String city_name;
final String _baseUrl = 'https://www.metaweather.com';
Future<int> _getWeatherId(String cityName) async {
  try {
    Uri url = Uri.parse('$_baseUrl/api/location/search/?query=$cityName');

    http.Response response = await http.get(url, headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      //"Access-Control-Allow-Methods ": "GET, OPTIONS",
      "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET, OPTIONS"
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      int cityId = data['woeid'];
      city_name = data['location_type'];
      return cityId;
    } else {
      print('error');
      return 0;
    }
  } catch (e) {
    print(e);
  }
}

Future<WeatherModel> getWeather(String cityName) async {
  try {
    int cityId = await _getWeatherId(cityName);

    Uri url = Uri.parse('https://www.metaweather.com/api/location/$cityId/');
    http.Response response = await http.get(url, headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      // "Access-Control-Allow-Methods ": "GET, OPTIONS",
      "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET, OPTIONS"
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      Map<String, dynamic> data = jsonData['consolidated_weather'][0];
      WeatherModel weatherModel = WeatherModel.fomJson(data);
      return weatherModel;
    } else {
      print('error');
    }
  } catch (e) {
    print(e);
  }
}
