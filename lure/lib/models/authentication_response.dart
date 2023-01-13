import 'authentication_token.dart';

class AuthenticationResponseModel {
  final String result;
  final AuthenticationTokenResponse token;

  const AuthenticationResponseModel(
      {required this.result, required this.token});

  factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationResponseModel(
        result: json['result'], token: json['token']);
  }
}
