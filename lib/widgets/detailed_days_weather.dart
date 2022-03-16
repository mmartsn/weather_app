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
      padding: EdgeInsets.only(left: 20.sR, right: 20.sR, top: 20.sR),
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.65, maxWidth: 60.w),
      child: SingleChildScrollView(
        child: Builder(builder: (context) {
          var daysWeather =
              (context.read<WeatherCubit>().state as WeatherLoaded)
                  .daysWeatherList[index];
          return Container(
              height: 200.sR,
              width: 100.sR,
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
                      ' ${daysWeather.weatherIcon}   Wind speed - ${daysWeather.windSpeed.toString()}',
                      style: Styles().timePointStyle),
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
