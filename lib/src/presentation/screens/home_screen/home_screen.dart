import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/app/constants/status/status.dart';
import 'package:thoughbox_currency_converter/app/router/route_constants.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_images.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/primary_button.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/screen_background.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/home_screen/widgets/amount_textfield.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/home_screen/widgets/conversion_result_widget.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/home_screen/widgets/currency_converter_widget.dart';

import '../../../../app/router/custom_route_animation.dart';
import '../../../application/currency_bloc/currency_bloc.dart';
import '../statistics_screen/statisticts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  ValueNotifier<String> currencyFromListener = ValueNotifier('');
  ValueNotifier<String> currencyToListener = ValueNotifier('');
  ValueNotifier<double> amountListener = ValueNotifier(0);

  late AnimationController _mainController;
  late AnimationController _staggerController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  late Animation<double> _converterFadeAnimation;
  late Animation<Offset> _converterSlideAnimation;
  late Animation<double> _textFieldFadeAnimation;
  late Animation<Offset> _textFieldSlideAnimation;
  late Animation<double> _resultFadeAnimation;
  late Animation<Offset> _resultSlideAnimation;
  late Animation<double> _buttonFadeAnimation;
  late Animation<double> _buttonScaleAnimation;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startLoadingSequence();
  }

  void _setupAnimations() {
    _mainController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _staggerController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutBack),
      ),
    );

    _converterFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    _converterSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _staggerController,
            curve: const Interval(0.0, 0.4, curve: Curves.easeOutCubic),
          ),
        );

    _textFieldFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );

    _textFieldSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _staggerController,
            curve: const Interval(0.2, 0.6, curve: Curves.easeOutCubic),
          ),
        );

    _resultFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    _resultSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _staggerController,
            curve: const Interval(0.4, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    _buttonFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.6, 0.9, curve: Curves.easeOut),
      ),
    );

    _buttonScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.6, 1.0, curve: Curves.elasticOut),
      ),
    );
  }

  void _startLoadingSequence() async {
    await Future.delayed(const Duration(milliseconds: 800));

    setState(() {
      _isLoading = false;
    });

    _mainController.forward();

    await Future.delayed(const Duration(milliseconds: 400));
    _staggerController.forward();
  }

  @override
  void dispose() {
    _mainController.dispose();
    _staggerController.dispose();
    super.dispose();
  }

  String? validateAmount(String? value, {double max = 100000}) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an amount';
    }

    final num? amount = num.tryParse(value);
    if (amount == null) {
      return 'Enter a valid number';
    }

    if (amount <= 0) {
      return 'Amount must be positive';
    }

    if (amount >= max) {
      return 'Amount must be less than $max';
    }

    return null; // Valid input
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: ScreenBackground(child: Center(child: _buildLoadingIndicator())),
      );
    }

    return Scaffold(
      body: ScreenBackground(
        onTapTrailingIcon: () {
          Navigator.push(
            context,
            FluidStackRoute(
              child: const StatisticsScreen(),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCubic,
            ),
          );
        },
        child: BlocBuilder<CurrencyBloc, CurrencyState>(
          builder: (context, state) {
            log(state.conversionResult.toString(),name: "CONVERSION RESULT");
            return AnimatedBuilder(
              animation: _mainController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.dp),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 86.h),
                            child: IntrinsicHeight(
                              child: ValueListenableBuilder(
                                valueListenable: currencyToListener,
                                builder: (context, to, child) => ValueListenableBuilder(
                                  valueListenable: currencyFromListener,
                                  builder: (context, from, child) => Column(
                                    children: [
                                      Gap(24.dp),
                                      AnimatedBuilder(
                                        animation: _staggerController,
                                        builder: (context, child) {
                                          return FadeTransition(
                                            opacity: _converterFadeAnimation,
                                            child: SlideTransition(
                                              position:
                                                  _converterSlideAnimation,
                                              child:
                                                  BlocBuilder<
                                                    CurrencyBloc,
                                                    CurrencyState
                                                  >(
                                                    builder: (context, state) {
                                                      return CurrencyConverterWidget(
                                                        onPairChanged:
                                                            (from, to) {
                                                              currencyFromListener
                                                                  .value = from
                                                                  .toString();
                                                              currencyToListener
                                                                  .value = to
                                                                  .toString();
                                                            },
                                                      );
                                                    },
                                                  ),
                                            ),
                                          );
                                        },
                                      ),
                                      Gap(24.dp),
                                      AnimatedBuilder(
                                        animation: _staggerController,
                                        builder: (context, child) {
                                          return FadeTransition(
                                            opacity: _textFieldFadeAnimation,
                                            child: SlideTransition(
                                              position:
                                                  _textFieldSlideAnimation,
                                              child: AmountTextField(
                                                fromCurrency: from,
                                                onChanged: (value) {
                                                  amountListener.value =
                                                      double.tryParse(value) ??
                                                      0;
                                                },
                                                validator: (value) =>
                                                    validateAmount(
                                                      value,
                                                      max: 100000,
                                                    ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Gap(16.dp),
                                      AnimatedBuilder(
                                        animation: _staggerController,
                                        builder: (context, child) {
                                          return FadeTransition(
                                            opacity: _resultFadeAnimation,
                                            child: SlideTransition(
                                              position: _resultSlideAnimation,
                                              child: ConversionResultWidget(),
                                            ),
                                          );
                                        },
                                      ),
                                      const Spacer(),
                                      AnimatedBuilder(
                                        animation: _staggerController,
                                        builder: (context, child) {
                                          return FadeTransition(
                                            opacity: _buttonFadeAnimation,
                                            child: ScaleTransition(
                                              scale: _buttonScaleAnimation,
                                              child: ValueListenableBuilder(
                                                valueListenable: amountListener,
                                                builder:
                                                    (
                                                      context,
                                                      amount,
                                                      child,
                                                    ) => PrimaryButton(
                                                      isLoading: state.getConversionResultStatus is StatusLoading,
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                              CurrencyBloc
                                                            >()
                                                            .add(
                                                              CurrencyEvent.getConversionResult(
                                                                from: from,
                                                                to: to,
                                                                amount: amount,
                                                              ),
                                                            );
                                                      },
                                                      icon: Image.asset(
                                                        AppImages.convertIcon,
                                                        height: 24.dp,
                                                        color: Colors.white,
                                                      ),
                                                      title: 'Convert',
                                                    ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Gap(24.dp),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          duration: const Duration(milliseconds: 1000),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, value, child) {
            return Container(
              width: 80.dp,
              height: 80.dp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    AppColors.primaryColor.withValues(alpha: 0.1),
                    AppColors.primaryColor,
                    AppColors.primaryColor.withValues(alpha: 0.1),
                  ],
                  stops: [0.0, value, 1.0],
                ),
              ),
              child: Center(
                child: Container(
                  width: 60.dp,
                  height: 60.dp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Icon(
                    Icons.currency_exchange,
                    size: 32.dp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

extension AnimatedWidgetExtensions on Widget {
  Widget animateOnTap({
    Duration duration = const Duration(milliseconds: 100),
    double scale = 0.95,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween<double>(begin: 1.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: this);
      },
    );
  }
}
