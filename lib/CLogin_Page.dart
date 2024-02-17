import 'package:filmwork/CRegister_Page.dart';
import 'package:filmwork/Constants/constant_element.dart';
import 'package:filmwork/services/auth_service.dart';
import 'package:filmwork/services/client_service.dart';
import 'package:flutter/material.dart';

import 'Register_Page.dart';

class CLoginPage extends StatefulWidget {
  const CLoginPage({super.key});
  static const String routeName='/clogin-page';

  @override
  State<CLoginPage> createState() => _CLoginPageState();
}

class _CLoginPageState extends State<CLoginPage> {
  final SignInKey = GlobalKey<FormState>();
  final ClientService clientService = ClientService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void SignIn() {
    clientService.signInClient(
        context: context, email: email.text, password: password.text);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Ksecondarycolor,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            height: double.maxFinite,
            decoration: const BoxDecoration(
              color: Kbackgroundcolor,
            ),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "images/logo1.png",color: Colors.black,
                    scale: 2.6,
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Kprimarycolor,
                    ),
                  ),
                  const Text(
                    "Come and make your new team",
                    style: TextStyle(
                      color: KHeadtext,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    child: Form(
                        key: SignInKey,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: email,
                              style: const TextStyle(
                                fontSize: 20,
                                color: KFeildtext,
                              ),
                              validator: (val) {
                                if (val == null ||
                                    val.isEmpty ) {
                                  return "Enter registerd Email";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Kprimarycolor,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Kprimarycolor,
                                  ),
                                ),
                                label: Text("Enter Email"),
                                labelStyle: TextStyle(
                                  color: KHeadtext,
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  size: 35,
                                  color: Kprimarycolor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: password,
                              style: const TextStyle(
                                fontSize: 20,
                                color: KFeildtext,
                              ),
                              validator: (val) {
                                if (val == null ||
                                    val.isEmpty ||
                                    password.text.length < 8) {
                                  return "Enter valid password";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Kprimarycolor,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Kprimarycolor,
                                  ),
                                ),
                                label: Text("Enter password"),
                                labelStyle: TextStyle(
                                  color: KHeadtext,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 35,
                                  color: Kprimarycolor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sign Up",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Kprimarycolor,
                                      fontSize: 30,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (SignInKey.currentState!.validate()) {
                                        SignIn();
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
                            ),
                            const SizedBox(
                              height: 150,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, CRegisterPage.routeName);
                                    },
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w400,
                                        color: Kprimarycolor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Forget Password",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400,
                                      color: Kprimarycolor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
