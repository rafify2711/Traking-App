import 'package:tracking_app/features/home/data/models/shipping_address_model.dart';
import 'package:tracking_app/features/home/data/models/store_response.dart';
import 'package:tracking_app/features/home/data/models/user_response.dart';
import 'order_item_response.dart';





class Order {
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
  final ShippingAddress? shippingAddress;

  Order({
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
    this.shippingAddress,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    final dynamic rawUser = json['user'];

    return Order(
      id: json['_id'] as String?,
      user: rawUser is Map<String, dynamic>
          ? User.fromJson(rawUser)
          : rawUser is String
          ? User(id: rawUser) // فقط id لو جالك كـ String
          : null,
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      paymentType: json['paymentType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      state: json['state'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      orderNumber: json['orderNumber'] as String?,
      store: json['store'] != null ? Store.fromJson(json['store']) : null,
      shippingAddress: json['shippingAddress'] != null
          ? ShippingAddress.fromJson(json['shippingAddress'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user?.toJson(), // هتفترض إن عندك toJson في User
      'orderItems': orderItems?.map((e) => e.toJson()).toList(),
      'totalPrice': totalPrice,
      'paymentType': paymentType,
      'isPaid': isPaid,
      'isDelivered': isDelivered,
      'state': state,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'orderNumber': orderNumber,
      'store': store?.toJson(),
      'shippingAddress': shippingAddress?.toJson(),
    };
  }
}


