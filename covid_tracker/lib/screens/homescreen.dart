import 'package:covid_tracker/utils/constants.dart';
import 'package:covid_tracker/utils/myheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              text: "Get to know\nAbout COVID-19.",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Symptoms",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  ScrollSymptoms(),
                  SizedBox(height: 10),
                  Text(
                    "Prevention",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  PreventCard(
                    image: "assets/images/wear_mask.png",
                    title: "Wear face mask",
                    text: "Masks can prevent the user from transmitting"
                        " the COVID-19 virus to others.",
                  ),
                  PreventCard(
                    image: "assets/images/wash_hands.png",
                    title: "Wash your hands",
                    text: "Wash your hands often with soap and water for at "
                        "least 20 seconds.",
                  ),
                  PreventCard(
                    image: "assets/images/sneezes.jpg",
                    title: "Cover your sneezes",
                    text: "Always cover your mouth and nose with a tissue"
                        "when you cough.",
                  ),
                  PreventCard(
                    image: "assets/images/clean.jpg",
                    title: "Clean and disinfect",
                    text: "Clean AND disinfect frequently touched surfaces daily.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollSymptoms extends StatelessWidget {
  const ScrollSymptoms({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          symptomCard(
            "assets/images/fever.png",
            "Fever",
          ),
          SizedBox(width: 15),
          symptomCard(
            "assets/images/headache.png",
            "Headache",
          ),
          SizedBox(width: 15),
          symptomCard(
            "assets/images/caugh.png",
            "Cough",
          ),
          SizedBox(width: 15),
          symptomCard(
            "assets/images/breathing difficulty.png",
            "Difficulty Breathing",
          ),
          SizedBox(width: 15),
          symptomCard(
            "assets/images/sorethroat.png",
            "Sore Throat",
          ),
          SizedBox(width: 15),
          symptomCard(
            "assets/images/vomit.png",
            "Vomit",
          ),
          SizedBox(width: 15),
          symptomCard(
            "assets/images/bodyaches.png",
            "Muscle or Body\n          Aches",
          ),
        ],
      ),
    );
  }
}

Widget symptomCard(String image, String text) {
  return Container(
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
    child: Column(
      children: <Widget>[
        Image.asset(
          image,
          height: 90,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 14,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 140,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kTitleTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
