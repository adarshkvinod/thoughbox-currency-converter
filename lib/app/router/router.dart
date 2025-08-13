import 'package:flutter/material.dart';
import 'package:thoughbox_currency_converter/app/router/route_constants.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/home_screen/home_screen.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/statistics_screen/statisticts_screen.dart';

import '../../src/presentation/screens/login_screen/login_screen.dart';
import '../../src/presentation/screens/splash_screen/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.splashRoute:
        return MaterialPageRoute<SplashScreen>(
          builder: (context) => const SplashScreen(),
        );
      case RouterConstants.loginRoute:
        return MaterialPageRoute<LoginScreen>(
          builder: (context) => const LoginScreen(),
        );
      case RouterConstants.homeRoute:
        return MaterialPageRoute<HomeScreen>(
          builder: (context) => const HomeScreen(),
        );
      case RouterConstants.statisticsRoute:
        return MaterialPageRoute<StatisticsScreen>(
          builder: (context) => const StatisticsScreen(),
        );
    }
    return MaterialPageRoute<Scaffold>(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}
