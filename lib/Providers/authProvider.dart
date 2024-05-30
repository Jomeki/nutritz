import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:nutriapp/Helpers/api_helper.dart';
import 'package:nutriapp/Services/storage.dart';
import '../Models/user.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  int responseTime = 0;
  var responseMessage;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
  }

  bool get isLoggedIn => _isLoggedIn;
  User? _registrationUser;

  set registrationUser(User? value) {
    _registrationUser = value;
  }

  User? get registrationUser => _registrationUser;

  final _baseUrl = dotenv.env['API_URL'];

  Future registrationHelper() async {
    await ApiClient(url: "/register", data: _registrationUser!.toRegistration())
        .edit(
            beforeSend: () {},
            onSuccess: (response) async {
              try {
                Map<String, dynamic> data = response;
                await LocalStorage.storeUserData(
                    user: User.fromJson(data['user']));
                await LocalStorage.storeToken(token: data['token']);
                _isLoggedIn = true;
                notifyListeners();
              } catch (e) {
                print(e.toString());
                _isLoggedIn = false;
                notifyListeners();
              }
            },
            onError: (error) {
              _isLoggedIn = false;
              notifyListeners();
            });
  }

  Future loginHelper({required User user}) async {
    await ApiClient(url: "/login", data: user.toLogin()).edit(
        beforeSend: () {},
        onSuccess: (response) async {
          try {
            Map<String, dynamic> data = response;
            await LocalStorage.storeUserData(user: User.fromJson(data['user']));
            await LocalStorage.storeToken(token: data['token']);
            isLoggedIn = true;
            notifyListeners();
          } catch (e) {
            print(e.toString());
            isLoggedIn = false;
            notifyListeners();
          }
        },
        onError: (error) {
          isLoggedIn = false;
          notifyListeners();
        });
    print(_isLoggedIn);
  }

  Future login({required User user}) async {
    Stopwatch watch = Stopwatch()..start();
    var response = await http.post(Uri.parse("$_baseUrl/login"),
        headers: {
          "Accept": "application/json"
        },
        body: user.toLogin());

    if (response.statusCode == 200) {
      var output = jsonDecode(response.body);
      try {
        Map<String, dynamic> data = output;
        await LocalStorage.storeUserData(user: User.fromJson(data['user']));
        await LocalStorage.storeToken(token: data['token']);
        isLoggedIn = true;
        notifyListeners();
      } catch (e) {
        responseTime = watch.elapsedMilliseconds;
        watch.stop();
        print(e.toString());
        isLoggedIn = false;
        notifyListeners();
      }
    }else{
      responseTime = watch.elapsedMilliseconds;
      watch.stop();
    }
  }

  Future registration() async {
    var response = await http.post(Uri.parse("$_baseUrl/register"),
        headers: {
          "Accept": "application/json"
        },
        body: _registrationUser!.toRegistration());
    log(response.body);
    if (response.statusCode == 200) {
      var output = jsonDecode(response.body);
      try {
        Map<String, dynamic> data = output;
        await LocalStorage.storeUserData(user: User.fromJson(data['user']));
        await LocalStorage.storeToken(token: data['token']);
        _isLoggedIn = true;
        notifyListeners();
      } catch (e) {
        print(e.toString());
        _isLoggedIn = false;
        notifyListeners();
      }
    }else{
      var decodedMessage = jsonDecode(response.body);
      responseMessage = decodedMessage['message'];
      _isLoggedIn = false;
      notifyListeners();
    }
  }
}
