import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nutriapp/Models/category.dart';
import 'package:nutriapp/Models/plans.dart';
import '../Helpers/api_helper.dart';
import 'package:http/http.dart' as http;

import '../Services/storage.dart';

class PlansProvider extends ChangeNotifier{

  List<Plans> _plans = [];

  List<Plans> get plans => _plans;

  List<PlanCategory> _categories = [];

  List<PlanCategory> get categories => _categories;
  final _baseUrl = dotenv.env['API_URL'];

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


  Future addEnrollment({required String plan_id}) async {

    String? token = await LocalStorage.getToken();
    try {
      http.Response response = await http.post(
          Uri.parse("$_baseUrl/enrollment"),
          headers: {"Accept": "application/json",
          "Authorization": "Bearer $token"},
          body: {
            "plan_id":plan_id,
          });

      print(response.body);
      if ((response.statusCode == 200 || response.statusCode == 201)) {
        var output = json.decode(response.body);
        print(output);


        notifyListeners();
      } else {

        notifyListeners();
      }
    } catch (e) {

      notifyListeners();
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }


}