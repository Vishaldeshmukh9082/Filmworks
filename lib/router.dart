import 'package:filmwork/CLogin_Page.dart';
import 'package:filmwork/CRegister_Page.dart';
import 'package:filmwork/Client_Navbar_Page.dart';
import 'package:filmwork/Input_Page.dart';
import 'package:filmwork/Login_Page.dart';
import 'package:filmwork/Register_Page.dart';
import 'package:filmwork/User_Navbar_Page.dart';
import 'package:filmwork/client/Client_requirements_Page.dart';
import 'package:filmwork/user/JobDescription_page.dart';
import 'package:filmwork/user/User_Applies_Page.dart';
import 'package:filmwork/user/User_Home_Page.dart';
import 'package:filmwork/user/User_Profile_Page.dart';
import 'package:flutter/material.dart';

import 'client/Sub Pages/Client_View_Applications_page.dart';
import 'models/clientrequirement.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case InputPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const InputPage(),
      );
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginPage(),
      );
    case CLoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CLoginPage(),
      );
    case RegisterPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterPage(),
      );
    case CRegisterPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CRegisterPage(),
      );
    case UserNavbarPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UserNavbarPage(),
      );
    case ClientNavbarPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ClientNavbarPage(),
      );
    case JobDescription_Page.routeName:
      var jobdetails=routeSettings.arguments as ClientRequirement;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => JobDescription_Page(
            requirement:jobdetails,
        ),
      );
    case UserAppliesPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UserAppliesPage(),
      );

    case ClientViewApplicationPage.routeName:
      var jobdetails=routeSettings.arguments as ClientRequirement;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  ClientViewApplicationPage(
          requirement:jobdetails,
        ),
      );


    case UserProfilePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UserProfilePage(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
