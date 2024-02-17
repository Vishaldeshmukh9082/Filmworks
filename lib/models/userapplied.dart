import 'dart:convert';

class UserApplied {
  final String id;
  final String jobid;
  final String firstname;
  final String lastname;
  final String mobileno;
  final String email;
  final String gender;
  final String address;
  final String image;
  final String filmcard;
  // final String token;

  UserApplied({
    required this.id,
    required this.jobid,
    required this.firstname,
    required this.lastname,
    required this.mobileno,
    required this.email,
    required this.gender,
    required this.address,
    required this.image,
    required this.filmcard,
    // required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "jobid": jobid,
      "firstname": firstname,
      "lastname": lastname,
      "mobileno": mobileno,
      "email": email,
      "gender": gender,
      "address": address,
      "image": image,
      "filmcard": filmcard,
      // "token": token,
    };
  }

  factory UserApplied.fromMap(Map<String, dynamic> map) {
    return UserApplied(
      id: map['_id'] ?? '',
      jobid: map['jobid'] ?? '',
      firstname: map["firstname"] ?? '',
      lastname: map["lastname"] ?? '',
      mobileno: map["mobileno"] ?? '',
      email: map["email"] ?? '',
      gender: map["gender"] ?? '',
      address: map["address"] ?? '',
      image: map["image"] ?? '',
      filmcard: map["filmcard"] ?? '',
      // token: map["token"] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserApplied.fromJson(String ua) => UserApplied.fromMap(json.decode(ua));
}