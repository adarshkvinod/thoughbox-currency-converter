part of 'demo_bloc.dart';

@freezed
class DemoEvent with _$DemoEvent {
  const factory DemoEvent.started() = _Started;
}
