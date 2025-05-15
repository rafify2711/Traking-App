// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
  id: json['_id'] as String?,
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
  orderItems:
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPrice: (json['totalPrice'] as num?)?.toDouble(),
  paymentType: json['paymentType'] as String?,
  isPaid: json['isPaid'] as bool?,
  isDelivered: json['isDelivered'] as bool?,
  state: json['state'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  orderNumber: json['orderNumber'] as String?,
  store:
      json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'orderItems': instance.orderItems,
      'totalPrice': instance.totalPrice,
      'paymentType': instance.paymentType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      'state': instance.state,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'orderNumber': instance.orderNumber,
      'store': instance.store,
    };
