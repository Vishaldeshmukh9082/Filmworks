
import 'package:filmwork/Constants/constant_element.dart';
import 'package:filmwork/user/User_Applies_Page.dart';
import 'package:filmwork/user/User_Home_Page.dart';
import 'package:filmwork/user/User_Profile_Page.dart';
import 'package:flutter/material.dart';

class UserNavbarPage extends StatefulWidget {
  const UserNavbarPage({super.key});
  static const String routeName='/user-navbar-page';

  @override
  State<UserNavbarPage> createState() => _UserNavbarPageState();
}

class _UserNavbarPageState extends State<UserNavbarPage> {
  List Pages=[
    UserHomePage(),
    UserAppliesPage(),
    UserProfilePage(),
  ];
  int CorrectIndex=0;
  Ontap(int Index){
    setState(() {
      CorrectIndex=Index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Pages[CorrectIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white, //orange
          unselectedItemColor: Colors.black, //white
          backgroundColor: Kprimarycolor,
          showUnselectedLabels: false,
          // showSelectedLabels: false,
          currentIndex: CorrectIndex,
          onTap: Ontap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.send),label: "Applies"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_sharp),label: "Profile"),
          ],
        )
    );
  }
}
