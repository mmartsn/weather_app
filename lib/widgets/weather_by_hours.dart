import 'package:flutter/material.dart';
import 'package:weather_app/styles_icons_sizing.dart';

class WeatherByHoursWidget extends StatelessWidget {
  const WeatherByHoursWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.sR,
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.white),
                bottom: BorderSide(color: Colors.white))),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ['1', '2', '3', '4', '5', '6'].length,
            itemBuilder: (context, index) {
              return Container(
                  width: 50.sR,
                  child: Card(child: Center(child: Text('$index'))));
            }));

    // Padding(
    //   padding: const EdgeInsets.only(left: 10.0, right: 10),
    //   child:

    // );
  }
}
