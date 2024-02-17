import 'package:filmwork/Constants/constant_element.dart';
import 'package:filmwork/providers/user_provider.dart';
import 'package:filmwork/services/auth_service.dart';
import 'package:filmwork/services/userapplied_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Component/Reusable_SubmitButton.dart';
import '../models/clientrequirement.dart';

class JobDescription_Page extends StatefulWidget {
  final ClientRequirement requirement;
  const JobDescription_Page({super.key, required this.requirement});
  static const String routeName = '/job-description-page';

  @override
  State<JobDescription_Page> createState() => _JobDescription_PageState();
}

class _JobDescription_PageState extends State<JobDescription_Page> {
  final AuthService authService = AuthService();
  final UserAppliedService userAppliedService = UserAppliedService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    void Submit() {
      userAppliedService.Submit(
          context: context,
          jobid: widget.requirement.id,
          firstname: user.firstname,
          lastname: user.lastname,
          mobileno: user.mobileno,
          email: user.email,
          gender: user.gender,
          address: user.address,
          image: user.image,
          filmcard: user.filmcard);
    }

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
              top: 30,
              child: SafeArea(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Ksecondarycolor, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset(
                        "images/logo.png",
                        scale: 4,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.requirement.joblocation,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          widget.requirement.jobtitle,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.requirement.tilldate,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
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
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        widget.requirement.jobtitle,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.requirement.jobdesciption,
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFF605D5D)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Vaccency:",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.requirement.quantity,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF605D5D)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Start Date:",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.requirement.startdate,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF605D5D)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "End Date:",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.requirement.enddate}",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF605D5D)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Gender:",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.requirement.gender,
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF605D5D)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Payment:",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.requirement.payment,
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF605D5D)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Submit();
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
                                "Apply",
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
                      SizedBox(
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

class DateFeild extends StatelessWidget {
  const DateFeild({
    super.key,
    required DateTime date,
  }) : _date = date;

  final DateTime _date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 60,
      padding: const EdgeInsets.only(left: 20, top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Kprimarycolor,
          width: 2,
        ),
      ),
      child: Text(
        DateFormat.yMMMMd().format(_date),
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}
