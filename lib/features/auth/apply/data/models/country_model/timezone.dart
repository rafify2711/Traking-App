import 'package:equatable/equatable.dart';

class Timezone extends Equatable {
  final String? zoneName;
  final int? gmtOffset;
  final String? gmtOffsetName;
  final String? abbreviation;
  final String? tzName;

  const Timezone({
    this.zoneName,
    this.gmtOffset,
    this.gmtOffsetName,
    this.abbreviation,
    this.tzName,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    zoneName: json['zoneName'] as String?,
    gmtOffset: json['gmtOffset'] as int?,
    gmtOffsetName: json['gmtOffsetName'] as String?,
    abbreviation: json['abbreviation'] as String?,
    tzName: json['tzName'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'zoneName': zoneName,
    'gmtOffset': gmtOffset,
    'gmtOffsetName': gmtOffsetName,
    'abbreviation': abbreviation,
    'tzName': tzName,
  };

  @override
  List<Object?> get props {
    return [zoneName, gmtOffset, gmtOffsetName, abbreviation, tzName];
  }
}
