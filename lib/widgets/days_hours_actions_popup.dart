import 'package:flutter/material.dart';

import 'package:weather_app/styles_icons_sizing.dart';

enum WeatherAction { days, hours }

class ArchiveActionPopup extends StatelessWidget {
  const ArchiveActionPopup({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final PopupMenuItemSelected<WeatherAction> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<WeatherAction>(
      elevation: 30,
      color: Colors.blueGrey,
      icon: Icon(Icons.settings,
          size: 20.sR,
          color: Colors.white,
          semanticLabel: "weather forcast format menu"),
      itemBuilder: (BuildContext context) {
        return WeatherAction.values.map((choice) {
          return PopupMenuItem<WeatherAction>(
            value: choice,
            child: choice == WeatherAction.days
                ? Text(etxt.daysWeather, style: Styles().menuWhiteStyle)
                : Text(etxt.hoursWeather, style: Styles().menuWhiteStyle),
          );
        }).toList();
      },
      onSelected: onSelected,
    );
  }
}
