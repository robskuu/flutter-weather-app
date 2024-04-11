import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/classes/weather_class.dart';
import 'package:weather_app/api/api_handler.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  DateTime now = DateTime.now();
  final _weatherService = WeatherService(apiKey: "API_KEY_HERE");
  Weather? _weather;

  _getWeather() async {
    String cityName = await _weatherService.getCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  String getCondition(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case "mist":
        return 'assets/mist.json';
      case "clouds":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return 'assets/cloudy.json';
      case "rain":
      case "drizzle":
      case "shower rain":
        return 'assets/rain.json';
      case "thunderstorm":
        return 'assets/thunder.json';
      case "clear":
        return 'assets/sunny.json';
      case "snow":
        return 'assets/snow.json';
      default:
        return 'assets/sunny.json';
    }
  }

  _epochConverter(int? epoch) {
    if (epoch == null) return "N/A";
    var date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
    return DateFormat('HH:mm').format(date);
  }

  @override
  void initState() {
    super.initState();
    _getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            height: 200.0,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF065afb),
                  Color(0xFF62affb),
                  Color(0xFF0e54a0),
                  Color(0xFF7484a4),
                  Color(0xFFbbbabf),
                  Color(0xFF262c39),
                ],
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 50.0),
                  Text(
                    _weather?.cityName != null && _weather?.country != null
                        ? '${_weather?.cityName}, ${_weather?.country}'
                        : 'Loading...',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    DateFormat.yMMMd().format(now),
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Lottie.asset(
                    getCondition(_weather?.mainCondition),
                  ),
                  Text(
                    _weather?.mainCondition ?? "Loading condition..",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        color: const Color.fromARGB(0, 131, 120, 120),
                        elevation: 100.0,
                        surfaceTintColor: Colors.black,
                        margin: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const Icon(Icons.thermostat_outlined,
                                        size: 50.0, color: Colors.red),
                                    Text(
                                      " ${_weather?.maxTemperature?.round().toString() ?? "N/A"}°",
                                      style: const TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 30.0),
                                Text(
                                  " ${_weather?.temperature?.round().toString() ?? "N/A"}°",
                                  style: const TextStyle(
                                    fontSize: 75.0,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 30.0),
                                Column(
                                  children: [
                                    const Icon(Icons.thermostat_outlined,
                                        size: 50.0, color: Colors.blue),
                                    Text(
                                      " ${_weather?.minTemperature?.round().toString() ?? "N/A"}°",
                                      style: const TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Feels like ${_weather?.feelsLike?.round().toString() ?? " "}°C",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 100.0,
                        color: Colors.transparent,
                        surfaceTintColor: Colors.black,
                        margin: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  Icons.sunny,
                                  size: 50.0,
                                  color: Color.fromARGB(255, 228, 149, 31),
                                ),
                                Text(
                                  _epochConverter(_weather?.sunrise) ??
                                      "Loading..",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 30.0),
                            Column(
                              children: [
                                const Icon(
                                  Icons.nightlight_round_rounded,
                                  color: Color.fromARGB(255, 6, 27, 44),
                                  size: 50.0,
                                ),
                                Text(
                                  _epochConverter(_weather?.sunset) ??
                                      "Loading..",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(100.0),
                    child: Card(
                      elevation: 100.0,
                      color: Colors.transparent,
                      surfaceTintColor: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _weather = Weather.clear();
                                  });
                                  _getWeather();
                                },
                                icon: const Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "Refresh",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 50.0),
                          const Column(
                            children: [
                              IconButton(
                                onPressed: SystemNavigator.pop,
                                icon: Icon(Icons.exit_to_app,
                                    color: Colors.white),
                              ),
                              Text(
                                "Exit",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
