import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/order_tap/data/model/driver_orders_response.dart';
import 'package:tracking_app/features/orders/data/model/orders_firebase_model.dart';

abstract class DriverOrderRepo {
  Future<ApiResult<DriverOrdersResponse>> getDriverOrderData();
}
