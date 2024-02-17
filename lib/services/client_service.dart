import 'package:filmwork/CLogin_Page.dart';
import 'package:filmwork/Client_Navbar_Page.dart';
import 'package:filmwork/models/client.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:filmwork/providers/client_provider.dart';

import '../Constants/constant_element.dart';
import '../Constants/utlis.dart';
import 'dart:convert';


class ClientService {
  //signup
  void signUpClient({
    required BuildContext context,
    required String clientname,
    required String mobileno,
    required String email,
    required String gender,
    required String address,
    required String roledescription,
    required String image,
    required String filmcard,
    required String password,
  }) async {
    try {
      Client client = Client(
          id: '',
          clientname: clientname,
          mobileno: mobileno,
          email: email,
          gender: gender,
          address: address,
          roledescription: roledescription,
          image: image,
          filmcard: filmcard,
          password: password,
          token: '');
      http.Response res = await http.post(Uri.parse('$uri/client/signup'),
          body: client.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
          print(clientname);
      httperrorHandle(
          response: res,
          context: context,
          onsuccess: () {
            ShowSnackBar(context, "Accounde Created! login ");
            Navigator.pop(context, CLoginPage.routeName);
          });
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }

  //sign in
  void signInClient({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {

      http.Response res = await http.post(Uri.parse('$uri/client/signin'),
          body: jsonEncode({
            'email': email,
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
            Provider.of<ClientProvider>(context,listen: false).setClient(res.body);
            await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamed(context, ClientNavbarPage.routeName);

          }
      );
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }

  // get user data
  void getClientData(
      BuildContext context,
      ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/client/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response clientRes = await http.get(
          Uri.parse('$uri/client/profile'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var clientProvider = Provider.of<ClientProvider>(context, listen: false);
        clientProvider.setClient(clientRes.body);
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
      Navigator.pop(context, CLoginPage.routeName);
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }
}
