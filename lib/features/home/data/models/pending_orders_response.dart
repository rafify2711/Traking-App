import 'package:tracking_app/features/home/data/models/order_response.dart';

import '../../../auth/apply/data/models/get_all_vehicles_response/metadata.dart';

class PendingOrderResponse {
  final String? message;
  final Metadata? metadata;
  final List<OrderResponse>? orders;
  final OrderResponse? order;

  PendingOrderResponse({this.message, this.metadata, this.orders, this.order});

  factory PendingOrderResponse.fromJson(Map<String, dynamic> json) {
    final rawOrders = json['orders'];

    List<OrderResponse>? ordersList;
    OrderResponse? singleOrder;

    if (rawOrders is List) {
      ordersList = rawOrders.map((e) => OrderResponse.fromJson(e)).toList();
    } else if (rawOrders is Map<String, dynamic>) {
      singleOrder = OrderResponse.fromJson(rawOrders);
    }

    return PendingOrderResponse(
      message: json['message'] as String?,
      metadata:
          json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null,
      orders: ordersList,
      order: singleOrder,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'metadata': metadata?.toJson(),
      'orders':
          orders != null
              ? orders!.map((e) => e.toJson()).toList()
              : order?.toJson(),
    };
  }
}
