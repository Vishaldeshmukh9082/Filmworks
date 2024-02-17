import 'package:filmwork/Login_Page.dart';
import 'package:filmwork/client/Client_Home_Page.dart';
import 'package:flutter/material.dart';

import '../Constants/constant_element.dart';
import '../Input_Page.dart';
import '../user/User_Home_Page.dart';

class SubmitButtom extends StatelessWidget {
  const SubmitButtom({
    required this.label
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, MaterialPageRoute(builder: (context) {
          return const LoginPage();
        }));
      },
      child: Center(
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Ksecondarycolor,
          ),
          child: Center(
            child: Text(label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Kbackgroundcolor,
              ),),
          ),
        ),
      ),
    );
  }
}
