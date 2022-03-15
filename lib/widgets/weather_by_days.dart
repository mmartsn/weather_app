import 'package:flutter/material.dart';
import 'package:weather_app/styles_icons_sizing.dart';

class WeatherByDaysWidget extends StatelessWidget {
  const WeatherByDaysWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: EdgeInsets.all(28.sR),
              child: Icon(Icons.cloud, size: 80.sR)),
          Text('-10', style: Styles().todaysTemperatureTextStyle),
        ],
      ),
    );
  }
}