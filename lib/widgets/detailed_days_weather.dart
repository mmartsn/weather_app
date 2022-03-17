import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/styles_icons_sizing.dart';
import 'package:weather_app/blocs/blocs.dart';

Future<void> detailedDaysWeatherAlert(BuildContext context, int index) async {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(7.sR),
      ),
    ),
    titlePadding: EdgeInsets.zero,
    title: Container(
      padding:
          EdgeInsets.only(left: 10.sR, right: 2.sR, top: 10.sR, bottom: 10.sR),
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.65, maxWidth: 60.w),
      child: SingleChildScrollView(
        child: Builder(builder: (context) {
          var daysWeather =
              (context.read<WeatherCubit>().state as WeatherLoaded)
                  .daysWeatherList[index];
          return Container(
              height: 250.sR,
              //width: 100.sR,
              child: Card(
                  child: Center(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    daysWeather.timePoint,
                    style: Styles().cityStyle,
                  ),
                  Text(
                      'Night ${daysWeather.nightTemperature.round().toString()}° / Day ${daysWeather.dayTemperature.round().toString()}°',
                      style: Styles().tempByHourStyle),
                  Text(
                      '${daysWeather.weatherIcon}   Wind - ${daysWeather.windSpeed.toString()}',
                      style: Styles().tempByHourStyle),
                ],
              ))));
        }),
      ),
    ),
    // actionsPadding: EdgeInsets.only(bottom: 7.sR),
    // actions: [
    //   TextButton(
    //     child: Center(child: Text('OK', style: Styles().menuBlueStyle)),
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //   ),
    // ],
  );

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
