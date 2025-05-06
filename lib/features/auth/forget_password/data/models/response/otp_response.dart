import 'package:json_annotation/json_annotation.dart';
part 'otp_response.g.dart';

@JsonSerializable()
class OtpResponse {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'error')
  String? error;
  OtpResponse({this.status, this.error});

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);

  static List<OtpResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(OtpResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$OtpResponseToJson(this);
}
