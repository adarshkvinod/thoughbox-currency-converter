import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

import '../constants/app_typography.dart';

class CustomToast {
  static Future<void> showToast({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) async {
    HapticFeedback.heavyImpact();

    await Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: const Color(0xFFFF0063),
      duration: duration,
      padding: EdgeInsets.symmetric(horizontal: 16.dp, vertical: 12.dp),
      margin: EdgeInsets.zero, // Ensures full width
      borderRadius: BorderRadius.zero,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.linear,
      reverseAnimationCurve: Curves.easeIn,
      messageText: Row(
        children: [
          const Icon(Icons.info_outline_rounded, color: Colors.white),
          Gap(8.dp),
          Expanded(
            child: Text(
              message,
              style: AppTypography.bodyText.copyWith(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.white, size: 20.dp),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pop();
            },
          ),
        ],
      ),
    ).show(context);
  }
}
