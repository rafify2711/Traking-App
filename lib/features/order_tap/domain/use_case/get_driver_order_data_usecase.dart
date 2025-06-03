import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/order_tap/data/model/driver_orders_response.dart';
import 'package:tracking_app/features/order_tap/domain/repository/driver_order_repo.dart';

@injectable
class GetDriverOrderDataUsecase {
  DriverOrderRepo driverOrderRepo;
  GetDriverOrderDataUsecase(this.driverOrderRepo);

  Future<ApiResult<DriverOrdersResponse>> invoke() async {
    return await driverOrderRepo.getDriverOrderData();
  }

}