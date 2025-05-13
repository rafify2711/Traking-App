import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/home/data/models/product_response.dart';

part 'order_item_response.g.dart';

@JsonSerializable()
class OrderItem {
  final Product? product;
  final double? price;
  final int? quantity;

  @JsonKey(name: '_id')
  final String? id;

  OrderItem({this.product, this.price, this.quantity, this.id});

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
