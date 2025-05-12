import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart'
    show OrderResponse;

abstract class HomeScreenRepo {
  Future<ApiResult<OrderResponse>> getAllPendingOrders();
  Future<ApiResult<OrderResponse>> startOrder(String id);
}
