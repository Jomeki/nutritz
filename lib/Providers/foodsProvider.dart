import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:nutriapp/Models/foods.dart';

import '../Helpers/api_helper.dart';

class FoodsProvider extends ChangeNotifier {
  List<Foods> _food = [];

  List<Foods> get foods => _food;

  Future getFoods() async {
    await ApiClient(url: "/foods", token: "").fetch(
        beforeSend: () {},
        onSuccess: (response) {
          try {
            List temp = response;
            _food = temp.map((e) => Foods.fromJson(e)).toList();

            notifyListeners();
          } catch (e) {
            print(e.toString());
          }
        },
        onError: (error) {});
  }
}
