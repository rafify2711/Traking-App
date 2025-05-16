import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/driver.dart';


import 'package:tracking_app/features/home/data/models/order_response.dart';

part 'orders_firebase_model.g.dart';

@JsonSerializable()
class OrdersFirebaseModel {
 final OrderResponse order;
 final Driver driver;

 OrdersFirebaseModel({required this.order, required this.driver});

 factory OrdersFirebaseModel.fromJson(Map<String, dynamic> json) =>
     _$OrdersFirebaseModelFromJson(json);

 Map<String, dynamic> toJson() => {
   'order': order.toJson(),
   'driver': driver.toJson(),
 };
}
