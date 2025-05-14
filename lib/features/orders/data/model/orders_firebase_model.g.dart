// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersFirebaseModel _$OrdersFirebaseModelFromJson(Map<String, dynamic> json) =>
    OrdersFirebaseModel(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      driver: Driver.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrdersFirebaseModelToJson(
  OrdersFirebaseModel instance,
) => <String, dynamic>{'order': instance.order, 'driver': instance.driver};
