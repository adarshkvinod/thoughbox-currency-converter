import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TheResponsiveBuilder(
      baselineHeight: 812,
      baselineWidth: 376,
      builder: (context, orientation, screenType) {
        return MaterialApp(
        title: 'Currency Converter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
      },
    );
  }
}
