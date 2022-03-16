import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/styles_icons_sizing.dart';
import 'package:weather_app/blocs/blocs.dart';
import 'package:weather_app/widgets/detailed_days_weather.dart';

class WeatherByDaysWidget extends StatelessWidget {
  const WeatherByDaysWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      if (state is WeatherLoaded) {
        final daysList = state.daysWeatherList;
        return Container(
            height: 200.sR,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.white),
                    bottom: BorderSide(color: Colors.white))),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: daysList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await detailedDaysWeatherAlert(context, index);
                    },
                    child: SizedBox(
                        height: 200.sR,
                        width: 100.sR,
                        child: Card(
                            child: Center(
                                child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              daysList[index].timePoint,
                              style: Styles().timePointStyle,
                            ),
                            Text(
                                '${daysList[index].nightTemperature.round().toString()}°/${daysList[index].dayTemperature.round().toString()}',
                                style: Styles().tempByHourStyle),
                            Text(daysList[index].weatherIcon,
                                style: Styles().tempByHourStyle),
                          ],
                        )))),
                  );
                }));
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
