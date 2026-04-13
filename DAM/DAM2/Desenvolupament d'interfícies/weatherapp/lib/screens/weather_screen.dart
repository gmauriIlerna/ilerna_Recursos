import 'package:flutter/material.dart';
import '../models/location.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  final WeatherService _weatherService = WeatherService();

  Weather? _weather;
  Location? _location;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _searchWeather() async {
    final city = _cityController.text.trim();

    if (city.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a city name.';
        _weather = null;
        _location = null;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _weather = null;
      _location = null;
    });

    try {
      final location = await _weatherService.searchCity(city);
      final weather = await _weatherService.getWeather(
        location.latitude,
        location.longitude,
      );

      setState(() {
        _location = location;
        _weather = weather;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _searchWeather(),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _searchWeather,
                child: const Text('Search'),
              ),
            ),
            const SizedBox(height: 24),
            if (_isLoading) const CircularProgressIndicator(),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            if (_weather != null && _location != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        '${_location!.name}, ${_location!.country}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 12),
                      Text('Temperature: ${_weather!.temperature} °C'),
                      Text('Wind speed: ${_weather!.windSpeed} km/h'),
                      Text('Time: ${_weather!.time}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
