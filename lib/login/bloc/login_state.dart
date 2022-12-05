part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  LoginInitial();
  @override
  List<Object?> get props => [];
}

class SuccessState extends LoginState {
  final String username;

  SuccessState(
    this.username,
  );
  @override
  List<Object?> get props => [
        username,
      ];
}

class RegisterState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
