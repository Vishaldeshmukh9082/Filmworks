import 'package:filmwork/Component/Reusable_SubmitButton.dart';
import 'package:filmwork/Constants/constant_element.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../services/auth_service.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});
  static const String routeName='/user-profile-page';

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  final AuthService authService = AuthService();

  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Personal Info",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: KFeildtext,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: CircleAvatar(
                    backgroundColor: Kbackgroundcolor,
                    radius: 50,
                    child: Image.asset(
                      "images/profile.jpg",
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user.firstname + " " + user.lastname,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Ksecondarycolor,
                ),
              ),
              // const Text(
              //   "Spot Boy",
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: Color(0xFF605D5D),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                padding: const EdgeInsets.only(left: 10, bottom: 40),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Kprimarycolor,
                      width: 2,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Personal Info",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Ksecondarycolor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.firstname + " " + user.lastname,
                      style: TextStyle(fontSize: 15, color: Color(0xFF605D5D)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.mobileno,
                      style: TextStyle(fontSize: 15, color: Color(0xFF605D5D)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.email,
                      style: TextStyle(fontSize: 15, color: Color(0xFF605D5D)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.gender,
                      style: TextStyle(fontSize: 15, color: Color(0xFF605D5D)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.address,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF605D5D),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                padding: const EdgeInsets.only(left: 10, bottom: 20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Kprimarycolor,
                      width: 2,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Professional Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Ksecondarycolor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 200,
                      child: Image.asset(
                        "images/artistcard.jpeg",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  authService.logOut(context);
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
                      child: Text(
                        "Log-Out",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Kbackgroundcolor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
