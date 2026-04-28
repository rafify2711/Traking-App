import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source_imp.dart';

import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart'
    show PendingOrderResponse;

abstract class HomeRepo {
  Future<ApiResult<PendingOrderResponse>> getAllPendingOrders(int page);
  Future<OrderResponse> getOrderDetailsFromFireBase();

  Future<ApiResult<void>> acceptOrder({required AcceptOrderRequestEntity request});
}
