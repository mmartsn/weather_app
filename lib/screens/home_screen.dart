import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/styles_icons_sizing.dart';
import 'package:weather_app/widgets/widgets.dart';
import 'package:weather_app/blocs/blocs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: <Widget>[
          const VerticalDivider(width: 3),
          ArchiveActionPopup(onSelected: (choice) async {
            if (choice == WeatherAction.days) {
              context.read<DaysHoursCubit>().switchToDaysWeather();
            } else if (choice == WeatherAction.hours) {
              context.read<DaysHoursCubit>().switchToHoursWeather();
            }
          }),
          const VerticalDivider(width: 4),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/background_image.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherLoaded) {
                        return Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              state.currentWeather.cityName,
                              textAlign: TextAlign.center,
                              style: Styles().cityStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${state.currentWeather.currentTemperature.round()}°',
                                  style: Styles().todaysTemperatureTextStyle,
                                ),
                                Text(
                                  state.currentWeather.weatherIcon,
                                  style: Styles().weatherMessageStyle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              state.currentWeather.weatherMessage,
                              textAlign: TextAlign.center,
                              style: Styles().weatherMessageStyle,
                            ),
                          )
                        ]);
                      } else if (state is WeatherError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(
                          child: SpinKitDoubleBounce(
                            color: Colors.white,
                            size: 100.0,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<DaysHoursCubit, DaysHoursState>(
                  builder: (context, state) {
                    return (state is HoursState)
                        ? const WeatherByHoursWidget()
                        : const WeatherByDaysWidget();
                  },
                ),
              ),
              Divider(height: 5.0.sR)
            ],
          ),
        ),
      ),
    );
  }
}
