import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source.dart';

import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/orders/data/model/orders_firebase_model.dart';

@Injectable(as: HomeScreenDataSource)
class HomeScreenDataSourceImp extends HomeScreenDataSource {
  ApiService apiService;
  FirebaseFirestore firestore;

  HomeScreenDataSourceImp(this.apiService, this.firestore);

  @override
  Future<ApiResult<PendingOrderResponse>> getAllPendingOrders(int page) async {
    return await apiExecuter<PendingOrderResponse>(() async {
      var response = await apiService.getAllPendingOrders(page);
      return response;
    }, 'HomeScreenDataSourceImp');
  }

  @override
  Future<OrdersFirebaseModel> getOrderDetailsFireBase() async {
    final doc =
        await firestore
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
  Future<ApiResult<PendingOrderResponse>> startOrder(String id) async {
    return await apiExecuter<PendingOrderResponse>(() async {
      var response = await apiService.startOrder(id);
      return response;
    }, 'HomeScreenDataSourceImp');
  }
}
