

import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/order_status/domain/repo/order_repo.dart';

import '../../../../core/utils/enums/order_status_enum.dart';

@injectable
class UpdateOrderStatusUseCase{

  final OrderRepository repository;

  UpdateOrderStatusUseCase(this.repository);

  Future<void> callToFirebase(String orderId,OrderStatus newStatus){

    return repository.updateOrderStatusToFireBase(orderId, newStatus);

  }
  Future<void> callToApi(String orderId,String newStatus){

    return repository.updateOrderStatusToApi(orderId, newStatus);

  }


}