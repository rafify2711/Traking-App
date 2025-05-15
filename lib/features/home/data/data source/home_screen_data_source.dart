import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/driver.dart';
import 'package:tracking_app/features/home/data/models/order_details.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';

abstract class HomeScreenDataSource {
  Future<ApiResult<OrderResponse>> getAllPendingOrders(int page);
  Future<OrderDetails> getOrderDetailsFireBase();
}
