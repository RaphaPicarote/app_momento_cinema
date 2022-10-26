import 'package:momento_cinema/login/login_controller.dart';

class LoginState {}

class LoginStateEmpty extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {}

class LoginStateError extends LoginState {
  final String error;

  LoginStateError(this.error);
}
