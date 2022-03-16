import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<DaysHoursCubit, DaysHoursState>(
        builder: (context, state) {
          return (state is HoursState)
              ? WeatherByHoursWidget()
              : WeatherByDaysWidget();
        },
      ),
    );
  }
}
