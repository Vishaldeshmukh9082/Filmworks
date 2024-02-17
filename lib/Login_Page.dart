
import 'package:filmwork/Register_Page.dart';
import 'package:filmwork/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'Constants/constant_element.dart';

class LoginPage extends StatefulWidget {

  static const String routeName='/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController mobileno = TextEditingController();
TextEditingController password = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  final SignInKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  @override
  void SignIn() {
    authService.signInUser(
        context: context, mobileno: mobileno.text, password: password.text);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
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
                  NewWidget(),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Kprimarycolor,
                    ),
                  ),
                  const Text(
                    "Find your Jobs",
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
                              keyboardType: TextInputType.number,
                              controller: mobileno,
                              style: const TextStyle(
                                fontSize: 20,
                                color: KFeildtext,
                              ),
                              validator: (val) {
                                if (val == null ||
                                    val.isEmpty ||
                                    mobileno.text.length != 10) {
                                  return "Enter your valid number";
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
                                label: Text("Enter Mobile"),
                                labelStyle: TextStyle(
                                  color: KHeadtext,
                                ),
                                prefixIcon: Icon(
                                  Icons.phone,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, RegisterPage.routeName);
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


