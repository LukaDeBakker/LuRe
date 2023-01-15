import 'authentication_token.dart';

class AuthenticationResponseModel {
  final String result;
  final AuthenticationTokenResponse? token;

  const AuthenticationResponseModel({required this.result, this.token});

  factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationResponseModel(
      result: json['result'],
      token: json['token'] != null
          ? AuthenticationTokenResponse.fromJson(json['token'])
          : null,
    );
  }

  factory AuthenticationResponseModel.failedLogin(Map<String, dynamic> json) {
    return AuthenticationResponseModel(
      result: json['result'],
      token: null,
    );
  }
}
