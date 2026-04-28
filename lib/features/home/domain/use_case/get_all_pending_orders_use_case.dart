import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/domain/repo/home_repo.dart';

@injectable
class GetAllPendingOrdersUseCase {
  HomeRepo homeScreenRepo;
  GetAllPendingOrdersUseCase(this.homeScreenRepo);

  Future<ApiResult<PendingOrderResponse>> invoke(int page) async {
    return await homeScreenRepo.getAllPendingOrders(page);
  }
}
