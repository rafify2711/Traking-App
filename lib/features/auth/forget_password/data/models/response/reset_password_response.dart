import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'error')
  String? error;

  ResetPasswordResponse({this.message, this.token, this.error});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);

  static List<ResetPasswordResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(ResetPasswordResponse.fromJson).toList();
  }
}
