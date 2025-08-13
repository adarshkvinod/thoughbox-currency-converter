import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_typography.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/utils/utils.dart';

import '../../../core/constants/app_constants.dart';

class AmountTextField extends StatefulWidget {
  final String fromCurrency; // e.g. "INR"
  final ValueChanged<String>? onChanged; // callback for live updates
  final String? Function(String?)? validator; // optional custom validator

  const AmountTextField({
    super.key,
    required this.fromCurrency,
    this.onChanged,
    this.validator,
  });

  @override
  State<AmountTextField> createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText; // Current error message



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPrefixIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      key: ValueKey(widget.fromCurrency),
      child: Text(Utils.getCurrencyIcon(widget.fromCurrency),
      style: AppTypography.heading2.copyWith(
        color: AppColors.textColorGrey
      ),
      ),
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'Please enter an amount';
    final num? parsed = num.tryParse(value);
    if (parsed == null || parsed <= 0)
      return 'Enter a valid number greater than 0';
    if (parsed >= 100000) return 'Amount must be less than 100,000';
    return null;
  }

  void _validate(String? value) {
    final validator = widget.validator ?? _defaultValidator;
    final error = validator(value);
    if (error != _errorText) {
      setState(() {
        _errorText = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.dp,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            border: Border.all(color: AppColors.borderColor),
            color: AppColors.scaffoldBackgroundColor,
          ),
          child: TextFormField(
            controller: _controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: TextStyle(fontSize: 18.dp, color: Colors.white),
            onChanged: (value) {
              _validate(value);
              if (widget.onChanged != null) widget.onChanged!(value);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.dp,
                vertical: 16.dp,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Enter amount',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: _buildPrefixIcon(),
              ),
            ),
            cursorColor: AppColors.primaryColor,
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _errorText == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(top: 6.dp, left: 8.dp),
                  child: Text(
                    _errorText!,
                    style: AppTypography.bodyText.copyWith(
                      fontSize: 14.sp,
                      color: Colors.red,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
