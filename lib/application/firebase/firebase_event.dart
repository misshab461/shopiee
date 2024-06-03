part of 'firebase_bloc.dart';

@freezed
class FirebaseEvent with _$FirebaseEvent {
  const factory FirebaseEvent.checkLoginStatus() = CheckLoginStatus;
  const factory FirebaseEvent.signupEvent(UserModel user) = SignupEvent;
  const factory FirebaseEvent.loginEvent(
      {required String email, required String password}) = LoginEvent;
  const factory FirebaseEvent.signoutEvent() = SignoutEvent;
}
