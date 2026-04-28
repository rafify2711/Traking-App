// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: json['_id'] as String?,
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
  orderItems:
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPrice: (json['totalPrice'] as num?)?.toInt(),
  shippingAddress:
      json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
            json['shippingAddress'] as Map<String, dynamic>,
          ),
  paymentType: json['paymentType'] as String?,
  isPaid: json['isPaid'] as bool?,
  paidAt: json['paidAt'] as String?,
  isDelivered: json['isDelivered'] as bool?,
  state: json['state'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  orderNumber: json['orderNumber'] as String?,
  v: (json['__v'] as num?)?.toInt(),
  store:
      json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
  driverName: json['DriverName'] as String?,
  driverPhone: json['DriverPhone'] as String?,
  driverLatitude: json['DriverLatitude'] as num?,
  driverLongitude: json['DriverLongitude'] as num?,
  orderAcceptedAt: json['OrderAcceptedAt'] as String?,
  estimatedArrival: json['EstimatedArrival'] as String?,
  preparingYourOrderAt: json['PreparingYourOrderAt'] as String?,
  outForDeliveryAt: json['OutForDeliveryAt'] as String?,
  arrivedAt: json['ArrivedAt'] as String?,
  deliveredAt: json['DeliveredAt'] as String?,
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user?.toJson(),
      'orderItems': instance.orderItems?.map((e) => e.toJson()).toList(),
      'totalPrice': instance.totalPrice,
      'shippingAddress': instance.shippingAddress?.toJson(),
      'paymentType': instance.paymentType,
      'isPaid': instance.isPaid,
      'paidAt': instance.paidAt,
      'isDelivered': instance.isDelivered,
      'state': instance.state,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'orderNumber': instance.orderNumber,
      '__v': instance.v,
      'store': instance.store?.toJson(),
      'DriverName': instance.driverName,
      'DriverPhone': instance.driverPhone,
      'DriverLatitude': instance.driverLatitude,
      'DriverLongitude': instance.driverLongitude,
      'OrderAcceptedAt': instance.orderAcceptedAt,
      'EstimatedArrival': instance.estimatedArrival,
      'PreparingYourOrderAt': instance.preparingYourOrderAt,
      'OutForDeliveryAt': instance.outForDeliveryAt,
      'ArrivedAt': instance.arrivedAt,
      'DeliveredAt': instance.deliveredAt,
    };
