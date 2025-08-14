import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/app/providers/providers.dart';
import 'package:thoughbox_currency_converter/app/router/route_constants.dart';
import 'package:thoughbox_currency_converter/app/router/router.dart';

import '../src/presentation/core/constants/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return TheResponsiveBuilder(
      baselineHeight: 812,
      baselineWidth: 376,
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: kBlocProviders,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Currency Converter',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            ),
            initialRoute: RouterConstants.splashRoute,
            onGenerateRoute: AppRouter.generateRoute,
            builder: (context, child) {
              return child ?? const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
