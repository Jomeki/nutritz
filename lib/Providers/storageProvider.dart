


import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Models/user.dart';
import '../Services/storage.dart';

class LocalStorageProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;
  final _storage = const FlutterSecureStorage();

  Future<void> initialize() async {
    try {
      _user = await LocalStorage.getUserData();
      Map<String,dynamic> phoneNumber = await parse(_user!.phone_number.toString(),region: "TZ");
      _user!.phone_number=phoneNumber['international'];
      notifyListeners();
    } catch (e) {
      _user = null;
      notifyListeners();
    }

    notifyListeners();
  }
}