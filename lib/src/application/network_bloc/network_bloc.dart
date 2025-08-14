
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../app/services/network_helper.dart';

part 'network_state.dart';
part 'network_event.dart';
part 'network_bloc.freezed.dart';

@injectable
class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(const NetworkState.initial()) {
    on<_Observe>(_observeNetworkEvent);
    on<_Notify>(_notifyNetworkEvent);
  }

  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  _observeNetworkEvent(_Observe event, Emitter<NetworkState> emit) {
   
    NetworkHelper.observeNetwork();
  }

  _notifyNetworkEvent(_Notify event, Emitter<NetworkState> emit) {
     emit(const NetworkState.loading());
    event.isConnected ? emit(const NetworkState.success()) : emit(const NetworkState.failure());
  }
}
