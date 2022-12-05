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
  final TextEditingController _cpassController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passController.dispose();
    _cpassController.dispose();
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
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                  controller: _nameController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Name Required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  controller: _emailController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Email Required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                  ),
                  controller: _usernameController,
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
                  controller: _passController,
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
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                  ),
                  controller: _cpassController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Password Confirmation Reqiuired';
                    }
                    if (v != _passController.text) {
                      return 'Password Not Match';
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
                  onPressed: (() {
                    if (_form.currentState!.validate()) {
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
                    }
                  }),
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
