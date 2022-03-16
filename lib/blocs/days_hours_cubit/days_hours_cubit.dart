import 'package:bloc/bloc.dart';
//import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'days_hours_state.dart';

class DaysHoursCubit extends Cubit<DaysHoursState> {
  DaysHoursCubit() : super(HoursState());

  void switchToHoursWeather() {
    emit(HoursState());
  }

  void switchToDaysWeather() {
    emit(DaysState());
  }
}
