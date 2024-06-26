import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nutriapp/Helpers/api_helper.dart';
import 'package:nutriapp/Services/storage.dart';
import '../Models/progress.dart';

class ProgressProvider extends ChangeNotifier {
  Progress? _progress;

  Progress? get progress => _progress;

  final _baseUrl = dotenv.env['API_URL'];

  Future getProgress() async {
    String? token = await LocalStorage.getToken();
    await ApiClient(url: '/progress', token: token).fetch(
        beforeSend: () {}, onSuccess: (response) {
          try{

            _progress = Progress.fromJSON(response);

          }catch(e){
            print(e.toString());
          }
    }, onError: (error) {
      log(error);
    });
  }
}
