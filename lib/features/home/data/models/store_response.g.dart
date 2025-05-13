// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
  name: json['name'] as String?,
  image: json['image'] as String?,
  address: json['address'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  latLong: json['latLong'] as String?,
);

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
  'name': instance.name,
  'image': instance.image,
  'address': instance.address,
  'phoneNumber': instance.phoneNumber,
  'latLong': instance.latLong,
};
