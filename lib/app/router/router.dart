import 'package:flutter/material.dart';
import 'package:thoughbox_currency_converter/app/router/route_constants.dart';

import '../../src/presentation/screens/splash_screen/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.splashRoute:
        return MaterialPageRoute<SplashScreen>(
          builder: (context) => const SplashScreen(),
        );
    }
    return MaterialPageRoute<Scaffold>(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}
