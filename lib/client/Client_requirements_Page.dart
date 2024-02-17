
import 'package:filmwork/client/Sub%20Pages/Client_View_Applications_page.dart';
import 'package:filmwork/services/clientrequirement_service.dart';
import 'package:flutter/material.dart';
import '../Constants/constant_element.dart';
import '../loader.dart';
import '../models/clientrequirement.dart';

class ClientRequirementPage extends StatefulWidget {
  const ClientRequirementPage({super.key});
  static const String routeName = '/client-Requirement-page';


  @override
  State<ClientRequirementPage> createState() => _ClientRequirementPageState();
}

class _ClientRequirementPageState extends State<ClientRequirementPage> {
  List<ClientRequirement>? requirements;
  final ClientRequiremenetService clientRequiremenetService=ClientRequiremenetService();

  @override
  void initState() {
    super.initState();
    fetchAllClientRequirements();
  }

  fetchAllClientRequirements() async {
    requirements =
        await clientRequiremenetService.fetchAllRequirements(context);
    setState(() {});
  }

  void deleteClientRequirement(ClientRequirement clientRequirement, int index) {
    clientRequiremenetService.deleteClientRequirement(
      context: context,
      clientRequirement: clientRequirement,
      onSuccess: () {
        requirements!.removeAt(index);
        setState(() {});
      },
    );
  }

  Widget build(BuildContext context) {
    return requirements == null
        ? Loader()
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              foregroundColor: Colors.black,
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text(
                "Manage Requirement",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: ListView.builder(
                itemCount: requirements!.length,
                itemBuilder: (context, index) {
                  final requirementdata = requirements![index];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8,right: 8),
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Kprimarycolor,
                                width: 2,
                              )),
                          width: double.maxFinite,
                          height: 180,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Expanded(
                                    flex: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: CircleAvatar(
                                        radius: 40,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          requirementdata.jobtitle,
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
                                          children:[
                                            Icon(Icons.location_on),
                                            Text(
                                              requirementdata.joblocation,
                                              style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                         Text(
                                          requirementdata.tilldate,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, ClientViewApplicationPage.routeName,arguments: requirementdata);
                                        },
                                        child: Center(
                                          child: Container(
                                            width: 200,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Ksecondarycolor,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "View Applications",
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
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) {
                                          //   return const ClientViewApplicationPage();
                                          // }));
                                          deleteClientRequirement(requirementdata, index);
                                        },
                                        child: Center(
                                          child: Container(
                                            width: 200,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Ksecondarycolor,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Delete",
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //   );
                          // },
                        ),
                      ),
                    ],
                  );
                }),
          );
  }
}
