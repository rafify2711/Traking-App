import 'package:tracking_app/core/base/api_result.dart';

import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart'
    show PendingOrderResponse;
import 'package:tracking_app/features/orders/data/model/orders_firebase_model.dart';

abstract class HomeScreenRepo {
  Future<ApiResult<PendingOrderResponse>> getAllPendingOrders(int page);
  Future<OrderResponse> getOrderDetailsFromFireBase();

  Future<ApiResult<PendingOrderResponse>> startOrder(String id);
}
