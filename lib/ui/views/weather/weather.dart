import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  WeatherState createState() => WeatherState();
}

class WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, 0.0),
              end: Alignment(0.25, 0.75),
              colors: <Color>[
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 234, 248, 255),
              ],
            ),
          ),
          // decoration: const BoxDecoration(
          //   gradient: RadialGradient(
          //     colors: <Color>[
          //       Color.fromARGB(255, 234, 248, 255),
          //       Color.fromARGB(255, 255, 255, 255),
          //     ],
          //   ),
          // ),
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Clouds',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const Chip(
                  label: Text(
                    'Broken clouds',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.cloudRain,
                      color: Color.fromARGB(255, 187, 186, 186),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Humidity\n60%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 25),
                    FaIcon(
                      FontAwesomeIcons.gauge,
                      color: Color.fromARGB(255, 187, 186, 186),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Pressure\n1016',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Expanded(child: Container()),
                Center(child: Image.asset('assets/04.png')),
                Expanded(child: Container()),
                Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.locationPin,
                      color: Color.fromARGB(255, 187, 186, 186),
                      size: 16,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Moscuw,Russia',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Text(
                  '39 °',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                    fontSize: 80,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.temperatureArrowUp,
                      color: Color.fromARGB(255, 187, 186, 186),
                      size: 16,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Temp max\n60%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 20),
                    FaIcon(
                      FontAwesomeIcons.temperatureArrowDown,
                      color: Color.fromARGB(255, 187, 186, 186),
                      size: 16,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Tem min\n1016',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 20),
                    FaIcon(
                      FontAwesomeIcons.wind,
                      color: Color.fromARGB(255, 187, 186, 186),
                      size: 16,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Speed\n2.24',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(height: 20),
                const Text(
                  'Feel Likes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
