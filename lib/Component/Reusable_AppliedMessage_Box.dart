
import 'package:filmwork/Constants/constant_element.dart';
import 'package:flutter/material.dart';

class Applied_Message_Box extends StatelessWidget {
  const Applied_Message_Box({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Kprimarycolor,
          width: 2,
        )
      ),
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
                  padding: const EdgeInsets.only(left: 20,top: 10),
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
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text(
                      "Spot Boy",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Ksecondarycolor,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: const [
                        Icon(Icons.location_on),
                        Text(
                          "hinjawadi,pune",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Till date:12/1/2023",
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
          const SizedBox(
            height: 20,
          ),
          const Text("Applied",style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),),
        ],
      ),
    );
  }
}