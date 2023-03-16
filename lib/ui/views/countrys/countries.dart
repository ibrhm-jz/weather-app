import 'package:clima_meteoroligico/data/repository/airlabs_repository.dart';
import 'package:clima_meteoroligico/ui/widgets/default_search_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Countries extends StatefulWidget {
  const Countries({super.key});

  @override
  CountriesState createState() => CountriesState();
}

class CountriesState extends State<Countries> {
  @override
  void initState() {
    _getCountries();
    super.initState();
  }

  _getCountries() async {
    AirLabsRepository airLabsRepository = AirLabsRepository();
    await airLabsRepository.getCountries();
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            DefaultSearchInput(
              hintText: 'Buscar',
              icon: FontAwesomeIcons.magnifyingGlass,
              controller: _searchController,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, i) {
                    return Container(
                      child: ListTile(
                          leading: FaIcon(FontAwesomeIcons.locationDot),
                          title: Text('Barcelona')),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
