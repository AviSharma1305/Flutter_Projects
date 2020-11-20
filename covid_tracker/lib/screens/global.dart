import 'package:covid_tracker/models/global.dart';
import 'package:covid_tracker/screens/globalLoading.dart';
import 'package:covid_tracker/services/covid19-services.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/utils/constants.dart';

CovidService covidService = CovidService();

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  Future<GlobalModel> summary;

  @override
  void initState() {
    super.initState();
    summary = covidService.getGlobal();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Global Statistics",
              style: TextStyle(
                color: kColor,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  summary = covidService.getGlobal();
                });
              },
              child: Icon(
                Icons.refresh,
                color: kColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        FutureBuilder(
          future: summary,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text("Error"),
              );
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return GLobalLoading();
              default:
                return !snapshot.hasData
                    ? Center(
                        child: Text("Empty"),
                      )
                    : GlobalStats(
                        summary: snapshot.data,
                      );
            }
          },
        ),
      ],
    );
  }
}

class GlobalStats extends StatelessWidget {
  final GlobalModel summary;

  const GlobalStats({Key key, this.summary});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              worldCaseCard(
                summary.totalConfirmed,
                summary.newConfirmed,
                "CONFIRMED",
                kConfirmed,
              ),
              worldCaseCard(
                summary.totalConfirmed -
                    summary.totalRecovered -
                    summary.totalDeaths,
                summary.newConfirmed - summary.newRecovered - summary.newDeaths,
                "ACTIVE",
                kActive,
              ),
            ]),
        SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              worldCaseCard(
                summary.totalRecovered,
                summary.newRecovered,
                "RECOVERED",
                kRecovered,
              ),
              worldCaseCard(
                summary.totalDeaths,
                summary.newDeaths,
                "DEATHS",
                kDeath,
              ),
            ]),
      ],
    );
  }
}

Widget worldCaseCard(int num, int updated, String title, Color color) {
  return Container(
    height: 160,
    width: 160,
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
            "↑ $updated",
            style: TextStyle(
              fontSize: 14,
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
