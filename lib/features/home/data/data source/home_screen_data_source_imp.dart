import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';

@Injectable(as: HomeScreenDataSource)
class HomeScreenDataSourceImp extends HomeScreenDataSource {
  ApiService apiService;

  HomeScreenDataSourceImp(this.apiService, );

  @override
  Future<ApiResult<OrderResponse>> getAllPendingOrders(int page) async {
    return await apiExecuter<OrderResponse>(() async {
      var response = await apiService.getAllPendingOrders(page);
      return response;
    }, 'HomeScreenDataSourceImp');
  }

  @override
  Future<ApiResult<OrderResponse>> startOrder(String id) async {
    return await apiExecuter<OrderResponse>(() async {
      var response = await apiService.startOrder(id);
      return response;
    }, 'HomeScreenDataSourceImp');
  }


}
