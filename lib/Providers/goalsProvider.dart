import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../Helpers/api_helper.dart';
import '../Models/goals.dart';

class GoalsProvider extends ChangeNotifier {
  List<Goals> _goals = [];

  List<Goals> get goals => _goals;

  Future getGoals() async {
   await  ApiClient(url: "/goals", token: "").fetch(
        beforeSend: () {},
        onSuccess: (response) {
          try {
            List temp = response;
            _goals = temp.map((e) => Goals.fromJson(e)).toList();

            notifyListeners();
          } catch (e) {
            print(e.toString());
          }
        },
        onError: (error) {});
  }
}
