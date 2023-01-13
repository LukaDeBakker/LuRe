part 'user.g.dart';

class AuthenticationTokenResponse {
  String session;
  String refresh;

  AuthenticationTokenResponse(this.session, this.refresh);

  factory AuthenticationTokenResponse.fromJson(Map<String, dynamic> data) =>
      _$AuthenticationTokenResponseFromJson(data);

  Map<String, dynamic> toJson() => _$AuthenticationTokenResponseToJson(this);
}
