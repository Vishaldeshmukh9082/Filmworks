import 'package:filmwork/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      firstname: '',
      lastname: '',
      mobileno: '',
      email: '',
      gender: '',
      address: '',
      image: '',
      filmcard: '',
      password: '',
      token: '');
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
