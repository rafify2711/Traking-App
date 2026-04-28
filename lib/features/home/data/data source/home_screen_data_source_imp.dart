import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/flowery_driver_method_helper.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source.dart';
import 'package:tracking_app/features/home/data/models/order_model.dart';

import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/orders/data/model/orders_firebase_model.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl extends HomeDataSource {
final  ApiService _apiService;
final  FirebaseFirestore _firestore;
  HomeDataSourceImpl(this._apiService, this._firestore);

  @override
  Future<ApiResult<PendingOrderResponse>> getAllPendingOrders(int page) async {
    return await apiExecuter<PendingOrderResponse>(() async {
      var response = await _apiService.getAllPendingOrders(page);
      return response;
    }, 'HomeScreenDataSourceImp');
  }

  @override
  Future<OrdersFirebaseModel> getOrderDetailsFireBase() async {
    final doc =
        await _firestore
            .collection('orders')
            .doc("681bd6741433a666c8da31c7")
            .get();
    if (doc.exists) {
      final data = doc.data();
      var result = OrdersFirebaseModel.fromJson(data!);
      return result;
    } else {
      throw Exception('Order not found');
    }
  }

  @override
  Future<ApiResult<void>> acceptOrder({
    required AcceptOrderRequestEntity request,
  }) async {
    final driverData = FloweryDriverMethodHelper.driverData;
    final OrderModel orderModel = request.orderData;
    return apiExecuter<void>(() async {

      await _apiService.acceptOrder(
        orderId: request.orderId,
      );
      await _firestore
          .collection('orders')
          .doc(request.orderId)
          .set({
            ...orderModel.toJson(),
            "DriverName": "${driverData?.firstName} ${driverData?.lastName}",
            "DriverPhone": driverData?.phone,
            "DriverLatitude": driverData?.latitude,
            "DriverLongitude": driverData?.longitude,
            "OrderAcceptedAt": DateTime.now().toString(),
            "EstimatedArrival": DateTime.now()
                .add(const Duration(days: 3))
                .toString(),
            "PreparingYourOrderAt": "",
            "OutForDeliveryAt": "",
            "ArrivedAt": "",
            "DeliveredAt": "",
          });
    }, 'HomeScreenDataSourceImp');
    
  }
}

class AcceptOrderRequestEntity {
  
  final String orderId;
  final OrderModel orderData;

  const AcceptOrderRequestEntity({
    required this.orderId,
    required this.orderData,
  });
}


