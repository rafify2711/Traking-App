import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/orders/data/model/orders_firebase_model.dart';
import 'package:tracking_app/features/orders/domain/repository/orders_repo.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';

@Injectable(as: OrdersRepo)
class OrdersRepoImpl implements OrdersRepo {
  final FirebaseFirestore _firestore;

  OrdersRepoImpl(this._firestore);

  @override
  Future<ApiResult<void>> saveOrderToFirebase(OrdersFirebaseModel order) async {
    try {
      await _firestore.collection('orders').doc(order.order.id).set(order.toJson());
      return const ApiSuccess(data: null);
    } catch (e) {
      return ApiError(
        message: e.toString(),

      );
    }
  }
}
