import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thoughbox_currency_converter/app/constants/status/status.dart';
import 'package:thoughbox_currency_converter/app/router/route_constants.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/custom_toast.dart';

import '../../../../app/router/fluid_reveal_route.dart';
import '../../../application/auth_bloc/auth_bloc.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // bool _loading = false;
  final _auth = FirebaseAuth.instance;

  // Future<void> _login() async {
  //   if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("Please enter email and password")),
  //     );
  //     return;
  //   }
  //
  //   try {
  //     setState(() => _loading = true);
  //     await _auth.signInWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim(),
  //     );
  //     Navigator.pushReplacementNamed(context, '/home');
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(e.message ?? "Login failed")),
  //     );
  //   } finally {
  //     setState(() => _loading = false);
  //   }
  // }
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
              ),
              const SizedBox(height: 20),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if(state.loginStatus is StatusSuccess){
                    Navigator.pushReplacementNamed(context, RouterConstants.homeRoute);
                  } else if (state.loginStatus is StatusFailure) {
                    CustomToast.showToast(context: context, message: state.loginStatus.errorMessage);
                  }
                },
                listenWhen: (previous, current) => previous.loginStatus != current.loginStatus,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                          AuthEvent.login(email: _emailController.text,
                              password: _passwordController.text));
                    },
                    child: const Text("Login"),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text("Don't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
