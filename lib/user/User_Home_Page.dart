
import 'package:filmwork/loader.dart';
import 'package:filmwork/models/clientrequirement.dart';
import 'package:filmwork/services/clientrequirement_service.dart';
import 'package:flutter/material.dart';
import '../Constants/constant_element.dart';
import 'JobDescription_page.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});
  static const String routeName='/user-home-page';

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  List<ClientRequirement>? requirements;
   final ClientRequiremenetService clientRequiremenetService=ClientRequiremenetService();
  void initState(){
    super.initState();
    fetchAllClientRequirements();
  }
  fetchAllClientRequirements() async{
    requirements=await clientRequiremenetService.fetchAllClientRequirements(context);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return requirements==null ? Loader() : Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Jobs",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: requirements!.length,
        itemBuilder: (context,index) {
          final requirementdata=requirements![index];
          return Column(
              children: [

          SizedBox(
          height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,top:5),
            child: Container(
              padding: EdgeInsets.only(top:8),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Kprimarycolor),
            width: double.maxFinite,
            height: 120,
            child: Row(
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
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
            Text(
            requirementdata.joblocation,
            style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w300,
            color: KHeadtext,
            ),
            ),
            Text(
            requirementdata.jobtitle,
            style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            ),
            ),
            Text(
            requirementdata.tilldate,
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
            backgroundColor: MaterialStateColor.resolveWith(
            (states) => Ksecondarycolor),
            foregroundColor: MaterialStateColor.resolveWith(
            (states) => Color(0xFFFFFFFF))),
            onPressed: () {
            Navigator.pushNamed(context, JobDescription_Page.routeName,arguments: requirementdata);
            },
            child: const Text("View"),
            ),
            ),
            ),
            const SizedBox(
            width: 20,
            ),
            ],
            ),
            ),
          )
          ,
          ],
          );
        }
      ),
    );
  }
}


