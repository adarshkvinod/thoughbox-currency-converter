import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_typography.dart';

import '../constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final TextStyle? titleStyle;
  final Color? bgColor;
  final VoidCallback? onPressed;

  const PrimaryButton({
    Key? key,
    required this.title,
    this.icon,
    this.titleStyle,
    this.bgColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(

      color: bgColor?? AppColors.primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: SizedBox(
            width: 100.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    title,
                    style: titleStyle ?? AppTypography.buttonText.copyWith(
                      fontSize: 16.sp,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
