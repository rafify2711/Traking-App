
import 'package:tracking_app/core/base/api_result.dart';

import '../../../../core/utils/enums/order_status_enum.dart';

abstract class OrderRepository {
  Future<void> updateOrderStatusToFireBase(String orderId, OrderStatus status);

  Future<ApiResult<String>> updateOrderStatusToApi(String orderId, String status);
}
