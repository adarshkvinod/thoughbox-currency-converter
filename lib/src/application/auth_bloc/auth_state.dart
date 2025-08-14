part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.initial() => AuthState(
    loginStatus: Status.initial(),
    logoutStatus: Status.initial(),
    signUpStatus: Status.initial(),
    checkAuthStatus: Status.initial(),
    userId: "",
  );

  factory AuthState({
    required Status loginStatus,
    required Status logoutStatus,
    required Status signUpStatus,
    required Status checkAuthStatus,
    required  String userId,
  }) = _AuthState;
}
