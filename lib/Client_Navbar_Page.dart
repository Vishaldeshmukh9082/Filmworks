
import 'package:filmwork/client/Client_Home_Page.dart';
import 'package:filmwork/client/Client_Profile_Page.dart';
import 'package:filmwork/client/Client_requirements_Page.dart';
import 'package:flutter/material.dart';

import 'Constants/constant_element.dart';

class ClientNavbarPage extends StatefulWidget {
  const ClientNavbarPage({super.key});
  static const String routeName='/client-navbar-page';

  @override
  State<ClientNavbarPage> createState() => _ClientNavbarPageState();
}

class _ClientNavbarPageState extends State<ClientNavbarPage> {
  List Pages=[
    ClientHomePage(),
    ClientRequirementPage(),
    ClientProfilePage(),
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
            BottomNavigationBarItem(icon: Icon(Icons.edit),label: "Order"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_sharp),label: "Profile"),
          ],
        )
    );
  }
}
