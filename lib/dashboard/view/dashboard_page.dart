import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/authentication/authentication.dart';

import '../bloc/dashboard_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
    required this.username,
    required this.name,
    required this.email,
  });

  final String username;
  final String name;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: BlocProvider(
        create: (context) => DashboardBloc(
          RepositoryProvider.of<AuthenticationService>(context),
        )..add(
            LoadDashboardEvent(
              username,
            ),
          ),
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoadState) {
              return ListView(
                children: state.users
                    .map(
                      (e) => ListTile(
                        title: Text(e.name),
                        trailing: Text(e.username),
                        subtitle: Text(e.email),
                      ),
                    )
                    .toList(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
