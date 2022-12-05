part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class LoadDashboardEvent extends DashboardEvent {
  final String username;

  LoadDashboardEvent(
    this.username,
  );

  @override
  List<Object> get props => [
        username,
      ];
}
