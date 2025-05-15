import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/driver.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source.dart';
import 'package:tracking_app/features/home/data/models/order_details.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';

@Injectable(as: HomeScreenDataSource)
class HomeScreenDataSourceImp extends HomeScreenDataSource {
  ApiService apiService;
   FirebaseFirestore firestore;

  HomeScreenDataSourceImp(this.apiService,this.firestore);

  @override
  Future<ApiResult<OrderResponse>> getAllPendingOrders(int page) async {
    return await apiExecuter<OrderResponse>(() async {
      var response = await apiService.getAllPendingOrders(page);
      return response;
    }, 'HomeScreenDataSourceImp');
  }



  @override
  Future<OrderDetails> getOrderDetailsFireBase()async {
    final doc = await firestore.collection('orders')  .doc("681bd6741433a666c8da31c7").get();
    if (doc.exists) {
      final data = doc.data()?['order'];
      print(data);
      print("ssssss");
      var a= OrderDetails.fromJson(data!);
      print(a.totalPrice);
      return  a;
    } else {
      throw Exception('Order not found');
    }

}}
