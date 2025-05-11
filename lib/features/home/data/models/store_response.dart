import 'package:json_annotation/json_annotation.dart';

part 'store_response.g.dart';

@JsonSerializable()
class Store {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  Store({this.name, this.image, this.address, this.phoneNumber, this.latLong});

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
