import 'package:filmwork/User_Navbar_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Client_Navbar_Page.dart';
import '../Constants/constant_element.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    required this.SignInKey,
    required this.label,
  });

  final GlobalKey<FormState> SignInKey;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Kprimarycolor,
              fontSize: 30,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (SignInKey.currentState!.validate()) {
                SignInKey;
              }
            },
            child: const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.arrow_forward_outlined,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}