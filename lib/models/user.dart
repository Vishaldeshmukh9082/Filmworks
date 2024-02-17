
import 'dart:convert';

class User{
  final String id;
  final String firstname;
  final String lastname;
  final String mobileno;
  final String email;
  final String gender;
  final String address;
  final String image;
  final String filmcard;
  final String password;
  final String token;
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.mobileno,
    required this.email,
    required this.gender,
    required this.address,
    required this.image,
    required this.filmcard,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "firstname": firstname,
      "lastname": lastname,
      "mobileno": mobileno,
      "email": email,
      "gender": gender,
      "address": address,
      "image": image,
      "filmcard": filmcard,
      "password": password,
      "token":token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      firstname: map["firstname"] ?? '',
      lastname: map["lastname"] ?? '',
      mobileno: map["mobileno"] ?? '',
      email: map["email"] ?? '',
      gender: map["gender"] ?? '',
      address: map["address"] ?? '',
      image: map["image"] ?? '',
      filmcard: map["filmcard"] ?? '',
      password: map["password"] ?? '',
      token: map["token"] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String str) => User.fromMap(json.decode(str));
}