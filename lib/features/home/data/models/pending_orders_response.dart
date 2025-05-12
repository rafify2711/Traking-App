import '../../../apply/data/models/get_all_vehicles_response/metadata.dart';
import 'order_response.dart';

class OrderResponse {
  final String? message;
  final Metadata? metadata;
  final List<Order>? orders;
  final Order? order;

  OrderResponse({
    this.message,
    this.metadata,
    this.orders,
    this.order,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    final rawOrders = json['orders'];

    List<Order>? ordersList;
    Order? singleOrder;

    if (rawOrders is List) {
      ordersList = rawOrders.map((e) => Order.fromJson(e)).toList();
    } else if (rawOrders is Map<String, dynamic>) {
      singleOrder = Order.fromJson(rawOrders);
    }

    return OrderResponse(
      message: json['message'] as String?,
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'])
          : null,
      orders: ordersList,
      order: singleOrder,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'metadata': metadata?.toJson(),
      'orders': orders != null
          ? orders!.map((e) => e.toJson()).toList()
          : order?.toJson(),
    };
  }

}
