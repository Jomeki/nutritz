import 'dart:convert';
import 'package:http/http.dart' as http;

var baseUrl = '/api/v2'; // for production

final urlWithoutVersion = baseUrl.replaceFirst('/v2', '');



class ApiClient {
  final String url;
  final String? token;
  final Map<String, dynamic>? data;

  ApiClient({
    required this.url,
    required this.token,
    this.data,
  });

  Map<String, String> _getHeaders() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<void> fetch({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic data) onError,
  }) async {
    try {
      beforeSend();
      final response =
      await http.get(Uri.parse(baseUrl + url), headers: _getHeaders());
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // print("DATA_AGET:_$responseData");
        onSuccess(responseData);
      } else if (response.statusCode == 401) {
        //TODO:Navigate to login page
      } else {
        // print(response.body);
        onError('Failed to fetch data');
      }
    } catch (error) {
      onError(error.toString());
    }
  }

  Future<void> edit({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic data) onError,
  }) async {
    try {
      beforeSend();
      final response = await http.post(Uri.parse(baseUrl + url),
          headers: _getHeaders(), body: jsonEncode(data));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // print("DATA_APOST:_ $responseData");
        onSuccess(responseData);
      } else {
        onError('Failed to edit data');
      }
    } catch (error) {
      print(error);
      onError(error.toString());
    }
  }
}
