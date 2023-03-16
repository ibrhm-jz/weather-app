import 'package:clima_meteoroligico/data/models/airlabs_cities_model.dart';
import 'package:clima_meteoroligico/data/providers/airlabs_provider.dart';
import 'package:clima_meteoroligico/data/repository/airlabs_repository.dart';
import 'package:clima_meteoroligico/ui/widgets/confirm_dialog.dart';
import 'package:clima_meteoroligico/ui/widgets/default_loader.dart';
import 'package:clima_meteoroligico/ui/widgets/default_search_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Cities extends StatefulWidget {
  final Map<String, dynamic> arguments;
  const Cities({super.key, required this.arguments});

  @override
  CitiesState createState() => CitiesState();
}

class CitiesState extends State<Cities> {
  bool _loading = false;
  List<AirLabsCitiesModel> _cities = [];
  @override
  void initState() {
    _getCities();
    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  _getCities() async {
    setState(() => _loading = true);
    AirLabsRepository airLabsRepository = AirLabsRepository();
    final response = await airLabsRepository.getCities(
      countryCode: widget.arguments['code'],
    );
    setState(() {
      _cities = response;
      _loading = false;
    });
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AirLabsProvider myAirLabProvider = Provider.of<AirLabsProvider>(context);
    myAirLabProvider.setListCities(cities: _cities);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cities'),
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
                        List<AirLabsCitiesModel> filteredList = provider.cities;
                        if (_searchController.text.isNotEmpty) {
                          filteredList = provider.cities
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
                              onTap: () async => await showDialog(
                                context: context,
                                builder: (context) {
                                  return ConfirmedDialog(
                                    onPressed: () async => Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      '/weather-information',
                                      arguments: {
                                        'latitude':
                                            filteredList[i].lat.toString(),
                                        'longitude':
                                            filteredList[i].long.toString(),
                                      },
                                      (Route<dynamic> route) => false,
                                    ),
                                    titleText: 'Want to add to list?',
                                    // subTitleText:
                                    //     'Este cliente se eliminara y no se podra recuperar.',
                                  );
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
