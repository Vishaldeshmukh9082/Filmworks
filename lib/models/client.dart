
import 'dart:convert';

class Client{
  final String id;
  final String clientname;
  final String mobileno;
  final String email;
  final String gender;
  final String address;
  final String roledescription;
  final String image;
  final String filmcard;
  final String password;
  final String token;
  Client({
    required this.id,
    required this.clientname,
    required this.mobileno,
    required this.email,
    required this.gender,
    required this.address,
    required this.roledescription,
    required this.image,
    required this.filmcard,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "clientname": clientname,
      "mobileno": mobileno,
      "email": email,
      "gender": gender,
      "address": address,
      "roledescription": roledescription,
      "image": image,
      "filmcard": filmcard,
      "password": password,
      "token":token,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['_id'] ?? '',
      clientname: map["clientname"] ?? '',
      mobileno: map["mobileno"] ?? '',
      email: map["email"] ?? '',
      gender: map["gender"] ?? '',
      address: map["address"] ?? '',
      roledescription: map["roledescription"] ?? '',
      image: map["image"] ?? '',
      filmcard: map["filmcard"] ?? '',
      password: map["password"] ?? '',
      token: map["token"] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String str) => Client.fromMap(json.decode(str));
}