import 'dart:convert';

import 'package:lure/models/authentication_response.dart';
import 'package:http/http.dart' as http;

class MangaDexapi {
  final String apiUrl = 'https://api.mangadex.org';

  Future<AuthenticationResponseModel> login(
      String email, String password) async {
    http.Response response = await http.get(Uri.parse("${apiUrl}auth/login"));

    if (response.statusCode == 200) {
      return AuthenticationResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to login");
    }
  }
}
