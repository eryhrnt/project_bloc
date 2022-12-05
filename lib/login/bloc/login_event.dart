part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Login extends LoginEvent {
  final String username;
  final String pass;

  Login(
    this.username,
    this.pass,
  );
  @override
  List<Object> get props => [
        username,
        pass,
      ];
}

class RegisterEvent extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
