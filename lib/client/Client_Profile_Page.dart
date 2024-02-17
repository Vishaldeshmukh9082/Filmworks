import 'package:filmwork/providers/client_provider.dart';
import 'package:filmwork/services/client_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Component/Reusable_SubmitButton.dart';
import '../Constants/constant_element.dart';

class ClientProfilePage extends StatefulWidget {
  const ClientProfilePage({super.key});


  @override
  State<ClientProfilePage> createState() => _ClientProfilePageState();
}

class _ClientProfilePageState extends State<ClientProfilePage> {
  ClientService clientService=ClientService();
  @override
  Widget build(BuildContext context) {
    final client = Provider.of<ClientProvider>(context).client;
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
                "Information",
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
                client.clientname,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Ksecondarycolor,
                ),
              ),
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
                      "Personal Information",
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
                      client.email,
                      style: TextStyle(fontSize: 15, color: Color(0xFF605D5D)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      client.mobileno,
                      style: TextStyle(fontSize: 15, color: Color(0xFF605D5D)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      client.gender,
                      style: TextStyle(fontSize: 15, color: Color(0xFF605D5D)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      client.address,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF605D5D),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      client.roledescription,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF605D5D),
                        overflow: TextOverflow.fade,
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
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () {
                  clientService.logOut(context);
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
