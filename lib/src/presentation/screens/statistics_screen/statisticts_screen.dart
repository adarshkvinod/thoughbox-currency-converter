import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_typography.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/screen_background.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/statistics_screen/widgets/rate_trend_graph.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/statistics_screen/widgets/statistics_table.dart';

import '../../core/widgets/close_button.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        trailingIcon: CustomCloseButton(),
        onTapTrailingIcon: () {
          Navigator.pop(context);
        },
        title: 'Statistics',
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(24.dp),
                Text(
                  'Rate Trend',
                  style: AppTypography.heading2.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.textColorGrey,
                  ),
                ),
                Gap(4.dp),
                Text(
                  'Updated a few seconds ago',
                  style: AppTypography.bodyText.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.textColorGrey,
                  ),
                ),
                Gap(16.dp),
                RateTrendGraph(),
                Gap(24.dp),
                Text(
                  'Exchange Rates',
                  style: AppTypography.heading2.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.textColorGrey,
                  ),
                ),
                Gap(4.dp),
                Text(
                  'Updated a few seconds ago',
                  style: AppTypography.bodyText.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.textColorGrey,
                  ),
                ),
                Gap(16.dp),
                StatisticsTable(),
                Gap(24.dp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
