class AuthenticationTokenResponse {
  String session;
  String refresh;

  AuthenticationTokenResponse({required this.session, required this.refresh});

  factory AuthenticationTokenResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticationTokenResponse(
      session: json['session'],
      refresh: json['refresh'],
    );
  }
}
