import 'package:covid_tracker/models/country.dart';
import 'package:covid_tracker/models/country_summary.dart';
import 'package:covid_tracker/screens/countryloading.dart';
import 'package:covid_tracker/services/covid19-services.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

CovidService covidService = CovidService();

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  final TextEditingController _typeAheadController = TextEditingController();
  Future<List<CountryModel>> countryList;
  Future<List<CountrySummaryModel>> summaryList;

  @override
  initState() {
    super.initState();
    countryList = covidService.getCountryList();
    summaryList = covidService.getCountrySummary("india");

    this._typeAheadController.text = "India";
  }

  List<String> _getSuggestions(List<CountryModel> list, String query) {
    List<String> matches = List();

    for (var item in list) {
      matches.add(item.country);
    }

    matches.retainWhere(
        (element) => element.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: countryList,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text("Error"),
            );
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CountryLoading(),
              );
            default:
              return !snapshot.hasData
                  ? Center(child: Text("Empty"))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Search by Country",
                              style: TextStyle(
                                color: kColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _typeAheadController,
                            decoration: InputDecoration(
                              hintText: "Search by country",
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: EdgeInsets.all(10),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 24, right: 16),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                          suggestionsCallback: (pattern) {
                            return _getSuggestions(snapshot.data, pattern);
                          },
                          itemBuilder: (context, suggestion) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: ListTile(
                                title: Text(suggestion),
                              ),
                            );
                          },
                          transitionBuilder:
                              (context, suggestionBox, controller) {
                            return suggestionBox;
                          },
                          onSuggestionSelected: (suggestion) {
                            this._typeAheadController.text = suggestion;
                            setState(() {
                              summaryList = covidService.getCountrySummary(
                                  snapshot.data
                                      .firstWhere((element) =>
                                          element.country == suggestion)
                                      .slug);
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FutureBuilder(
                            future: summaryList,
                            builder: (context, snapshot) {
                              if (snapshot.hasError)
                                return Center(
                                  child: Text("Error"),
                                );
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Center(
                                    child: Text("Loading"),
                                  );
                                default:
                                  return !snapshot.hasData
                                      ? Center(
                                          child: Text("Empty"),
                                        )
                                      : CountryStatistics(
                                          summaryList: snapshot.data);
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
          }
        });
  }
}

class CountryStatistics extends StatelessWidget {
  final List<CountrySummaryModel> summaryList;

  CountryStatistics({@required this.summaryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            countryCaseCard(
              summaryList[summaryList.length - 1].confirmed,
              "CONFIRMED",
              kConfirmed,
            ),
            countryCaseCard(
              summaryList[summaryList.length - 1].active,
              "ACTIVE",
              kActive,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            countryCaseCard(
              summaryList[summaryList.length - 1].recovered,
              "RECOVERED",
              kRecovered,
            ),
            countryCaseCard(
              summaryList[summaryList.length - 1].death,
              "DEATH",
              kDeath,
            ),
          ],
        ),
      ],
    );
  }

  Widget countryCaseCard(int num, String title, Color color) {
    return Container(
      height: 145,
      width: 150,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 15,
              color: kActiveShadowColor,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              "$num",
              style: TextStyle(
                fontSize: 26,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
