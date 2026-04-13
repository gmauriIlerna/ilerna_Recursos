import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/location.dart';
import '../models/weather.dart';

class WeatherService {
  Future<Location> searchCity(String city) async {
    final url = Uri.parse(
      'https://geocoding-api.open-meteo.com/v1/search'
      '?name=$city&count=1&language=en&format=json',
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to search city');
    }

    final data = jsonDecode(response.body);

    if (data['results'] == null || data['results'].isEmpty) {
      throw Exception('City not found');
    }

    return Location.fromJson(data['results'][0]);
  }

  Future<Weather> getWeather(double latitude, double longitude) async {
    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast'
      '?latitude=$latitude'
      '&longitude=$longitude'
      '&current=temperature_2m,wind_speed_10m'
      '&timezone=auto',
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load weather');
    }

    final data = jsonDecode(response.body);
    return Weather.fromJson(data);
  }
}
