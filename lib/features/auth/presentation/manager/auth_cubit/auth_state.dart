import 'package:shop_app/features/auth/data/models/user_model/user_model.dart';

abstract class AuthState {}

final class AuthInitialState extends AuthState {}

// Login States

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {
  final UserModel userLoginModel;

  LoginSuccessState(this.userLoginModel);
}

final class LoginFailureState extends AuthState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}

// SignUp States
final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {
  final UserModel userLoginModel;

  SignUpSuccessState(this.userLoginModel);
}

final class SignUpFailureState extends AuthState {
  final String errMessage;
  SignUpFailureState({required this.errMessage});
}

final class ChangeLoginEyeIconViesibiltyState extends AuthState {}

final class ChangeSignUpEyeIconViesibiltyState extends AuthState {}
