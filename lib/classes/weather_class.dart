class Weather {
  final String? cityName;
  final double? temperature;
  final String? mainCondition;
  final String? weatherDescription;
  final double? minTemperature;
  final double? maxTemperature;
  final int? sunrise;
  final int? sunset;
  final String? country;
  final double? feelsLike;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.weatherDescription,
    required this.minTemperature,
    required this.maxTemperature,
    required this.sunrise,
    required this.sunset,
    required this.country,
    required this.feelsLike,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      weatherDescription: json['weather'][0]['description'],
      minTemperature: json['main']['temp_min'].toDouble(),
      maxTemperature: json['main']['temp_max'].toDouble(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      country: json['sys']['country'],
      feelsLike: json['main']['feels_like'].toDouble(),
    );
  }

  Weather.empty()
      : cityName = null,
        temperature = null,
        mainCondition = null,
        weatherDescription = null,
        minTemperature = null,
        maxTemperature = null,
        sunrise = null,
        sunset = null,
        country = null,
        feelsLike = null;

  factory Weather.clear() => Weather.empty();
}
