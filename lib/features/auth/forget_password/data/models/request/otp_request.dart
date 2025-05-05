
import 'package:json_annotation/json_annotation.dart';
part 'otp_request.g.dart';

@JsonSerializable()
class OtpRequest {
  @JsonKey(name: 'resetCode')
  String? resetCode;

  OtpRequest({this.resetCode});

  factory OtpRequest.fromJson(Map<String, dynamic> json) => _$OtpRequestFromJson(json);

  static List<OtpRequest> fromList(List<Map<String, dynamic>> list) {
    return list.map(OtpRequest.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$OtpRequestToJson(this);
}