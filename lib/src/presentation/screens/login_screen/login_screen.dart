import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/app/constants/status/status.dart';
import 'package:thoughbox_currency_converter/app/router/route_constants.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/custom_text_field.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/custom_toast.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/primary_button.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/screen_background.dart';
import 'package:thoughbox_currency_converter/src/presentation/screens/login_screen/widgets/vertical_sliding_tab.dart';
import '../../../../app/router/custom_route_animation.dart';
import '../../../../app/utilities/validators.dart';
import '../../../application/auth_bloc/auth_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<int> currentTabIndex = ValueNotifier<int>(0);

  bool _validateFields() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      CustomToast.showToast(
        context: context,
        message: 'Please fill in all fields correctly.',
      );
      formKey.currentState!.validate();
      return false;
    }

    if (formKey.currentState!.validate()) {
      return true;
    } else {
      CustomToast.showToast(
        context: context,
        message: 'Please fill in all fields correctly.',
      );
      return false;
    }
  }

  void _handleButtonPress() {
    if (_validateFields()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      if (currentTabIndex.value == 1) {
        context.read<AuthBloc>().add(
          AuthEvent.signUp(email: email, password: password),
        );
      } else {
        context.read<AuthBloc>().add(
          AuthEvent.login(email: email, password: password),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ValueListenableBuilder(
        valueListenable: currentTabIndex,
        builder: (context, index, child) => ScreenBackground(
          title: index == 0 ? 'Login' : 'Sign Up',
          trailingIcon: const SizedBox(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.dp),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(24.dp),
                  Container(
                    width: 90.dp,
                    height: 90.dp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Icon(
                      Icons.currency_exchange,
                      size: 60.dp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Gap(16.dp),
                  HorizontalSlidingTab(
                    tabs: ['Login', 'Sign Up'],
                    onTabChanged: (value) {
                      currentTabIndex.value = value;
                    },
                  ),
                  Gap(35.dp),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Enter email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Email is required';
                      } else if (!Validator.isValidEmail(value.trim())) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                  ),
                  Gap(16.dp),
                  CustomTextField(
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Password is required';
                      } else if (!Validator.isValidPassword(value.trim())) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    hintText: 'Enter password',
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  Gap(24.dp),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.signUpStatus is StatusSuccess) {
                        Navigator.pushReplacement(
                          context,
                          FluidStackRoute(
                            child: const HomeScreen(),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutCubic,
                          ),
                        );
                      } else if (state.signUpStatus is StatusFailure) {
                        CustomToast.showToast(
                          context: context,
                          message: state.signUpStatus.errorMessage,
                        );
                      }
                    },
                    listenWhen: (previous, current) =>
                        previous.signUpStatus != current.signUpStatus,
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state.loginStatus is StatusSuccess) {
                          Navigator.pushReplacement(
                            context,
                            FluidStackRoute(
                              child: const HomeScreen(),
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOutCubic,
                            ),
                          );
                        } else if (state.loginStatus is StatusFailure) {
                          CustomToast.showToast(
                            context: context,
                            message: state.loginStatus.errorMessage,
                          );
                        }
                      },
                      listenWhen: (previous, current) =>
                          previous.loginStatus != current.loginStatus,
                      builder: (context, state) {
                        return PrimaryButton(
                          isLoading: state.loginStatus is StatusLoading ||
                              state.signUpStatus is StatusLoading,
                          onPressed: _handleButtonPress,
                          title: index == 0 ? 'Login' : 'Sign Up',
                        );
                      },
                    ),
                  ),
                  Gap(30.dp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
