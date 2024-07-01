import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nutriapp/Models/goalsplan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Helpers/api_helper.dart';
import '../Models/completedPlans.dart';
import '../Models/enrollement.dart';
import '../Services/storage.dart';

class GoalsPlanProvider extends ChangeNotifier {

  List<CompletedPlans> _completed=[];

  List<CompletedPlans> get completed=>_completed;

  List<GoalsPlan> _goalsplan = [];

  List<GoalsPlan> get goalsplan => _goalsplan;

  List<Enrollement> _enrollement = [];

  List<Enrollement> get enrollement => _enrollement;

  bool _isCompleted = false;

  bool get isCompleted => _isCompleted;

  final _baseUrl = dotenv.env['API_URL'];

  Future getEnrollements() async {
    String? token = await LocalStorage.getToken();

    await ApiClient(url: '/enrollment', token: token).fetch(
        beforeSend: () {},
        onSuccess: (response) {
          try {
            List temp = response;
            _enrollement = temp.map((e) => Enrollement.fromJSON(e)).toList();

            notifyListeners();
          } catch (e, stackTrace) {
            if (kDebugMode) {
              log(e.toString(), stackTrace: stackTrace, name: "EnrollmentInit");
            }
          }
        },
        onError: (error) {
          log(error.toString());
        });
  }

  // Future _filterPlans() async {
  //   // Create a set of ids from the first list for faster lookup
  //   Set<String> list1Ids =
  //       _enrollement.map((item) => item.plan_id.toString()).toSet();
  //   // Filter the second list to remove items with ids present in the first list
  //   List<GoalsPlan> filteredList2 = _goalsplan.where((item) {
  //     return !list1Ids.contains(item.plan_id.toString());
  //   }).toList();
  //   _goalsplan = filteredList2;
  //   notifyListeners();
  // }

  Future _filterCompletedPlans() async {
    // Create a set of ids from the first list for faster lookup
    Set<String> list1Ids =
    _completed.map((item) => item.plan_id.toString()).toSet();

    // Filter the second list to remove items with ids present in the first list
    List<Enrollement> filteredList2 = _enrollement.where((item) {
      return !list1Ids.contains(item.plan_id.toString());
    }).toList();
    _enrollement = filteredList2;
    Set<String> list2Ids =
    _enrollement.map((item) => item.plan_id.toString()).toSet();

    List<GoalsPlan> filteredList3 = _goalsplan.where((item) {
      return !list2Ids.contains(item.plan_id.toString());
    }).toList();
    _goalsplan = filteredList3;
    Set<String> list3Ids =
    _completed.map((item) => item.plan_id.toString()).toSet();
    List<GoalsPlan> filteredList4 = _goalsplan.where((item) {
      return !list3Ids.contains(item.plan_id.toString());
    }).toList();
    _goalsplan = filteredList4;
    notifyListeners();
  }

  Future initialize() async {
    try {
      await Future.wait([getEnrollements(), getPlans(), getCompletedPlans()]);
      await _filterCompletedPlans();
      // await _filterPlans();

    } catch (e) {
      try {
        await getPlans();
      } catch (e, stackTrace) {
        if (kDebugMode) {
          log(e.toString(), stackTrace: stackTrace, name: "PlansInit");
        }
      }
    }
  }

  Future getPlans() async {
    String? token = await LocalStorage.getToken();

    await ApiClient(url: '/goalplans', token: token).fetch(
        beforeSend: () {},
        onSuccess: (response) {
          try {
            List temp = response;
            _goalsplan = temp.map((e) => GoalsPlan.fromJSON(e)).toList();
            notifyListeners();
          } catch (e, stackTrace) {
            if (kDebugMode) {
              log(e.toString(), stackTrace: stackTrace, name: "PlansGetter");
            }
          }
        },
        onError: (error) {
          log(error);
        });
  }

  Future addEnrollment({required String plan_id}) async {
    String? token = await LocalStorage.getToken();
    try {
      http.Response response =
          await http.post(Uri.parse("$_baseUrl/enrollment"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }, body: {
        "plan_id": plan_id,
      });

      if ((response.statusCode == 200 || response.statusCode == 201)) {
        var output = json.decode(response.body);
        print(output);
        await initialize();

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

  Future completePlan(
      {required String plan_id, required String progress_category}) async {
    String? token = await LocalStorage.getToken();

    try {
      http.Response response = await http
          .post(Uri.parse("$_baseUrl/completeplan"), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }, body: {
        "plan_id": plan_id,
        "progress_category": progress_category
      });

      log(response.body);
      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        await initialize();
        _isCompleted = true;
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

  Future getCompletedPlans() async {
    String? token = await LocalStorage.getToken();

    try {
      http.Response response = await http.get(
        Uri.parse("$_baseUrl/completeplan"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      log(response.body.toString());
      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        var output = json.decode(response.body);
        List temp = output;
        _completed = temp.map((plan)=>CompletedPlans.fromJSON(plan)).toList();
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

  Future unenrollPlan({required String enrollment_id}) async {
    String? token = await LocalStorage.getToken();
    try {
      http.Response response = await http.delete(
        Uri.parse("$_baseUrl/enrollment/$enrollment_id"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if ((response.statusCode == 200 || response.statusCode == 201)) {
        await initialize();
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
