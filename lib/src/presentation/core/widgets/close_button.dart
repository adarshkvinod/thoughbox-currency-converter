import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.dp,
      width: 24.dp,
      decoration: BoxDecoration(
        color: AppColors.textColorGrey,
        shape: BoxShape.circle
      ),
      child: Icon(
        Icons.close,
        color: AppColors.scaffoldBackgroundColor,
        size: 18.dp,
      ),
    );
  }
}
