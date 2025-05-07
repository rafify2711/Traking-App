import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'timezone.dart';

class CountryModel {
  final String? isoCode;
  final String? name;
  final String? phoneCode;
  final String? flag;
  final String? currency;
  final String? latitude;
  final String? longitude;
  final List<Timezone>? timezones;

  const CountryModel({
    this.isoCode,
    this.name,
    this.phoneCode,
    this.flag,
    this.currency,
    this.latitude,
    this.longitude,
    this.timezones,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    isoCode: json['isoCode'] as String?,
    name: json['name'] as String?,
    phoneCode: json['phoneCode'] as String?,
    flag: json['flag'] as String?,
    currency: json['currency'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    timezones:
        (json['timezones'] as List<dynamic>?)
            ?.map((e) => Timezone.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  static List<CountryModel> parseCountry(List<dynamic> jsonData) {
    return jsonData.map((e) => CountryModel.fromJson(e)).toList();
  }

  static Future<List<CountryModel>> getCountryFromAssets(
    BuildContext context,
  ) async {
    final jsonString = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/countries/country.json");
    final data = jsonDecode(jsonString);
    return parseCountry(data);
  }

  static Future<int> getEgyptIndex(BuildContext context) async {
    List<CountryModel> countryList = await getCountryFromAssets(context);
    return countryList.indexWhere((e) => e.name == "Egypt");
  }
}
