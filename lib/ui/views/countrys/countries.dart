import 'package:clima_meteoroligico/data/models/airlabs_countrys_model.dart';
import 'package:clima_meteoroligico/data/providers/airlabs_provider.dart';
import 'package:clima_meteoroligico/data/repository/airlabs_repository.dart';
import 'package:clima_meteoroligico/ui/widgets/default_loader.dart';
import 'package:clima_meteoroligico/ui/widgets/default_search_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Countries extends StatefulWidget {
  const Countries({super.key});

  @override
  CountriesState createState() => CountriesState();
}

class CountriesState extends State<Countries> {
  bool _loading = false;
  List<AirLabsCountryModel> _countries = [];
  @override
  void initState() {
    _getCountries();
    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  _getCountries() async {
    setState(() => _loading = true);
    AirLabsRepository airLabsRepository = AirLabsRepository();
    final response = await airLabsRepository.getCountries();
    setState(() {
      _countries = response;
      _loading = false;
    });
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AirLabsProvider myAirLabProvider = Provider.of<AirLabsProvider>(context);
    myAirLabProvider.setListCountris(countries: _countries);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: _loading
          ? defaultCircularProgress()
          : Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  DefaultSearchInput(
                    hintText: 'Buscar',
                    icon: FontAwesomeIcons.magnifyingGlass,
                    controller: _searchController,
                  ),
                  Flexible(
                    child: Consumer<AirLabsProvider>(
                      builder: (_, provider, __) {
                        List<AirLabsCountryModel> filteredList =
                            provider.countries;
                        if (_searchController.text.isNotEmpty) {
                          filteredList = provider.countries
                              .where(
                                (country) =>
                                    country.name!.toLowerCase().contains(
                                          _searchController.text.toLowerCase(),
                                        ),
                              )
                              .toList();
                        }

                        return ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                '/cities',
                                arguments: {
                                  'code': filteredList[i].code,
                                },
                              ),
                              child: Container(
                                child: ListTile(
                                  leading: const FaIcon(
                                      FontAwesomeIcons.locationDot),
                                  title: Text(
                                    filteredList[i].name.toString(),
                                  ),
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
    );
  }
}
