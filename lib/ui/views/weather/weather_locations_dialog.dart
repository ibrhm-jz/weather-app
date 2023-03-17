import 'package:clima_meteoroligico/data/providers/weather_provider.dart';
import 'package:clima_meteoroligico/data/repository/weather_location_repository.dart';
import 'package:clima_meteoroligico/ui/utils/responsive.dart';
import 'package:clima_meteoroligico/ui/widgets/default_type_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WeatherLocationsDialog extends StatelessWidget {
  final VoidCallback onPressed;

  const WeatherLocationsDialog({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherProvider myWeatherProvider = Provider.of<WeatherProvider>(context);
    Responsive responsive = Responsive(context);
    final TextEditingController _controller = TextEditingController();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: SizedBox(
        width: responsive.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: HeadLine1(
                  label: 'Change city',
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(context, '/countries'),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.plus,
                        color: Color.fromARGB(255, 187, 186, 186),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Add city')
                    ],
                  ),
                ),
              ),
              const Divider(),
              SizedBox(
                height: responsive.height / 3,
                child: Consumer<WeatherProvider>(
                  builder: (_, provider, __) {
                    return provider.weatherLocations.isEmpty
                        ? const Center(child: Text('No cities'))
                        : ListView.builder(
                            itemCount: provider.weatherLocations.length,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/weather-information',
                                    arguments: {
                                      'latitude': provider
                                          .weatherLocations[i].lat
                                          .toString(),
                                      'longitude': provider
                                          .weatherLocations[i].long
                                          .toString(),
                                    },
                                    (Route<dynamic> route) => false,
                                  )
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(bottom: 5, top: 5),
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.locationDot,
                                        color:
                                            Color.fromARGB(255, 187, 186, 186),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          provider.weatherLocations[i].name
                                              .toString(),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          WeatherLocationRepository
                                              weatherLocationRepository =
                                              WeatherLocationRepository();
                                          final response =
                                              await weatherLocationRepository
                                                  .deleteLocation(
                                            provider.weatherLocations[i],
                                          );
                                          myWeatherProvider
                                              .deleteWeatherLocations(index: i);
                                        },
                                        icon: const FaIcon(
                                          FontAwesomeIcons.trash,
                                          color: Color.fromARGB(
                                              255, 187, 186, 186),
                                          size: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
