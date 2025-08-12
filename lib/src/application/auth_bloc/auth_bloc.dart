import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../app/constants/status/status.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthBloc() : super(AuthState.initial()) {
    on<_Login>(_loginEvent);
    on<_SignUp>(_signUpEvent);
  }

  Future<void> _loginEvent(_Login event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(loginStatus: Status.loading(),));
      await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );
      emit(state.copyWith(loginStatus: Status.success()));
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          loginStatus: Status.failure(e.toString()),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loginStatus: Status.failure(e.toString()),
        ),
      );
    }
  }

  FutureOr<void> _signUpEvent(_SignUp event, Emitter<AuthState> emit) async{
    try {
      emit(state.copyWith(signUpStatus: Status.loading()));
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email.trim(),
        password: event.password.trim(),
      );
      emit(state.copyWith(signUpStatus: Status.success()));
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          signUpStatus: Status.failure(e.toString()),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          signUpStatus: Status.failure(e.toString()),
        ),
      );
    }
  }
}
