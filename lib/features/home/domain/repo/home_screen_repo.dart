import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/home/data/models/order_details.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart'
    show OrderResponse;

abstract class HomeScreenRepo {
  Future<ApiResult<OrderResponse>> getAllPendingOrders(int page);
  Future<OrderDetails> getOrderDetailsFromFireBase();

  Future<ApiResult<OrderResponse>> startOrder(String id);
}
