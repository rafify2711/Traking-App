// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null
              ? null
              : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      orders:
          (json['orders'] as List<dynamic>?)
              ?.map((e) => OrderDetails.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'orders': instance.orders,
    };
