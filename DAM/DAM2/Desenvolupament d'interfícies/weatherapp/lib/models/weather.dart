class Weather {
  final double temperature;
  final double windSpeed;
  final String time;

  Weather({
    required this.temperature,
    required this.windSpeed,
    required this.time,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final current = json['current'];

    return Weather(
      temperature: (current['temperature_2m'] as num).toDouble(),
      windSpeed: (current['wind_speed_10m'] as num).toDouble(),
      time: current['time'],
    );
  }
}
