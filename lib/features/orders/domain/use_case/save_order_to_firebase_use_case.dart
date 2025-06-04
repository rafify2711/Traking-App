import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/orders/data/model/orders_firebase_model.dart';
import 'package:tracking_app/features/orders/domain/repository/orders_repo.dart';

@injectable
class SaveOrderToFirebaseUseCase {
  final OrdersRepo _ordersRepo;

  SaveOrderToFirebaseUseCase(this._ordersRepo);

  Future<ApiResult<void>> invoke(OrdersFirebaseModel order) async {
    return await _ordersRepo.saveOrderToFirebase(order);
  }
}
