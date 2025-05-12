import 'package:equatable/equatable.dart';

import 'driver.dart';

class ApplyResponse extends Equatable {
  final String? message;
  final Driver? driver;
  final String? token;

  const ApplyResponse({this.message, this.driver, this.token});

  factory ApplyResponse.fromJson(Map<String, dynamic> json) => ApplyResponse(
    message: json['message'] as String?,
    driver:
        json['driver'] == null
            ? null
            : Driver.fromJson(json['driver'] as Map<String, dynamic>),
    token: json['token'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'driver': driver?.toJson(),
    'token': token,
  };

  @override
  List<Object?> get props => [message, driver, token];
}
