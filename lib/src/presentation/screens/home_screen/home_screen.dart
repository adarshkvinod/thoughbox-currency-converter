import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/app/constants/status/status.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_images.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/custom_toast.dart';
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
  final ValueNotifier<String> currencyFromListener = ValueNotifier('');
  final ValueNotifier<String> currencyToListener = ValueNotifier('');
  final ValueNotifier<double> amountListener = ValueNotifier(0);
  final double maxValue = 100000;

  late final AnimationController _mainController;
  late final AnimationController _staggerController;

  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;

  late final Animation<double> _converterFadeAnimation;
  late final Animation<Offset> _converterSlideAnimation;
  late final Animation<double> _textFieldFadeAnimation;
  late final Animation<Offset> _textFieldSlideAnimation;
  late final Animation<double> _resultFadeAnimation;
  late final Animation<Offset> _resultSlideAnimation;
  late final Animation<double> _buttonFadeAnimation;
  late final Animation<double> _buttonScaleAnimation;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startLoadingSequence();
  }

  void _setupAnimations() {
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _staggerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
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

    _converterFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
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

    _textFieldFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
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

    _resultFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
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

    _buttonFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
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

  Future<void> _startLoadingSequence() async {
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => _isLoading = false);
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

  String? validateAmount(String? value) {
    if (value == null || value.trim().isEmpty) return 'Please enter an amount';
    final num? amount = num.tryParse(value);
    if (amount == null || amount <= 0)
      return 'Enter a valid number greater than 0';
    if (amount >= maxValue) return 'Amount must be less than $maxValue';
    return null;
  }

  void _onConvertPressed(
    String from,
    String to,
    double amount,
    CurrencyState state,
  ) {
    if (from == to) {
      CustomToast.showToast(
        context: context,
        message: 'Please select different currencies',
      );
      return;
    }
    if (amount <= 0 || amount >= maxValue) {
      CustomToast.showToast(
        context: context,
        message: 'Please enter a valid amount',
      );
      return;
    }
    context.read<CurrencyBloc>().add(
      CurrencyEvent.getConversionResult(from: from, to: to, amount: amount),
    );
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
            log(state.conversionResult.toString(), name: "CONVERSION RESULT");

            return FadeSlideScaleTransition(
              fade: _fadeAnimation,
              slide: _slideAnimation,
              scale: _scaleAnimation,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.dp),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 86.h),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Gap(24.dp),
                          _buildCurrencyConverter(),
                          Gap(24.dp),
                          _buildAmountTextField(),
                          Gap(16.dp),
                          _buildConversionResult(),
                          const Spacer(),
                          _buildConvertButton(state),
                          Gap(24.dp),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCurrencyConverter() => FadeSlideTransition(
    fade: _converterFadeAnimation,
    slide: _converterSlideAnimation,
    child: BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) => CurrencyConverterWidget(
        onPairChanged: (from, to) {
          context.read<CurrencyBloc>().add(CurrencyEvent.clearConversionData());
          currencyFromListener.value = from;
          currencyToListener.value = to;
        },
      ),
    ),
  );

  Widget _buildAmountTextField() => FadeSlideTransition(
    fade: _textFieldFadeAnimation,
    slide: _textFieldSlideAnimation,
    child: ValueListenableBuilder(
      valueListenable: currencyFromListener,
      builder: (context, from, _) => AmountTextField(
        fromCurrency: from,
        onChanged: (value) =>
            amountListener.value = double.tryParse(value) ?? 0,
        validator: validateAmount,
      ),
    ),
  );

  Widget _buildConversionResult() => FadeSlideTransition(
    fade: _resultFadeAnimation,
    slide: _resultSlideAnimation,
    child: const ConversionResultWidget(),
  );

  Widget _buildConvertButton(CurrencyState state) => FadeScaleTransition(
    fade: _buttonFadeAnimation,
    scale: _buttonScaleAnimation,
    child: ValueListenableBuilder(
      valueListenable: amountListener,
      builder: (context, amount, _) => PrimaryButton(
        isLoading: state.getConversionResultStatus is StatusLoading,
        onPressed: () => _onConvertPressed(
          currencyFromListener.value,
          currencyToListener.value,
          amount,
          state,
        ),
        icon: Image.asset(
          AppImages.convertIcon,
          height: 24.dp,
          color: Colors.white,
        ),
        title: 'Convert',
      ),
    ),
  );

  Widget _buildLoadingIndicator() => TweenAnimationBuilder(
    duration: const Duration(milliseconds: 1000),
    tween: Tween<double>(begin: 0, end: 1),
    builder: (context, value, child) => Container(
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
    ),
  );
}

/// Helper widget for Fade + Slide transitions
class FadeSlideTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> fade;
  final Animation<Offset> slide;

  const FadeSlideTransition({
    super.key,
    required this.child,
    required this.fade,
    required this.slide,
  });

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: fade,
    child: SlideTransition(position: slide, child: child),
  );
}

/// Helper widget for Fade + Scale transitions
class FadeSlideScaleTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> fade;
  final Animation<Offset> slide;
  final Animation<double> scale;

  const FadeSlideScaleTransition({
    super.key,
    required this.child,
    required this.fade,
    required this.slide,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: fade,
    child: SlideTransition(
      position: slide,
      child: ScaleTransition(scale: scale, child: child),
    ),
  );
}

class FadeScaleTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> fade;
  final Animation<double> scale;

  const FadeScaleTransition({
    super.key,
    required this.child,
    required this.fade,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: fade,
    child: ScaleTransition(scale: scale, child: child),
  );
}
