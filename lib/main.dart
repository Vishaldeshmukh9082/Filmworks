
import 'package:filmwork/Client_Navbar_Page.dart';
import 'package:filmwork/Input_Page.dart';
import 'package:filmwork/providers/client_provider.dart';
import 'package:filmwork/providers/user_provider.dart';
import 'package:filmwork/router.dart';
import 'package:filmwork/services/auth_service.dart';
import 'package:filmwork/services/client_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'User_Navbar_Page.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context)=>ClientProvider())
      ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  final ClientService clientService=ClientService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
    clientService.getClientData(context);
    setState(() {
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings)=>generateRoute(settings),
        home:
        // Provider.of<ClientProvider>(context).client.token.isNotEmpty
      //   Provider.of<UserProvider>(context).user.token.isNotEmpty
      //   ? const UserNavbarPage()
      //   //  ?const ClientNavbarPage()
      //   // :
      // :
        const InputPage()

    );
  }
}
