import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:cuaca/weather.dart';

class DataService {
  Future<Weather> fetchData(String cityName) async {
    try {
      //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
      final queryParameters = {
        'q': cityName,
        'appId': '05dd77d40eaba9fc2beea2309c920138',
        'units': 'imperial'
      };
      final uri = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('failed to load weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
