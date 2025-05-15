import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/home/data/models/order_item_response.dart';
import 'package:tracking_app/features/home/data/models/store_response.dart';
import 'package:tracking_app/features/home/data/models/user_response.dart';

part 'order_details.g.dart';

@JsonSerializable()
class OrderDetails {
  @JsonKey(name: '_id')
  final String? id;
  final User? user;
  final List<OrderItem>? orderItems;
  final double? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final Store? store;

  OrderDetails({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.store,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) => _$OrderDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}
