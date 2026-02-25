import 'package:json_annotation/json_annotation.dart';

part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final String? message;
  final bool? status;
  final int? code;
  final UserData? data;

  LoginResponseBody({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}

@JsonSerializable()
class UserData {
  final String? token;
  @JsonKey(name: 'username')
  final String? userName;

  UserData({required this.token, required this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
