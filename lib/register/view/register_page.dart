import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project_bloc/app_theme.dart';
import 'package:project_bloc/login/login.dart';

import '../../model/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required String title});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passController.dispose();
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.mainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                controller: _nameController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                controller: _emailController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
                controller: _usernameController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                controller: _passController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                ),
                controller: _passController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 40),
                ),
                onPressed: (() async {
                  final value = User(
                    name: _nameController.text,
                    email: _emailController.text,
                    username: _usernameController.text,
                    pass: _passController.text,
                  );
                  //Hive.openBox<User>('USERS');

                  Hive.box<User>('USERS').add(value);
                  print('Submit');

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(
                        title: '',
                      ),
                    ),
                  );
                }),
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
