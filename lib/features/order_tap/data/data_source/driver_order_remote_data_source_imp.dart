import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/order_tap/data/data_source/driver_order_remote_data_source.dart';
import 'package:tracking_app/features/order_tap/data/model/driver_orders_response.dart';

import '../../../../core/base/api_excuter.dart';

@Injectable(as: DriverOrderRemoteDataSource)
class DriverOrderRemoteDataSourceImp implements DriverOrderRemoteDataSource {
  final ApiService apiService;

  DriverOrderRemoteDataSourceImp({required this.apiService});

  @override
  Future<ApiResult<DriverOrdersResponse>> getDriverOrderData() async {
    print("asssssssssssss");

    return apiExecuter<DriverOrdersResponse>(() async {
      print("hhhhhhjjh");
      var response = await apiService.getAllDriverOrders();
      print("oooooooo");
print(response);
print(response.message);
print("object");
      return response;
    }, "DriverOrderRemoteDataSourceImpl");
  }
}