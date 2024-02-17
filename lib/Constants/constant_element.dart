
import 'dart:convert';

import 'package:filmwork/Constants/utlis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const Kbackgroundcolor=Color(0xFFFFFFFF);
const Kprimarycolor=Color(0xff03DAC6);
const KHeadtext= Color(0xFF605D5D);
const KFeildtext=Color(0xff000000);
const Ksecondarycolor=Color(0xFF6200EE);
class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/logo1.png",color: Colors.black,
      scale: 2.6,
    );
  }
}



String uri="http://192.168.84.181:3000";

void httperrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onsuccess,
}){
  switch(response.statusCode){
    case 200:
      onsuccess();
      break;
    case 400:
      ShowSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      ShowSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      ShowSnackBar(context, response.body);
  }
}