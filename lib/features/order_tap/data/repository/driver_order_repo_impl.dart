import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/order_tap/data/data_source/driver_order_remote_data_source.dart';
import 'package:tracking_app/features/order_tap/data/model/driver_orders_response.dart';
import 'package:tracking_app/features/order_tap/domain/repository/driver_order_repo.dart';

@Injectable(as: DriverOrderRepo)
class DriverOrderRepoImpl implements DriverOrderRepo {
  DriverOrderRemoteDataSource driverOrderRemoteDataSource;
  DriverOrderRepoImpl(this.driverOrderRemoteDataSource);

  @override
  Future<ApiResult<DriverOrdersResponse>> getDriverOrderData() async {
    return await driverOrderRemoteDataSource.getDriverOrderData();

  }
}
