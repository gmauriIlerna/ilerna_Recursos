class Location {
  final String name;
  final double latitude;
  final double longitude;
  final String country;

  Location({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      country: json['country'] ?? '',
    );
  }
}
