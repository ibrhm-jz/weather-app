import 'package:clima_meteoroligico/constants/constants.dart';
import 'package:clima_meteoroligico/data/models/weather_model.dart';
import 'package:clima_meteoroligico/data/providers/weather_provider.dart';
import 'package:clima_meteoroligico/data/repository/open_weather_repository.dart';
import 'package:clima_meteoroligico/ui/widgets/default_loader.dart';
import 'package:clima_meteoroligico/ui/widgets/default_type_text.dart';
import 'package:clima_meteoroligico/utils/service_location.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  WeatherState createState() => WeatherState();
}

class WeatherState extends State<Weather> {
  bool _loading = false;
  Position? position;
  WeatherModel? weatherModel;
  late WeatherProvider myWeatherProvider;
  @override
  void initState() {
    _determinePosition();

    super.initState();
  }

  _determinePosition() async {
    setState(() => _loading = true);
    Position? position = await ServiceLocation.instance.position();
    if (position != null) {
      setState(() => {this.position = position});
      await _getWeather();
    } else {
      Navigator.of(context).pushReplacementNamed('/countries');
    }
  }

  _getWeather() async {
    OpenWeatherRepository openWeatherRepository = OpenWeatherRepository();
    final response = await openWeatherRepository.getWeater(
      latitude: position!.latitude.toString(),
      longitude: position!.longitude.toString(),
    );
    setState(() {
      weatherModel = response;
      _loading = false;
    });
    myWeatherProvider.setWeather(weather: weatherModel!);
  }

  @override
  Widget build(BuildContext context) {
    myWeatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather information',
        ),
      ),
      body: _loading
          ? defaultCircularProgress()
          : SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-.50, -0.10),
                    end: Alignment(0.30, 0.20),
                    colors: <Color>[
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 235, 247, 253),
                    ],
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Chip(
                          backgroundColor: Colors.black54,
                          label: HeadLine1(
                            label: myWeatherProvider.weather!.weatherMain,
                            color: Colors.white,
                          )),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.cloudRain,
                            color: Color.fromARGB(255, 187, 186, 186),
                          ),
                          const SizedBox(width: 10),
                          FontSubtitle2(
                              label:
                                  'Humidity\n${myWeatherProvider.weather!.humidity}'),
                          const SizedBox(width: 25),
                          const FaIcon(
                            FontAwesomeIcons.gauge,
                            color: Color.fromARGB(255, 187, 186, 186),
                          ),
                          const SizedBox(width: 10),
                          FontSubtitle2(
                              label:
                                  'Pressure\n${myWeatherProvider.weather!.pressure}'),
                        ],
                      ),
                      Expanded(child: Container()),
                      Center(
                        child: Image.network(
                          '$imgUrl${myWeatherProvider.weather!.weatherIcon}@4x.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Center(
                        child: HeadLine1(
                          label: myWeatherProvider.weather!.weatherDescription
                              .toString(),
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.locationPin,
                            color: Color.fromARGB(255, 187, 186, 186),
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          FontSubtitle1(
                            label:
                                myWeatherProvider.weather!.cityName.toString(),
                          ),
                        ],
                      ),
                      Text(
                        myWeatherProvider.weather!.temp.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                          fontSize: 80,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.temperatureArrowUp,
                            color: Color.fromARGB(255, 187, 186, 186),
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          FontSubtitle2(
                              label:
                                  'Temp max\n${myWeatherProvider.weather!.tempMax}'),
                          const SizedBox(width: 20),
                          const FaIcon(
                            FontAwesomeIcons.temperatureArrowDown,
                            color: Color.fromARGB(255, 187, 186, 186),
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          FontSubtitle2(
                              label:
                                  'Temp min\n${myWeatherProvider.weather!.tempMin}'),
                          const SizedBox(width: 20),
                          const FaIcon(
                            FontAwesomeIcons.wind,
                            color: Color.fromARGB(255, 187, 186, 186),
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          FontSubtitle2(
                              label:
                                  'Speed\n${myWeatherProvider.weather!.speed}'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      FontSubtitle2(
                          label:
                              'Feel Likes: ${myWeatherProvider.weather!.feelsLike}'),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
