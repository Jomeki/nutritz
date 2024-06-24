import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nutriapp/Models/goalsfood.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

import '../Helpers/api_helper.dart';
import '../Services/storage.dart';

class GoalsFoodProvider extends ChangeNotifier {

  List<GoalsFood> _goalsfood = [];
  List<GoalsFood> get goalsfood => _goalsfood;

  final _baseUrl = dotenv.env['API_URL'];

  Future getGoalsFood() async {

    String? token = await LocalStorage.getToken();

    await ApiClient(url: '/goalfoods',token: token).fetch(
        beforeSend: (){},
        onSuccess: (response) {
          try{

            List temp = response;
            _goalsfood = temp.map((e) => GoalsFood.fromJSON(e)).toList();
            notifyListeners();

          }catch(e,stackTrace){
            print(e.toString());
            log(stackTrace.toString());
          }
        }, onError: (error){
          log(error);
    });
  }

}