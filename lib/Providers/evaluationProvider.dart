import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nutriapp/Models/evaluations.dart';
import 'package:http/http.dart' as http;
import 'package:nutriapp/Models/user.dart';
import 'package:nutriapp/Services/storage.dart';

class EvaluationProvider extends ChangeNotifier {
  Evaluations? _evaluation;

  Evaluations? get evaluation => _evaluation;

  set evaluation(Evaluations? value) {
    _evaluation = value;
  }

  final _baseUrl = dotenv.env['API_URL'];

  bool _isEvaluated = false;

  bool get isEvaluated => _isEvaluated;

  Future<void> initialize() async {
    try {
      User? user = await LocalStorage.getUserData();
      if (user!.is_evaluated.toString() == '1') {
        _isEvaluated = true;
        notifyListeners();
      } else {
        _isEvaluated = false;
        notifyListeners();
      }
    } catch (e) {
      _isEvaluated = false;
      notifyListeners();
    }
  }

  Future addEvaluation() async {
    _isEvaluated = false;
    String? token = await LocalStorage.getToken();
    try {
      http.Response response = await http.post(
          Uri.parse("$_baseUrl/evaluation"),
          headers: {"Accept": "application/json",
          "Authorization":"Bearer $token"},
          body: _evaluation!.toJson());
      if ((response.statusCode == 200 || response.statusCode == 201)) {
        var output = json.decode(response.body);
        _isEvaluated = true;
        await LocalStorage.storeUserData(user: User.fromJson(output['user']));
        notifyListeners();
      } else {
        _isEvaluated = false;
        notifyListeners();
      }
    } catch (e) {
      _isEvaluated = false;
      notifyListeners();
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
