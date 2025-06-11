import 'dart:convert';

import 'package:collection/collection.dart';

import 'driver.dart';

class UserResponse {
  String? message;
  Driver? driver;

  UserResponse({this.message, this.driver});

  @override
  String toString() => 'UserResponse(message: $message, driver: $driver)';

  factory UserResponse.fromMap(Map<String, dynamic> data) => UserResponse(
    message: data['message'] as String?,
    driver:
        data['driver'] == null
            ? null
            : Driver.fromMap(data['driver'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toMap() => {
    'message': message,
    'driver': driver?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserResponse].
  factory UserResponse.fromJson(String data) {
    return UserResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  UserResponse copyWith({String? message, Driver? driver}) {
    return UserResponse(
      message: message ?? this.message,
      driver: driver ?? this.driver,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => message.hashCode ^ driver.hashCode;
}
