

import 'dart:convert';
class ClientRequirement{
  final String id;
  final String clientname;
  final String clientdetail;
  final String clientemail;
  final String jobtitle;
  final String jobdesciption;
  final String startdate;
  final String enddate;
  final String tilldate;
  final String gender;
  final String quantity;
  final String payment;
  final String joblocation;
  // final String token;

  ClientRequirement({
    required this.id,
    required this.clientname,
    required this.clientdetail,
    required this.clientemail,
    required this.jobtitle,
    required this.jobdesciption,
    required this.startdate,
    required this.enddate,
    required this.tilldate,
    required this.gender,
    required this.quantity,
    required this.payment,
    required this.joblocation,
    // required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "clientname": clientname,
      "clientdetail": clientdetail,
      "clientemail": clientemail,
      "jobtitle": jobtitle,
      "jobdesciption": jobdesciption,
      "startdate": startdate,
      "enddate": enddate,
      "tilldate": tilldate,
      "gender": gender,
      "quantity": quantity,
      "payment": payment,
      "joblocation": joblocation,
      // "token":token,
    };
  }

  factory ClientRequirement.fromMap(Map<String, dynamic> map) {
    return ClientRequirement(
      id: map['_id'] ?? '',
      clientname: map["clientname"] ?? '',
      clientdetail: map["clientdetail"] ?? '',
      clientemail: map["clientemail"] ?? '',
      jobtitle: map["jobtitle"] ?? '',
      jobdesciption: map["jobdesciption"] ?? '',
      startdate: map["startdate"] ?? '',
      enddate: map["enddate"] ?? '',
      tilldate: map["tilldate"] ?? '',
      gender: map["gender"] ?? '',
      quantity: map["quantity"] ?? '',
      payment: map["payment"] ?? '',
      joblocation: map["joblocation"] ?? '',
      // token: map["token"] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientRequirement.fromJson(String str) => ClientRequirement.fromMap(json.decode(str));
}