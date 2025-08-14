import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/app/constants/status/status.dart';
import 'package:thoughbox_currency_converter/app/router/route_constants.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/home_screen/home_screen.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/login_screen/login_screen.dart';
import '../../../../app/router/custom_route_animation.dart';
import '../../../application/auth_bloc/auth_bloc.dart';
import '../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    context.read<AuthBloc>().add(AuthEvent.checkAuth());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.checkAuthStatus is StatusSuccess) {
            Navigator.pushReplacement(
              context,
              FluidStackRoute(
                child: const HomeScreen(),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
              ),
            );
          } else if (state.checkAuthStatus is StatusFailure) {
            Navigator.pushReplacement(
              context,
              FluidStackRoute(
                child: const LoginScreen(),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
              ),
            );
          }
        },
        listenWhen: (previous, current) =>
            previous.checkAuthStatus != current.checkAuthStatus,
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: 80.dp,
                  height: 80.dp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [
                        AppColors.primaryColor.withValues(alpha: 0.1),
                        AppColors.primaryColor,
                        AppColors.primaryColor.withValues(alpha: 0.1),
                      ],
                      stops: [0.0, _controller.value, 1.0],
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 60.dp,
                      height: 60.dp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Icon(
                        Icons.currency_exchange,
                        size: 32.dp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
