import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_bloc/authentication/authentication.dart';
import 'package:project_bloc/model/user.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final AuthenticationService _auth;

  DashboardBloc(this._auth) : super(DashboardInitial()) {
    on<LoadDashboardEvent>(
      (event, emit) {
        final dash = _auth.getUser(
          event.username,
        );
        emit(
          DashboardLoadState(dash),
        );
      },
    );
  }
}
