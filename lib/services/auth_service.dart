import 'dart:convert';

import 'package:filmwork/Constants/constant_element.dart';
import 'package:filmwork/Constants/utlis.dart';
import 'package:filmwork/User_Navbar_Page.dart';
import 'package:filmwork/models/user.dart';
import 'package:filmwork/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Input_Page.dart';
import '../Login_Page.dart';

class AuthService {
  //signup
  void signUpUser({
    required BuildContext context,
    required String firstname,
    required String lastname,
    required String mobileno,
    required String email,
    required String gender,
    required String address,
    required String image,
    required String filmcard,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          firstname: firstname,
          lastname: lastname,
          mobileno: mobileno,
          email: email,
          gender: gender,
          address: address,
          image: image,
          filmcard: filmcard,
          password: password,
          token: '');
      http.Response res = await http.post(Uri.parse('$uri/user/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httperrorHandle(
          response: res,
          context: context,
          onsuccess: () {
            ShowSnackBar(context, "Accounde Created! login ");
            Navigator.pop(context, LoginPage.routeName);
          });
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }

  //sign in
  void signInUser({
    required BuildContext context,
    required String mobileno,
    required String password,
  }) async {
    try {

      http.Response res = await http.post(Uri.parse('$uri/user/signin'),
          body: jsonEncode({
            'mobileno': mobileno,
            'password':password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      print(res.body);
      // ignore: use_build_context_synchronously
      httperrorHandle(
          response: res,
          context: context,
          onsuccess: ()async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context,listen: false).setUser(res.body);
            await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamed(context, UserNavbarPage.routeName);

          }
      );
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }

  // get user data
  void getUserData(
      BuildContext context,
      ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/user/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/user/profile'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }

  //Log Out
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pop(context, LoginPage.routeName);
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }

}

