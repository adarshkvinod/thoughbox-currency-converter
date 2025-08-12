import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_strings.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_typography.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/screen_background.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/home_screen/widgets/amount_textfield.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/home_screen/widgets/currency_converter_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<String> currencyPairListener = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        onTapTrailingIcon: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.dp),
          child: ValueListenableBuilder(
            valueListenable: currencyPairListener,
            builder: (context, value, child) => Column(
              children: [
                Gap(24.dp),
                CurrencyConverterWidget(
                  onPairChanged: (pair) {
                    currencyPairListener.value = pair.toString();
                    log(pair.toString());
                  },
                ),
                Gap(24.dp),
                AmountTextField(currencyPair: value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
