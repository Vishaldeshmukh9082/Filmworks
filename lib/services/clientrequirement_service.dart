import 'dart:convert';

import 'package:filmwork/Client_Navbar_Page.dart';
import 'package:filmwork/models/clientrequirement.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Constants/constant_element.dart';
import '../Constants/utlis.dart';
import '../providers/client_provider.dart';
import '../providers/user_provider.dart';

class ClientRequiremenetService {
  //clientrequiremnet
  void Submit({
    required BuildContext context,
    required String clientname,
    required String clientdetail,
    required String clientemail,
    required String jobtitle,
    required String jobdesciption,
    required String startdate,
    required String enddate,
    required String tilldate,
    required String gender,
    required String quantity,
    required String payment,
    required String joblocation,
  }) async {
    try {
      ClientRequirement clientRequiremnet = ClientRequirement(
          id: '',
          clientname: clientname,
          clientdetail: clientdetail,
          clientemail: clientemail,
          jobtitle: jobtitle,
          jobdesciption: jobdesciption,
          startdate: startdate,
          enddate: enddate,
          tilldate: tilldate,
          gender: gender,
          quantity: quantity,
          payment: payment,
          joblocation: joblocation,
          // token: ''
      );
      http.Response res = await http.post(Uri.parse('$uri/clientrequirement'),
          body: clientRequiremnet.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httperrorHandle(
          response: res,
          context: context,
          onsuccess: () {
            ShowSnackBar(context, "your requirement is submitted ");
            Navigator.pushNamed(context, ClientNavbarPage.routeName);
          });
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }

  // get all the requirement on user side
  Future<List<ClientRequirement>> fetchAllClientRequirements(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<ClientRequirement> requirementList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/user/getrequirement'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httperrorHandle(
        response: res,
        context: context,
        onsuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            requirementList.add(
              ClientRequirement.fromJson(
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
    return requirementList;
  }

  //get all the requirement on client side
  Future<List<ClientRequirement>> fetchAllRequirements(BuildContext context) async {
    final clientProvider = Provider.of<ClientProvider>(context, listen: false);
    List<ClientRequirement> requirementList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/client/getrequirement'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': clientProvider.client.token,
      });

      httperrorHandle(
        response: res,
        context: context,
        onsuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            requirementList.add(
              ClientRequirement.fromJson(
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
    return requirementList;
  }


  //delete requirement
  void deleteClientRequirement({
    required BuildContext context,
    required ClientRequirement clientRequirement,
    required VoidCallback onSuccess,
  }) async {
    final clientProvider = Provider.of<ClientProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/client/deleterequirement'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-client-token': clientProvider.client.token,
        },
        body: jsonEncode({
          'id': clientRequirement.id,
        }),
      );

      httperrorHandle(
        response: res,
        context: context,
        onsuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }
}
