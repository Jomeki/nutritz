import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Models/user.dart';

class LocalStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future storeUserData({required User user}) async {
    await _storage.write(key: 'user', value: json.encode(user.toJson()));
  }

  static Future<User?> getUserData() async {
    var user = await _storage.read(key: 'user');
    var userData = User.fromJson(json.decode(user ?? '[]'));
    return userData;
  }

  static Future storeToken({required String token}) async {
    await _storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    var token = await _storage.read(key: 'token');

    return token;
  }

  static Future storeProfileImage(File imageFile,
      {required String profile}) async {
    await _storage.write(key: 'profile', value: profile);
  }

  static Future<String?> getProfileImage() async {
    var profile = await _storage.read(key: 'profile');
    return profile;
  }

  static Future logout() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'user');
    await _storage.delete(key: 'profile');
  }

  static Future<bool> checkSession() async {
    var available = await _storage.containsKey(key: 'token');
    return available;
  }

  static Future storeOnboarding() async {
    await _storage.write(key: 'onboarding', value: 'true');
  }

  static Future<bool> getOnboarding() async {
    var onboarding = await _storage.read(key: 'onboarding') != null
        ? await _storage.read(key: 'onboarding') == 'true'
            ? true
            : false
        : false;
    return onboarding;
  }
}


