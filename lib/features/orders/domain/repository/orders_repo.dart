import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/orders/data/model/orders_firebase_model.dart';

abstract class OrdersRepo {
  Future<ApiResult<void>> saveOrderToFirebase(OrdersFirebaseModel order);
}
