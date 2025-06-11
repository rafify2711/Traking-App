import 'package:tracking_app/core/base/api_result.dart';

import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/orders/data/model/orders_firebase_model.dart';

abstract class HomeScreenDataSource {
  Future<ApiResult<PendingOrderResponse>> getAllPendingOrders(int page);
  Future<OrdersFirebaseModel> getOrderDetailsFireBase();
  Future<ApiResult<PendingOrderResponse>> startOrder(String id);
}
