import 'package:clima_meteoroligico/data/providers/airlabs_provider.dart';
import 'package:clima_meteoroligico/data/providers/weather_provider.dart';
import 'package:clima_meteoroligico/ui/views/cities/cities.dart';
import 'package:clima_meteoroligico/ui/views/countrys/countries.dart';
import 'package:clima_meteoroligico/ui/views/weather/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es', null);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => AirLabsProvider()),
      ],
      builder: (context, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Adam',
            appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Adam',
                  fontSize: 20),
              elevation: 0,
            ),
          ),
          initialRoute: '/weather',
          routes: {
            '/countries': (BuildContext context) => const Countries(),
            '/weather': (BuildContext context) => const Weather(),
          },
          onGenerateRoute: (RouteSettings settings) {
            final args = settings.arguments;
            switch (settings.name) {
              case '/cities':
                if (args is Map<String, dynamic>) {
                  return PageRouteBuilder(
                    settings: settings,
                    pageBuilder: (_, __, ___) => Cities(arguments: args),
                  );
                }
                return _errorRoute();
              case '/weather-information':
                if (args is Map<String, dynamic>) {
                  return PageRouteBuilder(
                    settings: settings,
                    pageBuilder: (_, __, ___) => Weather(arguments: args),
                  );
                }
                return _errorRoute();
            }
          },
        );
      },
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Incorrect Route'),
          ),
        );
      },
    );
  }
}
