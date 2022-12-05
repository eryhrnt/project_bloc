part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoadState extends DashboardState {
  final List<User> users;

  DashboardLoadState(this.users);

  @override
  List<Object> get props => [users];
}
