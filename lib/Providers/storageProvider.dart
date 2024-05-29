


import 'package:flutter/material.dart';
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
      notifyListeners();
    } catch (e) {
      _user = null;
      notifyListeners();
    }

    notifyListeners();
  }
}