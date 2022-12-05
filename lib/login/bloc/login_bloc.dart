import 'package:bloc/bloc.dart';
import 'package:project_bloc/authentication/authentication.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationService _auth;

  LoginBloc(this._auth) : super(LoginInitial()) {
    on<Login>(
      (event, emit) async {
        //print(event);
        final user = await _auth.authenticateUser(
          event.username,
          event.pass,
        );
        if (user != null) {
          emit(SuccessState(user));
          emit(LoginInitial());
        }
      },
    );
    on<RegisterEvent>(
      (event, emit) async {
        await _auth.init();

        emit(LoginInitial());
      },
    );
  }
}
