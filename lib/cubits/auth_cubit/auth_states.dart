abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterFailedState extends AuthStates {
  String message;

  RegisterFailedState({required this.message});
}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginFailedState extends AuthStates {
  String message;

  LoginFailedState({required this.message});
}

class PasswordLoadingState extends AuthStates {}

class PasswordSuccessState extends AuthStates {}

class PasswordFailedState extends AuthStates {
  String message;

  PasswordFailedState({required this.message});
}

class VerifyLoadingState extends AuthStates {}

class VerifySuccessState extends AuthStates {}

class VerifyFailedState extends AuthStates {}

class ResetLoadingState extends AuthStates {}

class ResetSuccessState extends AuthStates {}

class ResetFailedState extends AuthStates {}
