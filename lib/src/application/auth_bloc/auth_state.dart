part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
   factory AuthState.initial() => AuthState(
     loginStatus: Status.initial(),
   );
   factory AuthState({
     required  Status loginStatus,
})=_AuthState;
}
