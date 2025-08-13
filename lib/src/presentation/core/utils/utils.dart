import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_constants.dart';

class Utils {
  static String getFlagFromCurrency(String code) {
    final entry = AppConstants.countries.firstWhere(
      (element) => element['code']?.toUpperCase() == code.toUpperCase(),
      orElse: () => {},
    );
    return entry['flag'] ?? '';
  }

  static String getCurrencyIcon(String code) {
    return AppConstants.prefixIcons[code] ?? '';
  }
}
