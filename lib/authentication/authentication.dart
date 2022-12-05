import 'package:flutter/cupertino.dart';
import 'package:project_bloc/model/user.dart';
import 'package:hive/hive.dart';

class AuthenticationService {
  late Box<User> _users;

  Future<void> init() async {
    _users = await Hive.openBox<User>('USERS');

    //await _users.clear();
    _users.get(
      User(
        name: _users.values.toString(),
        email: _users.values.toString(),
        username: _users.values.toString(),
        pass: _users.values.toString(),
      ),
    );
    // _users.get(
    //   User(
    //       name: _users.name,
    //       email: _users.name,
    //       username: _users.name,
    //       pass: _users.name),
    // );
  }

  Future<String?> authenticateUser(
    final String username,
    final String pass,
  ) async {
    final success = _users.values
        .any((element) => element.username == username && element.pass == pass);
    if (success) {
      return username;
    } else {
      return null;
    }
  }

  List<User> getUser(
    final String username,
  ) {
    final user = _users.values.where((element) => element.username == username);
    return user.toList();
  }

  void addUser(
    final String name,
    final String username,
    final String email,
    final String pass,
  ) {
    _users.add(
      User(
        name: name,
        email: email,
        username: username,
        pass: pass,
      ),
    );
  }
}