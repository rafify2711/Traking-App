

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import '../../../../core/utils/enums/order_status_enum.dart';
import 'OrderStatusRemoteDataSource.dart';


@Injectable(as: OrderStatusRemoteDataSource)
class OrderRemoteDataSourceImpl implements OrderStatusRemoteDataSource {
  final FirebaseFirestore firestore;
  final ApiService apiService;
  OrderRemoteDataSourceImpl(this.firestore,this.apiService);

  @override
  Future<void> updateOrderStatusToFireBase(String orderId, OrderStatus status) async {
    await firestore.collection('orders').doc(orderId).update({
      'order.state':status.name,
      'order.updatedAt':FieldValue.serverTimestamp()
    });
  }

  @override
  Future<String> updateOrderStatusApi(String orderId, String status)async {
    final body = {
      'state':status
    };
    final response = await apiService.updateOrderStatus(
        orderId,
        body,
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkcml2ZXIiOiI2ODIyMWIzNzE0MzNhNjY2YzhkYjk4ZTgiLCJpYXQiOjE3NDcwNzU0NDV9.y2X5EtR7pNJ6gxoqTAhluJ8zvWvLEf-1aFnNH0Z4mLQ"
    );
    return response;
  }

}
