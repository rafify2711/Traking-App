
import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/home/data/models/order_item_response.dart';
import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/data/models/store_response.dart';
import 'package:tracking_app/features/home/data/models/user_response.dart';
part 'order_model.g.dart';
@JsonSerializable(explicitToJson: true)
final class OrderModel {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "orderItems")
  final List<OrderItem>? orderItems;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "shippingAddress")
  final ShippingAddress? shippingAddress;
  @JsonKey(name: "paymentType")
  final String? paymentType;
  @JsonKey(name: "isPaid")
  final bool? isPaid;
  @JsonKey(name: "paidAt")
  final String? paidAt;
  @JsonKey(name: "isDelivered")
  final bool? isDelivered;
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "store")
  final Store? store;
  @JsonKey(name: "DriverName")
  final String? driverName;
  @JsonKey(name: "DriverPhone")
  final String? driverPhone;
  @JsonKey(name: "DriverLatitude")
  final num? driverLatitude;
  @JsonKey(name: "DriverLongitude")
  final num? driverLongitude;
  @JsonKey(name: "OrderAcceptedAt")
  final String? orderAcceptedAt;
  @JsonKey(name: "EstimatedArrival")
  final String? estimatedArrival;
  @JsonKey(name: "PreparingYourOrderAt")
  final String? preparingYourOrderAt;
  @JsonKey(name: "OutForDeliveryAt")
  final String? outForDeliveryAt;
  @JsonKey(name: "ArrivedAt")
  final String? arrivedAt;
  @JsonKey(name: "DeliveredAt")
  final String? deliveredAt;

  OrderModel({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.shippingAddress,
    this.paymentType,
    this.isPaid,
    this.paidAt,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
    this.store,
    this.driverName,
    this.driverPhone,
    this.driverLatitude,
    this.driverLongitude,
    this.orderAcceptedAt,
    this.estimatedArrival,
    this.preparingYourOrderAt,
    this.outForDeliveryAt,
    this.arrivedAt,
    this.deliveredAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(this);
  }

}
