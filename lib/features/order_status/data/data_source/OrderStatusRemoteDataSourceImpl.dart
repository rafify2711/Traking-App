import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/utils/services/secure_sotrage_service.dart';
import '../../../../core/utils/enums/order_status_enum.dart';
import 'OrderStatusRemoteDataSource.dart';

@Injectable(as: OrderStatusRemoteDataSource)
class OrderRemoteDataSourceImpl implements OrderStatusRemoteDataSource {
  final FirebaseFirestore firestore;
  final ApiService apiService;
  final SecureStorageService secureStorageService;
  OrderRemoteDataSourceImpl(
    this.firestore,
    this.apiService,
    this.secureStorageService,
  );

  @override
  Future<void> updateOrderStatusToFireBase(
    String orderId,
    OrderStatus status,
  ) async {
    await firestore.collection('orders').doc(orderId).update({
      'order.state': status.name,
      'order.updatedAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<String> updateOrderStatusApi(String orderId, String status) async {
    final body = {'state': status};
    String? token = await secureStorageService.readSecureData('jwt_token');

    print("Token :$token");
    final response = await apiService.updateOrderStatus(
      orderId,
      body,
      token ?? "",
    );
    return response;
  }

  @override
  Future<OrderStatus> getOrderStatus(String orderId) async {
    final doc = await firestore.collection('orders').doc(orderId).get();

    if (!doc.exists) {
      return OrderStatus.pending; // Default if document doesn't exist
    }

    final data = doc.data();
    final statusString = data?['order']?['state'] as String?;

    if (statusString == null) {
      return OrderStatus.pending; // Default if status is null
    }

    // Convert string to enum
    try {
      return OrderStatus.values.firstWhere(
        (status) => status.name == statusString,
        orElse: () => OrderStatus.pending,
      );
    } catch (e) {
      return OrderStatus.pending; // Default if conversion fails
    }
  }
}
