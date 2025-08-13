import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/app/constants/status/status.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_animations.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_typography.dart';

import '../../../../application/currency_bloc/currency_bloc.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/utils/utils.dart';

class ConversionResultWidget extends StatefulWidget {
  const ConversionResultWidget({super.key});

  @override
  State<ConversionResultWidget> createState() => _ConversionResultWidgetState();
}

class _ConversionResultWidgetState extends State<ConversionResultWidget>
    with TickerProviderStateMixin {
  late final AnimationController _lottieController;
  late final AnimationController _slideController;
  late final Animation<Offset> _fromAnimation;
  late final Animation<Offset> _toAnimation;

  @override
  void initState() {
    super.initState();

    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fromAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _toAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _slideController.forward();
  }

  @override
  void dispose() {
    _lottieController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Widget _currencyColumn(
    String currency,
    String amount, {
    double? rate,
    required Animation<Offset> animation,
  }) {
    return SlideTransition(
      position: animation,
      child: Column(
        children: [
          Text(
            Utils.getFlagFromCurrency(currency),
            style: AppTypography.heading2.copyWith(fontSize: 60.sp),
          ),
          Text(
            currency,
            style: AppTypography.heading2.copyWith(
              fontSize: 20.sp,
              color: AppColors.textColorGrey,
            ),
          ),
          Gap(4.dp),
          Text(
            '${Utils.getCurrencyIcon(currency)}${rate != null ? rate.toStringAsFixed(2) : double.tryParse(amount)?.toStringAsFixed(1) ?? '0.0'}',
            style: AppTypography.heading2.copyWith(
              fontSize: 28.sp,
              color: AppColors.textColorGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(CurrencyState state) {
    if (state.getConversionResultStatus is StatusLoading) {
      return Center(
        child: Lottie.asset(
          AppAnimations.conversionLoadingAnimation,
          width: 200.dp,
          height: 200.dp,
          repeat: true,
          controller: _lottieController,
        ),
      );
    }

    if (state.getConversionResultStatus is StatusSuccess) {
      final from = state.conversionResult.from;
      final to = state.conversionResult.to;
      final amount = state.conversionResult.amount;
      final rate = state.conversionResult.result[state.conversionResult.to];
      final isOldResult =
          state.conversionResult.isCached &&
          state.conversionResult.cacheAgeInMinutes > 5;
      final cacheAge = state.conversionResult.cacheAgeInMinutes;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.dp),
        child: Column(
          children: [
            Gap(16.dp),
            if(isOldResult)
            ...[Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.dp),
                    border: Border.all(
                      color: isOldResult
                          ? AppColors.errorColor
                          : AppColors.primaryColor,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.dp,
                    vertical: 4.dp,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 8.dp,
                        width: 8.dp,
                        decoration: BoxDecoration(
                          color:AppColors.errorColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Gap(6.dp),
                      Text( "Rate updated $cacheAge minutes ago",
                        style: AppTypography.heading2.copyWith(
                          fontSize: 12.sp,
                          color:AppColors.errorColor,

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(8.dp),],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _currencyColumn(
                    from,
                    amount,
                    animation: _fromAnimation,
                  ),
                ),
                Image.asset(AppImages.arrowImage, height: 30.dp),
                Expanded(
                  child: _currencyColumn(
                    to,
                    amount,
                    rate: rate,
                    animation: _toAnimation,
                  ),
                ),
              ],
            ),
            Gap(24.dp),
          ],
        ),
      );
    }

    // Default placeholder
    return Padding(
      padding: EdgeInsets.all(24.dp),
      child: Column(
        children: [
          Image.asset(
            AppImages.resultPlaceholder,
            color: AppColors.textColorGrey.withValues(alpha: 0.2),
            height: 100.dp,
          ),
          Gap(16.dp),
          Text(
            "Convert currencies",
            style: AppTypography.bodyText.copyWith(
              color: AppColors.textColorGrey.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        bool isLoading = state.getConversionResultStatus is StatusLoading;
        return AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: isLoading
                  ? AppColors.textColorGrey.withValues(alpha: 0.2)
                  : AppColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16.dp),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: _buildContent(state),
          ),
        );
      },
    );
  }
}
