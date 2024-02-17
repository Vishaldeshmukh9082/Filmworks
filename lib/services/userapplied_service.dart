
import 'dart:convert';

import 'package:filmwork/Constants/utlis.dart';
import 'package:filmwork/User_Navbar_Page.dart';
import 'package:filmwork/models/userapplied.dart';
import 'package:filmwork/providers/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Constants/constant_element.dart';

class UserAppliedService {
  void Submit({
    required BuildContext context,
    required String jobid,
    required String firstname,
    required String lastname,
    required String mobileno,
    required String email,
    required String gender,
    required String address,
    required String image,
    required String filmcard,
  }) async {
    try {
      UserApplied user = UserApplied(id: "",
          jobid: jobid,
          firstname: firstname,
          lastname: lastname,
          mobileno: mobileno,
          email: email,
          gender: gender,
          address: address,
          image: image,
          filmcard: filmcard,
          // token: ""
      );
      http.Response res = await http.post(Uri.parse('$uri/userapplied'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httperrorHandle(
          response: res,
          context: context,
          onsuccess: () {
            ShowSnackBar(context, "Applied successfully ");
            Navigator.pop(context, UserNavbarPage.routeName);
          });
    }catch(e){
      ShowSnackBar(context, e.toString());
    }
  }

  Future<List<UserApplied>> fetchAllUserApplication(BuildContext context) async {
    final clientProvider = Provider.of<ClientProvider>(context, listen: false);
    List<UserApplied> applyerslist = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/client/getapplications'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': clientProvider.client.token,
      });

      httperrorHandle(
        response: res,
        context: context,
        onsuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            applyerslist.add(
              UserApplied.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
    return applyerslist;
  }

}