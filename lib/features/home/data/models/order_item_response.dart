import 'package:tracking_app/features/home/data/models/product_response.dart';

class OrderItem {
  final Product? product;
  final double? price;
  final int? quantity;
  final String? id;

  OrderItem({this.product, this.price, this.quantity, this.id});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    final dynamic rawProduct = json['product'];

    return OrderItem(
      product:
          rawProduct is Map<String, dynamic>
              ? Product.fromJson(rawProduct)
              : rawProduct is String
              ? Product(id: rawProduct)
              : null,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product?.toJson(),
      'price': price,
      'quantity': quantity,
      '_id': id,
    };
  }
}
