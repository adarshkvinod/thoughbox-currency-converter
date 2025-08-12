part of 'network_bloc.dart';

@freezed
class NetworkEvent with _$NetworkEvent {
  const factory NetworkEvent.observe() = _Observe;
  const factory NetworkEvent.notify(bool isConnected) = _Notify;
}
