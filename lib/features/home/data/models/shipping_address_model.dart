import 'package:json_annotation/json_annotation.dart';
part "shipping_address_model.g.dart";

@JsonSerializable()
class ShippingAddress {
  final String? street;
  final String? city;
  final String? phone;
  final String? lat;
  final String? long;
  ShippingAddress({this.street, this.city, this.phone, this.lat, this.long});

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
