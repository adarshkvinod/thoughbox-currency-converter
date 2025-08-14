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
    on<_CheckAuth>(_checkAuthEvent);
    on<_Logout>(_logoutEvent);
  }

  Future<void> _loginEvent(_Login event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(loginStatus: Status.loading()));
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: event.email.trim(),
            password: event.password.trim(),
          );

      final uid = userCredential.user?.uid;

      emit(state.copyWith(loginStatus: Status.success(), userId: uid ?? ""));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(loginStatus: Status.failure(e.toString())));
    } catch (e) {
      emit(state.copyWith(loginStatus: Status.failure(e.toString())));
    }
  }

  FutureOr<void> _signUpEvent(_SignUp event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(signUpStatus: Status.loading()));
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: event.email.trim(),
            password: event.password.trim(),
          );

      final uid = userCredential.user?.uid;

      emit(state.copyWith(signUpStatus: Status.success(), userId: uid ?? ""));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(signUpStatus: Status.failure(e.toString())));
    } catch (e) {
      emit(state.copyWith(signUpStatus: Status.failure(e.toString())));
    }
  }

  FutureOr<void> _checkAuthEvent(
    _CheckAuth event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(checkAuthStatus: Status.loading()));

      final currentUser = _firebaseAuth.currentUser;

      if (currentUser != null) {
        emit(
          state.copyWith(
            checkAuthStatus: Status.success(),
            userId: currentUser.uid,
          ),
        );
      } else {
        emit(
          state.copyWith(
            checkAuthStatus: Status.failure("No user logged in"),
            userId: "",
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(checkAuthStatus: Status.failure(e.toString())));
    }
  }

  FutureOr<void> _logoutEvent(_Logout event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(logoutStatus: Status.loading()));
      await _firebaseAuth.signOut();
      emit(AuthState.initial());
      emit(state.copyWith(logoutStatus: Status.success()));
    } catch (e) {
      emit(state.copyWith(loginStatus: Status.failure("Logout failed: $e")));
    }
  }
}
