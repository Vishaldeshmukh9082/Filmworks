import 'package:filmwork/Constants/constant_element.dart';
import 'package:flutter/material.dart';

import '../user/JobDescription_page.dart';

class ReusableMessageBox extends StatelessWidget {
  const ReusableMessageBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Kprimarycolor),
      width: double.maxFinite,
      height: 100,
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
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "hinjawadi,pune",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    color: KHeadtext,
                  ),
                ),
                Text(
                  "Spot Boy",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Till date:12/1/2023",
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
                  Navigator.pushNamed(context, JobDescription_Page.routeName,);
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
    );
  }
}
