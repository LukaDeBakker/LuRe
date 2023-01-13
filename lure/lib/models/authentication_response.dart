import 'authentication_token.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthenticationResponseModel {
  final String result;
  final AuthenticationTokenResponse? token;

  const AuthenticationResponseModel(
      {required this.result, required this.token});

  factory AuthenticationResponseModel.fromJson(Map<String, dynamic> data) =>
      _$AuthenticationResponseModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
