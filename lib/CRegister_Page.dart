
import 'dart:io';

import 'package:filmwork/services/client_service.dart';
import 'package:flutter/material.dart';

import 'Constants/constant_element.dart';
import 'Constants/utlis.dart';

class CRegisterPage extends StatefulWidget {
  const CRegisterPage({super.key});
  static const String routeName='/cregister-page';

  @override
  State<CRegisterPage> createState() => _CRegisterPageState();
}

class _CRegisterPageState extends State<CRegisterPage> {
  final SignUpKey = GlobalKey<FormState>();
  final ClientService clientService=ClientService();

  TextEditingController clientname = TextEditingController();
  TextEditingController mobileno = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController roledescription = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();

  var _gender = "male";
  List<File> images = [];


  @override
  void SignUp() {
    clientService.signUpClient(
      context: context,
      clientname: clientname.text,
      mobileno: mobileno.text,
      gender: _gender,
      address: address.text,
      roledescription: roledescription.text,
      password: password.text,
      image: 'q',
      filmcard: 'a',
      email: email.text,
    );
  }
  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kbackgroundcolor,
        foregroundColor: Kprimarycolor,
        elevation: 0,
      ),
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Kbackgroundcolor,
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 0,
              ),
              NewWidget(),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Form(
                    key: SignUpKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: clientname,
                          style: const TextStyle(
                            fontSize: 20,
                            color: KFeildtext,
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter your name";
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
                            label: Text(" Name"),
                            labelStyle: TextStyle(
                              color: KHeadtext,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 35,
                              color: Kprimarycolor,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 20,
                              color: Kprimarycolor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "male",
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value.toString();
                                  });
                                }),
                            Text("Male"),
                            Radio(
                                value: "female",
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value.toString();
                                  });
                                }),
                            Text("Female"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          style: const TextStyle(
                            fontSize: 20,
                            color: KFeildtext,
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter valid Email";
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
                            label: Text("Enter Email Id"),
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
                              return "Enter your valid 10 digit number";
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
                            label: Text("Enter MobileNo"),
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
                          controller: address,
                          style: const TextStyle(
                            fontSize: 20,
                            color: KFeildtext,
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter your Address";
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
                            label: Text("Enter Address"),
                            labelStyle: TextStyle(
                              color: KHeadtext,
                            ),
                            prefixIcon: Icon(
                              Icons.home_work_outlined,
                              size: 35,
                              color: Kprimarycolor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          maxLines: 5,
                          controller: roledescription,
                          style: const TextStyle(
                            fontSize: 20,
                            color: KFeildtext,
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter your Profession";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Kprimarycolor,
                              ),

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Kprimarycolor,
                                width: 2,
                              ),

                            ),
                            label: Text("Profession Detail"),
                            labelStyle: TextStyle(
                              color: KHeadtext,
                            ),
                            prefixIcon: Icon(
                              Icons.pending_actions_outlined,
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
                              return "minimum 8 digit ";
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
                            label: Text("Enter Password"),
                            labelStyle: TextStyle(
                              color: KHeadtext,
                            ),
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
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
                                  if (SignUpKey.currentState!.validate()) {
                                    SignUp();
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
                          height: 40,
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
