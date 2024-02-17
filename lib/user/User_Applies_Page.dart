
import 'package:flutter/material.dart';

import '../Component/Reusable_AppliedMessage_Box.dart';

class UserAppliesPage extends StatefulWidget {
  const UserAppliesPage({super.key});
  static const String routeName='/user-applies-page';

  @override
  State<UserAppliesPage> createState() => _UserAppliesPageState();
}

class _UserAppliesPageState extends State<UserAppliesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: ListView(
          children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Applied Jobs",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
               Applied_Message_Box(),
                const SizedBox(
                  height: 10,
                ),
          ],
        ),
    ),
    );
  }
}


