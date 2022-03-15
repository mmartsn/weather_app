part of 'days_hours_cubit.dart';

abstract class DaysHoursState extends Equatable {
  const DaysHoursState();

  @override
  List<Object> get props => [];
}

class DaysHoursInitial extends DaysHoursState {}

class DaysState extends DaysHoursState {
  @override
  List<Object> get props => [];
}

class HoursState extends DaysHoursState {
  @override
  List<Object> get props => [];
}
