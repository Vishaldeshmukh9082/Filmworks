import 'package:filmwork/CLogin_Page.dart';
import 'package:filmwork/Login_Page.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
  static const String routeName='/input-page';
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 600,
                  height: 200,
                  child: Image.asset(
                    "images/logo1.png",
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(

                  decoration: BoxDecoration(

                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),],
                  ),
                  child: GestureDetector(
                    onTap: (){
                     Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    child: Stack(
                      children: [
                        Image.asset("images/worker1.jpg"),
                        Text(
                          "Get Hire",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFFF6D822),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  width: 500,
                  height: 250,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),],
                  ),
                  width: 500,
                  height: 250,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, CLoginPage.routeName);
                    },
                    child: Stack(
                      children: [
                        Image.asset(
                          "images/film2.jpg",width: 500,
                        ),
                        Text(
                          "Want to Hire",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF003873),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
