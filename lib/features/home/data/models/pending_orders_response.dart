import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/auth/apply/data/models/get_all_vehicles_response/metadata.dart';
import 'package:tracking_app/features/home/data/models/order_details.dart';

part 'pending_orders_response.g.dart';

@JsonSerializable()
class OrderResponse {
  final String? message;
  final Metadata? metadata;
  final List<OrderDetails>? orders;

  OrderResponse({this.message, this.metadata, this.orders});

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
