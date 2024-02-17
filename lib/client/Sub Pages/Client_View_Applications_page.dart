import 'package:filmwork/client/Sub%20Pages/Workers_Details.dart';
import 'package:filmwork/loader.dart';
import 'package:filmwork/models/clientrequirement.dart';
import 'package:filmwork/models/userapplied.dart';
import 'package:filmwork/services/userapplied_service.dart';
import 'package:flutter/material.dart';

import '../../Constants/constant_element.dart';

class ClientViewApplicationPage extends StatefulWidget {
  final ClientRequirement requirement;
  const ClientViewApplicationPage({
    super.key,
    required this.requirement,
  });
  static const String routeName = '/client-view-Application-page';

  @override
  State<ClientViewApplicationPage> createState() =>
      _ClientViewApplicationPageState();
}

class _ClientViewApplicationPageState extends State<ClientViewApplicationPage> {
  List<UserApplied>? applications;

  final UserAppliedService userAppliedService = UserAppliedService();
  void initsatate() {
    super.initState();
    fetchAllUserApplication();
    print(applications);
  }

  fetchAllUserApplication() async {
    applications = await userAppliedService.fetchAllUserApplication(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return applications==Null?Loader():Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("back"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Kprimarycolor,
                        width: 2,
                      )),
                  width: double.maxFinite,
                  height: 140,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,
                                child: Image.asset(
                                  "images/logo.png",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  widget.requirement.jobtitle,
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Ksecondarycolor,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Icon(Icons.location_on),
                                    Text(
                                      widget.requirement.joblocation,
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Till Date:${widget.requirement.tilldate}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Applyed By",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Kprimarycolor),
                  width: double.maxFinite,
                  height: 100,
                  child:ListView.builder(
                      itemCount: applications!.length,
                      itemBuilder: (context, index) {
                        final appliers = applications![index];
                        if(appliers!=Null) {
                        return
                          Row(
                            children: [
                              Expanded(
                                flex: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child: Image.asset(
                                      "images/logo.png",
                                      scale: 6,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      appliers.firstname + " " +
                                          appliers.lastname,
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      appliers.mobileno,
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                        color: KHeadtext,
                                      ),
                                    ),
                                    Text(
                                      appliers.gender,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: KHeadtext,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 0,
                                child: Container(
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateColor.resolveWith(
                                                (states) => Ksecondarycolor),
                                        foregroundColor:
                                        MaterialStateColor.resolveWith(
                                                (states) => Color(0xFFFFFFFF))),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return const WorkersDetails();
                                          }));
                                    },
                                    child: const Text("View"),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          );
                        }else{
                          return Text("No One Apply");
                        }
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
