
import 'package:flutter/material.dart';

import '../../Component/Reusable_SubmitButton.dart';
import '../../Constants/constant_element.dart';

class WorkersDetails extends StatefulWidget {
  const WorkersDetails({super.key});

  @override
  State<WorkersDetails> createState() => _WorkersDetailsState();
}

class _WorkersDetailsState extends State<WorkersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
          color: Kprimarycolor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: SafeArea(
                child: Column(
                  children: [
                    Text(
                      "Worker Details",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 150,
                      child:Image.asset("images/artistcard.jpeg")
                    ),
                  ],
                )
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 35,right: 35),
                width: MediaQuery.of(context).size.width,
                height: 600,
                decoration: const BoxDecoration(
                  color: Kprimarycolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Ashitosh Ahire",
                        style: TextStyle(fontSize: 18, color: Color(0xFF605D5D)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Contact No:",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "1234456782",
                        style: TextStyle(fontSize: 18, color: Color(0xFF605D5D)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Gender:",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Male",
                        style: TextStyle(fontSize: 18, color: Color(0xFF605D5D)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Address:",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "shivnagr,devad,new panvel 410-206",
                        style: TextStyle(fontSize: 18, color: Color(0xFF605D5D),
                          overflow: TextOverflow.fade,),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Email:",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "ashitoshahire12@gmail.com",
                        style: TextStyle(fontSize: 16, color: Color(0xFF605D5D)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(child: SubmitButtom(label: "Confirm")),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: SubmitButtom(label: "Cancelled")),
                        ],
                      ),

                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
