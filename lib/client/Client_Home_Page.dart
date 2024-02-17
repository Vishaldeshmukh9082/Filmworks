import 'package:filmwork/client/Client_Profile_Page.dart';
import 'package:filmwork/models/clientrequirement.dart';
import 'package:filmwork/services/clientrequirement_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Component/Reusable_SubmitButton.dart';
import '../Constants/constant_element.dart';
import '../providers/client_provider.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  ClientRequiremenetService clientRequiremenetService =
      ClientRequiremenetService();
  final SubmitKey = GlobalKey<FormState>();

  DateTime _lastdate = DateTime.now();
  DateTime _startdate = DateTime.now();
  DateTime _enddate = DateTime.now();
  var _selected = 'Hairstylist';
  var _gender = "male";
  var sd;
  var ld;
  var ed;

  TextEditingController discription = TextEditingController();
  TextEditingController vacancies = TextEditingController();
  TextEditingController payment = TextEditingController();
  TextEditingController location = TextEditingController();
  @override


  Widget build(BuildContext context) {

    final client = Provider.of<ClientProvider>(context).client;
    void Submit() {
      clientRequiremenetService.Submit(
          context: context,
          clientname: client.clientname,
          clientdetail: client.roledescription,
          clientemail: client.email,
          jobtitle: _selected,
          jobdesciption: discription.text,
          startdate: sd,
          enddate: ed,
          tilldate: ld,
          gender: _gender,
          quantity: vacancies.text,
          payment: payment.text,
          joblocation: location.text);
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Add Requirement",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Form(
                  key: SubmitKey,
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Job Catigory",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DropdownButtonFormField(
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                            value: _selected,
                            items: const [
                              DropdownMenuItem(
                                value: 'Hairstylist',
                                child: Text('Hairstylist'),
                              ),
                              DropdownMenuItem(
                                value: 'Film crew',
                                child: Text('Film crew'),
                              ),
                              DropdownMenuItem(
                                value: ' Production assistant',
                                child: Text(' Production assistant'),
                              ),
                              DropdownMenuItem(
                                value: ' Camera operator',
                                child: Text(' Camera operator'),
                              ),
                              DropdownMenuItem(
                                value: ' Animator',
                                child: Text(' Animator'),
                              ),
                              DropdownMenuItem(
                                value: 'Video editor',
                                child: Text('Video editor'),
                              ),
                              DropdownMenuItem(
                                value: ' Sound technician',
                                child: Text(' Sound technician'),
                              ),
                              DropdownMenuItem(
                                value: 'Lighting technician',
                                child: Text('Lighting technician'),
                              ),
                              DropdownMenuItem(
                                value: 'Fashion designer',
                                child: Text('Fashion designer'),
                              ),
                              DropdownMenuItem(
                                value: 'Director',
                                child: Text('Director'),
                              ),
                              DropdownMenuItem(
                                value: 'Executive producer',
                                child: Text('Executive producer'),
                              ),
                              DropdownMenuItem(
                                value: 'Makeup artist',
                                child: Text('Makeup artist'),
                              ),
                              DropdownMenuItem(
                                value: 'Cinematographer',
                                child: Text('Cinematographer'),
                              ),
                              DropdownMenuItem(
                                value: 'Producer',
                                child: Text('Producer'),
                              ),
                              DropdownMenuItem(
                                value: 'Choreographer',
                                child: Text('Choreographer'),
                              ),
                              DropdownMenuItem(
                                value: 'Art director',
                                child: Text('Art director'),
                              ),
                              DropdownMenuItem(
                                value: 'Spot boy',
                                child: Text('Spot boy'),
                              ),
                              DropdownMenuItem(
                                value: 'Driver',
                                child: Text('Driver'),
                              ),
                              DropdownMenuItem(
                                value: 'Setting Department',
                                child: Text('Setting Department'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selected = value as String;
                              });
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Discription",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLines: 4,
                          controller: discription,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter Discription about work";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Kprimarycolor,
                                  width: 2,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Last Date",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final result = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2025),
                            );
                            if (result != null) {
                              setState(() {
                                _lastdate = result;
                                ld="${_lastdate.day}-${_lastdate.month}-${_lastdate.year}";
                              });
                            }
                          },
                          child: DateFeild(date: _lastdate),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          " Work Start Date",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final result = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2025),
                            );
                            if (result != null) {
                              setState(() {
                                _startdate = result;
                                sd="${_startdate.day}-${_startdate.month}-${_startdate.year}";
                              });
                            }
                          },
                          child: DateFeild(date: _startdate),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Work End Date",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final result = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2025),
                            );
                            if (result != null) {
                              setState(() {
                                _enddate = result;
                                ed="${_enddate.day}-${_enddate.month}-${_enddate.year}";
                              });
                            }
                          },

                          child: DateFeild(date: _enddate),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
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
                            Radio(
                                value: "both",
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value.toString();
                                  });
                                }),
                            Text("Both"),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Vacancies",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: vacancies,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter number of peoples";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text("1,2,etc."),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Kprimarycolor,
                                  width: 2,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Payment(/per day in Rs)",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: payment,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter Payment";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Kprimarycolor,
                                  width: 2,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Work Location",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: location,
                          maxLines: 2,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter location of work";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Kprimarycolor,
                                  width: 2,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (SubmitKey.currentState!.validate()) {
                              Submit();
                            }
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
                                  "Submit",
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
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
