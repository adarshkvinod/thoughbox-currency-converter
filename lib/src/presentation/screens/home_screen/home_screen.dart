import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_images.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_strings.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_typography.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/primary_button.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/screen_background.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/home_screen/widgets/amount_textfield.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/home_screen/widgets/conversion_result_widget.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/home_screen/widgets/currency_converter_widget.dart';

import '../../../../app/constants/status/status.dart';
import '../../../application/currency_bloc/currency_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<String> currencyPairListener = ValueNotifier('');

  @override
  void initState() {
    super.initState();
  }

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
                BlocBuilder<CurrencyBloc, CurrencyState>(
                  builder: (context, state) {
                    return CurrencyConverterWidget(
                      onPairChanged: (pair) {
                        currencyPairListener.value = pair.toString();
                        log(pair.toString());
                      },
                    );
                  },
                ),
                Gap(24.dp),
                AmountTextField(currencyPair: value),
                Gap(16.dp),
                ConversionResultWidget(),
                Spacer(),
                PrimaryButton(
                  icon: Image.asset(
                    AppImages.convertIcon,
                    height: 24.dp,
                    color: Colors.white,
                  ),
                  title: 'Convert',
                ),
                Gap(24.dp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
