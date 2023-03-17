// ignore_for_file: use_build_context_synchronously

import 'package:clima_meteoroligico/data/providers/weather_provider.dart';
import 'package:clima_meteoroligico/ui/utils/responsive.dart';
import 'package:clima_meteoroligico/ui/widgets/default_type_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherFormatDialog extends StatelessWidget {
  final VoidCallback onPressed;

  const WeatherFormatDialog({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherProvider myWeatherProvider = Provider.of<WeatherProvider>(context);
    Responsive responsive = Responsive(context);
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
                  label: 'Change format',
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  await myWeatherProvider.convertToCelsius();
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 35, bottom: 35),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const Text('Celsius'),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await myWeatherProvider.convertToFarenheit();
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 35, bottom: 35),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const Text('Fahrenheit '),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await myWeatherProvider.convertToKelvin();
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 35, bottom: 35),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const Text('Kelvin'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
