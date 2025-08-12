import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_animations.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_typography.dart';

import '../../../core/constants/app_images.dart';

class ConversionResultWidget extends StatefulWidget {
  final bool isLoading;
  const ConversionResultWidget({super.key, this.isLoading = false});

  @override
  State<ConversionResultWidget> createState() => _ConversionResultWidgetState();
}

class _ConversionResultWidgetState extends State<ConversionResultWidget>
    with TickerProviderStateMixin {
  late final AnimationController _lottieController;

  @override
  void initState() {
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _lottieController.repeat();
    super.initState();
  }
  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Container(
        width: 100.w,

        decoration: BoxDecoration(
          color:widget.isLoading
              ?AppColors.textColorGrey.withValues(alpha: 0.2): AppColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16.dp),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: widget.isLoading
            ? Center(
                child: Lottie.asset(
                  animate: true,
                  AppAnimations.conversionLoadingAnimation,
                  width: 200.dp,
                  height: 200.dp,
                  repeat: true,
                  controller: _lottieController,
                ),
              )
            : Padding(
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
            ),
      ),
    );
  }
}
