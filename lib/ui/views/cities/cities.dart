import 'package:flutter/material.dart';

class Cities extends StatefulWidget {
  const Cities({super.key});

  @override
  CitiesState createState() => CitiesState();
}

class CitiesState extends State<Cities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cities'),
      ),
      body: Container(),
    );
  }
}
