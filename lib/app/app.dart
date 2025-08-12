import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/app/providers/providers.dart';
import 'package:thoughbox_currency_converter/app/router/route_constants.dart';
import 'package:thoughbox_currency_converter/app/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TheResponsiveBuilder(
      baselineHeight: 812,
      baselineWidth: 376,
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: kBlocProviders,
          child: MaterialApp(
            title: 'Currency Converter',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
