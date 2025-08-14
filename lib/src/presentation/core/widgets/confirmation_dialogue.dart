import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/primary_button.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.confirmText = "Yes",
    this.cancelText = "Cancel",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        title,
        style: AppTypography.heading2.copyWith(color: Colors.white),
      ),
      content: Text(
        message,
        style: AppTypography.bodyText.copyWith(color: AppColors.textColorGrey),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                title: cancelText,
                bgColor: AppColors.textColorGrey,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Gap(12.dp),
            Expanded(
              child: PrimaryButton(
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm();
                },
                title: confirmText,
                bgColor: AppColors.errorColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
