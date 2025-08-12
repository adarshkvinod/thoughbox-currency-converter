import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../src/application/network_bloc/network_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      log(result.toString(), name: 'Network Status');
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(const NetworkEvent.notify(false));
      } else {
        NetworkBloc().add(const NetworkEvent.notify(true));
      }
    });
  }
}
