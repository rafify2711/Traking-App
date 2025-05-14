

import 'package:tracking_app/core/utils/enums/order_status_enum.dart';

abstract class OrderStatusRemoteDataSource{

  Future<void> updateOrderStatusToFireBase(String orderId,OrderStatus status);

  Future<String> updateOrderStatusApi(String orderId,String status);
  }
