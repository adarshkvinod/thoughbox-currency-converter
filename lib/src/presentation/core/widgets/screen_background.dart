import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_images.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_typography.dart';

class ScreenBackground extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final double? titleBottomPadding;
  final double? titleTopPadding;
  final Widget child;
  final Widget? trailingIcon;
  final Function()? onTapTrailingIcon;

  const ScreenBackground({
    super.key,
    this.title,
    this.titleStyle,
    this.titleBottomPadding,
    this.titleTopPadding,
    required this.child,
    this.onTapTrailingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(titleTopPadding ?? 52.dp),
        SizedBox(
          width: 100.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  // Fade + Slide from bottom effect
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.3), // start below
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  title ?? AppStrings.appName,
                  key: ValueKey(title), // Important: Detect changes
                  style: titleStyle ??
                      AppTypography.heading2.copyWith(
                        color: AppColors.textColorGrey,
                        fontSize: 18.sp,
                      ),
                ),
              ),

              Positioned(
                right: 24.dp,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.dp),
                  onTap: onTapTrailingIcon,
                  child: Padding(
                    padding: EdgeInsets.all(8.dp),
                    child: trailingIcon ??
                        Image.asset(
                          AppImages.statisticsIcon,
                          width: 24.dp,
                          height: 24.dp,
                          color: AppColors.primaryColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),


        Gap(titleBottomPadding ?? 16.dp),
        Expanded(
          child: Container(
            width: 100.w,
            padding: EdgeInsets.only(top: 1.dp, left: 1.dp, right: 1.dp),
            margin: EdgeInsets.symmetric(horizontal: 16.dp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.dp),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,

                colors: [
                  Color(0xFF292929),
                  Color(0xFF848484),
                  Color(0xFF292929),
                ],
              ),
            ),
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.dp),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  colors: [Color(0xFF1B1B1B), Color(0xFF131313)],
                ),
              ),
              child: child,
            ),
          ),
        ),
        Gap(24.dp),
      ],
    );
  }
}
