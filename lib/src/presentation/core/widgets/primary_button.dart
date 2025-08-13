
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_typography.dart';
import '../constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final TextStyle? titleStyle;
  final Color? bgColor;
  final VoidCallback? onPressed;
  final bool? isLoading;

  const PrimaryButton({
    Key? key,
    required this.title,
    this.icon,
    this.titleStyle,
    this.bgColor,
    this.onPressed, this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor ?? AppColors.primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: SizedBox(
          height: 52.dp,
          width: 100.w,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: isLoading!? LoadingAnimationWidget.threeRotatingDots(
              color: Colors.white,
              size: 24.dp,
            ):
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 8),
                ],
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    // Fade + slight scale animation
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(scale: animation, child: child),
                    );
                  },
                  child: Text(
                    title,
                    key: ValueKey(title), // detect title change
                    style: titleStyle ??
                        AppTypography.buttonText.copyWith(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
