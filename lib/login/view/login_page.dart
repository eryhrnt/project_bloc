import 'package:hive/hive.dart';
import 'package:project_bloc/app_theme.dart';
import 'package:project_bloc/dashboard/view/dashboard_page.dart';
import 'package:project_bloc/dashboard/dashboard.dart';
import 'package:project_bloc/model/user.dart';
import 'package:project_bloc/register/view/register_page.dart';
import 'package:project_bloc/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
    required String title,
  });

  final usernameField = TextEditingController();
  final passField = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text('Welcome to App'),
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(
          RepositoryProvider.of<AuthenticationService>(context),
        )..add(
            RegisterEvent(),
          ),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: ((context, state) {
            if (state is SuccessState) {
              print('Login Success');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DashboardPage(
                    username: state.username,
                    email: state.username,
                    name: state.username,
                  ),
                ),
              );
            }
          }),
          builder: (context, state) {
            if (state is LoginInitial) {
              return Container(
                padding: EdgeInsets.all(AppTheme.mainPadding),
                child: Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                        ),
                        controller: usernameField,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Username Required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                        controller: passField,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Password Required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 40),
                        ),
                        onPressed: () {
                          if (_form.currentState!.validate()) {
                            BlocProvider.of<LoginBloc>(context).add(
                              Login(
                                usernameField.text,
                                passField.text,
                              ),
                            );
                          }
                        },
                        child: Text('Login'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: (() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(
                                title: 'Register',
                              ),
                            ),
                          );
                        }),
                        child: Text("Don't have an account? Click Here!"),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
