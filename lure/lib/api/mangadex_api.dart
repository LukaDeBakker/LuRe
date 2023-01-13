import 'dart:convert';

import 'package:lure/models/authentication_response.dart';
import 'package:http/http.dart' as http;

class MangaDexapi {
  final String apiUrl = 'https://api.mangadex.org/';

  Future<AuthenticationResponseModel> login(
      String email, String password) async {
    http.Response response = await http.post(
      Uri.parse("${apiUrl}auth/login"),
      body: jsonEncode(
        <String, String>{'username': email, 'password': password},
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return AuthenticationResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return AuthenticationResponseModel.failedLogin(jsonDecode(response.body));
    }
  }
}
