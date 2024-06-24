import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:nutriapp/Helpers/api_helper.dart';
import 'package:nutriapp/Models/evaluations.dart';
import 'package:nutriapp/Services/storage.dart';
import '../Models/user.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  int responseTime = 0;
  var responseMessage;

  bool _otpSent = false;

  bool get otpSent => _otpSent;
  late String _otp;

  String get otp => _otp;

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

  Future login({required User user}) async {
    //Stopwatch
    Stopwatch watch = Stopwatch()..start();

    //Contacting API for response
    var response = await http.post(Uri.parse("$_baseUrl/login"),
        headers: {"Accept": "application/json"}, body: user.toLogin());
    if (response.statusCode == 200) {
      var output = jsonDecode(response.body);
      try {
        Map<String, dynamic> data = output;
        await LocalStorage.storeUserData(user: User.fromJson(data));
        await LocalStorage.storeToken(token: data['token']);
        isLoggedIn = true;
        notifyListeners();
      } catch (e, stackTrace) {
        responseTime = watch.elapsedMilliseconds;
        watch.stop();
        print(e.toString());
        log(stackTrace.toString());
        isLoggedIn = false;
        notifyListeners();
      }
    } else {
      responseTime = watch.elapsedMilliseconds;
      watch.stop();
    }
  }

  Future registration() async {
    log(_registrationUser!.toRegistration().toString());
    var response = await http.post(Uri.parse("$_baseUrl/register"),
        headers: {"Accept": "application/json"},
        body: _registrationUser!.toRegistration());
    if (response.statusCode == 200) {
      var output = jsonDecode(response.body);
      try {
        Map<String, dynamic> data = output;
        await LocalStorage.storeUserData(user: User.fromJson(data));
        await LocalStorage.storeToken(token: data['token']);
        _isLoggedIn = true;
        notifyListeners();
      } catch (e, stackTrace) {
        print(e.toString());
        log(stackTrace.toString());
        _isLoggedIn = false;
        notifyListeners();
      }
    } else {
      var decodedMessage = jsonDecode(response.body);
      responseMessage = decodedMessage['message'];
      _isLoggedIn = false;
      notifyListeners();
    }
  }

  Future requestOTP(
      {required String phoneNumber, required bool registration}) async {
    var response = await http.post(Uri.parse("$_baseUrl/otp"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json'
        },
        body: json.encode(
            {"phone_number": phoneNumber, "otp_type": registration ? 2 : 1}));

    log(response.body);

    if (response.statusCode == 200) {
      var output = jsonDecode(response.body);
      try {
        _otp = output['otp'].toString();
        _otpSent = true;

        notifyListeners();
      } catch (e) {
        print(e.toString());

        _otpSent = false;
        notifyListeners();
      }
    } else if (response.statusCode == 400) {
      var output = jsonDecode(response.body);
      responseMessage = output['message'];
      _otpSent = false;
      notifyListeners();
    } else {
      _otpSent = false;
      notifyListeners();
    }
  }

  Future updateUser({required User user}) async {

    var response = await http.post(Uri.parse("$_baseUrl/user/update"),
        headers: {"Accept": "application/json"}, body: user.toUpdateProfile());
    if (response.statusCode == 200) {
      var output = jsonDecode(response.body);
      try {
        Map<String, dynamic> data = output;

        isLoggedIn = true;
        notifyListeners();
      } catch (e, stackTrace) {
        print(e.toString());
        log(stackTrace.toString());
        isLoggedIn = false;
        notifyListeners();
      }
    } else {}
  }

  Future updateEvaluation({required Evaluations evaluation}) async {

    var response = await http.post(Uri.parse("$_baseUrl/user/update"),
        headers: {"Accept": "application/json"}, body:evaluation.toJson());
    if (response.statusCode == 200) {
      var output = jsonDecode(response.body);
      try {
        Map<String, dynamic> data = output;
        await LocalStorage.storeUserData(user: User.fromJson(data));
        isLoggedIn = true;
        notifyListeners();
      } catch (e, stackTrace) {
        print(e.toString());
        log(stackTrace.toString());
        isLoggedIn = false;
        notifyListeners();
      }
    } else {}
  }
}
