import 'package:filmwork/models/client.dart';
import 'package:flutter/material.dart';

class ClientProvider extends ChangeNotifier {
  Client _client = Client(
      id: '',
      clientname: '',
      mobileno: '',
      email: '',
      gender: '',
      address: '',
      roledescription: '',
      image: '',
      filmcard: '',
      password: '',
      token: '');
  Client get client => _client;
  void setClient(String client) {
    _client = Client.fromJson(client);
    notifyListeners();
  }
}
