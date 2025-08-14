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

class _StatisticsScreenState extends State<StatisticsScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _staggerController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  late Animation<double> _graphFadeAnimation;
  late Animation<Offset> _graphSlideAnimation;
  late Animation<double> _tableFadeAnimation;
  late Animation<Offset> _tableSlideAnimation;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startLoadingSequence();
  }

  void _setupAnimations() {
    _mainController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _staggerController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutBack),
      ),
    );

    // Graph Animation
    _graphFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    _graphSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _staggerController,
            curve: const Interval(0.0, 0.4, curve: Curves.easeOutCubic),
          ),
        );

    // Table Animation
    _tableFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
      ),
    );

    _tableSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _staggerController,
            curve: const Interval(0.4, 0.8, curve: Curves.easeOutCubic),
          ),
        );
  }

  void _startLoadingSequence() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() => _isLoading = false);
    _mainController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _staggerController.forward();
  }

  @override
  void dispose() {
    _mainController.dispose();
    _staggerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        trailingIcon: const CustomCloseButton(),
        onTapTrailingIcon: () => Navigator.pop(context),
        title: 'Statistics',
        child: AnimatedBuilder(
          animation: _mainController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.dp),
                    child: SingleChildScrollView(
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
                          AnimatedBuilder(
                            animation: _staggerController,
                            builder: (context, _) {
                              return FadeTransition(
                                opacity: _graphFadeAnimation,
                                child: SlideTransition(
                                  position: _graphSlideAnimation,
                                  child: const RateTrendGraph(),
                                ),
                              );
                            },
                          ),
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
                          AnimatedBuilder(
                            animation: _staggerController,
                            builder: (context, _) {
                              return FadeTransition(
                                opacity: _tableFadeAnimation,
                                child: SlideTransition(
                                  position: _tableSlideAnimation,
                                  child: const StatisticsTable(),
                                ),
                              );
                            },
                          ),
                          Gap(24.dp),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
