import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'demo_event.dart';
part 'demo_state.dart';
part 'demo_bloc.freezed.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(const DemoState.initial()) {
    on<DemoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
