
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/order_status/data/data_source/OrderStatusRemoteDataSource.dart';
import 'package:tracking_app/core/utils/enums/order_status_enum.dart';
import 'package:tracking_app/features/order_status/domain/repo/order_repo.dart';

@Injectable(as: OrderRepository)
class OrderRepoImpl implements OrderRepository{

  final OrderStatusRemoteDataSource orderStatusRemoteDataSource;

  OrderRepoImpl(this.orderStatusRemoteDataSource);

  @override
  Future<void> updateOrderStatusToFireBase(String orderId, OrderStatus status) {

return  orderStatusRemoteDataSource.updateOrderStatusToFireBase(orderId, status);

  }

  @override
  Future<ApiResult<String>> updateOrderStatusToApi(String orderId, String status) async{

    return await apiExecuter<String>(() async{
    return await orderStatusRemoteDataSource.updateOrderStatusApi(orderId, status);

    }, "Error in the OrderStatusRepoUpdateImpl");

  }

  @override
  Future<OrderStatus> getOrderStatus(String orderId) async {
    return await orderStatusRemoteDataSource.getOrderStatus(orderId);
  }
  
} 