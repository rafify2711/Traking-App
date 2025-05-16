import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source.dart';
import 'package:tracking_app/features/home/data/models/order_details.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/domain/repo/home_screen_repo.dart';

@Injectable(as: HomeScreenRepo)
class HomeScreenRepoImp extends HomeScreenRepo {
  HomeScreenDataSource homeScreenDataSource;
  HomeScreenRepoImp(this.homeScreenDataSource);
  @override
  Future<ApiResult<OrderResponse>> getAllPendingOrders(int page) async {
    return await homeScreenDataSource.getAllPendingOrders(page);
  }

  @override
  Future<OrderDetails> getOrderDetailsFromFireBase( )async {
    try{
      return await  homeScreenDataSource.getOrderDetailsFireBase().then((value) {return value;});
    }catch(e){
      rethrow;
    }

  }
  @override
  Future<ApiResult<OrderResponse>> startOrder(String id) async {
    return await homeScreenDataSource.startOrder(id);
  }
}
