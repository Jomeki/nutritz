import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:nutriapp/Models/category.dart';
import 'package:nutriapp/Models/plans.dart';

import '../Helpers/api_helper.dart';

class PlansProvider extends ChangeNotifier{

  List<Plans> _plans = [];

  List<Plans> get plans => _plans;

  List<PlanCategory> _categories = [];

  List<PlanCategory> get categories => _categories;

  Future getPlans() async {
   await ApiClient(url: "/plans", token: "").fetch(
        beforeSend: () {},
        onSuccess: (response) {
          try {
            List temp = response;
            _plans = temp.map((e) => Plans.fromJson(e)).toList();
            log(response.toString());

            notifyListeners();
          } catch (e) {
            print(e.toString());
          }
        },
        onError: (error) {});
  }


  Future getCategories() async {
   await ApiClient(url: "/category", token: "").fetch(
        beforeSend: () {},
        onSuccess: (response) {
          try {
            List temp = response;
            _categories = temp.map((e) => PlanCategory.fromJson(e)).toList();
            log(response.toString());

            notifyListeners();
          } catch (e) {
            print(e.toString());
          }
        },
        onError: (error) {});
  }


}