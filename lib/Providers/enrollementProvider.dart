import 'dart:convert';
import 'dart:developer';
import 'package:nutriapp/Models/enrollement.dart';
import 'package:nutriapp/Services/storage.dart';
import '../Helpers/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// class EnrollementProvider extends ChangeNotifier{
//
//   List<Enrollement> _enrollement =  [];
//   List<Enrollement> get enrollement => _enrollement;
//
//   final _baseUrl = dotenv.env['API_URL'];
//
//   Future getEnrollements() async {
//
//     String? token = await LocalStorage.getToken();
//
//     await ApiClient(url: '/enrollment',token: token).fetch(
//         beforeSend: (){},
//         onSuccess: (response) {
//       try{
//         log(response.toString());
//         List temp = response;
//         _enrollement = temp.map((e) => Enrollement.fromJSON(e)).toList();
//         notifyListeners();
//
//       }catch(e){
//         print(e.toString());
//       }
//     }, onError: (error){
//           log(error.toString());
//     });
//   }
//
// }