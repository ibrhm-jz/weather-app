import 'package:clima_meteoroligico/ui/views/weather/weather.dart';
import 'package:clima_meteoroligico/ui/views/weather/weather_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es', null);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Adam',
      ),
      initialRoute: '/weather',
      routes: {
        '/weather': (BuildContext context) => const Weather(),
      },
    );
  }
}
