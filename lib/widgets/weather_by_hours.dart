import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/styles_icons_sizing.dart';
import 'package:weather_app/blocs/blocs.dart';

class WeatherByHoursWidget extends StatelessWidget {
  const WeatherByHoursWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        final hoursList = state.hoursWeatherList;
        return Container(
            height: 200.sR,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.white),
                    bottom: BorderSide(color: Colors.white))),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hoursList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 200.sR,
                      width: 80.sR,
                      child: Card(
                          child: Center(
                              child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            hoursList[index].timePoint,
                            style: Styles().timePointStyle,
                          ),
                          Text(
                              '${hoursList[index].currentTemperature.round().toString()}°',
                              style: Styles().tempByHourStyle),
                          Text(hoursList[index].weatherIcon,
                              style: Styles().tempByHourStyle),
                        ],
                      ))));
                }));
      } else {
        return const SizedBox.shrink();
      }
    });

    // Padding(
    //   padding: const EdgeInsets.only(left: 10.0, right: 10),
    //   child:

    // );
  }
}
