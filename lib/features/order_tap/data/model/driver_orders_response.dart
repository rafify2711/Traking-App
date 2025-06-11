import 'package:json_annotation/json_annotation.dart';

part 'driver_orders_response.g.dart';

@JsonSerializable()
class DriverOrdersResponse {
  String? message;
  MetadataBean? metadata;
  List<OrdersBean> ?orders;

  DriverOrdersResponse({this.message, this.metadata, this.orders});

  factory DriverOrdersResponse.fromJson(Map<String, dynamic> json) => _$DriverOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DriverOrdersResponseToJson(this);
}

@JsonSerializable()
class OrdersBean {
  String ?id;
  String ?driver;
  OrderBean? order;
  var v;
  StoreBean? store;

  OrdersBean({this.id, this.driver, this.order, this.v, this.store});

  factory OrdersBean.fromJson(Map<String, dynamic> json) => _$OrdersBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersBeanToJson(this);
}

@JsonSerializable()
class StoreBean {
  String ?name;
  String ?image;
  String ?address;
  String ?phoneNumber;
  String ?latLong;

  StoreBean({this.name, this.image, this.address, this.phoneNumber, this.latLong});

  factory StoreBean.fromJson(Map<String, dynamic> json) => _$StoreBeanFromJson(json);

  Map<String, dynamic> toJson() => _$StoreBeanToJson(this);
}

@JsonSerializable()
class OrderBean {
  String ?id;
  UserBean? user;
  List<OrderItemsBean>? orderItems;
  var totalPrice;
  String? paymentType;
  bool ?isPaid;
  bool ?isDelivered;
  String ?state;
  String ?orderNumber;
  var v;

  OrderBean({this.id, this.user, this.orderItems, this.totalPrice, this.paymentType, this.isPaid, this.isDelivered, this.state,  this.orderNumber, this.v});

  factory OrderBean.fromJson(Map<String, dynamic> json) => _$OrderBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBeanToJson(this);
}

@JsonSerializable()
class OrderItemsBean {
  ProductBean? product;
  var price;
  var quantity;
  String? id;

  OrderItemsBean({this.product, this.price, this.quantity, this.id});

  factory OrderItemsBean.fromJson(Map<String, dynamic> json) => _$OrderItemsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemsBeanToJson(this);
}

@JsonSerializable()
class ProductBean {
  String ?id;
  var price;

  ProductBean({this.id, this.price});

  factory ProductBean.fromJson(Map<String, dynamic> json) => _$ProductBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBeanToJson(this);
}

@JsonSerializable()
class UserBean {
  String? id;
  String? firstName;
  String ?lastName;
  String ?email;
  String ?gender;
  String ?phone;
  String ?photo;

  UserBean({this.id, this.firstName, this.lastName, this.email, this.gender, this.phone, this.photo});

  factory UserBean.fromJson(Map<String, dynamic> json) => _$UserBeanFromJson(json);

  Map<String, dynamic> toJson() => _$UserBeanToJson(this);
}

@JsonSerializable()
class MetadataBean {
  var currentPage;
  var totalPages;
  var totalItems;
   var limit;

  MetadataBean({this.currentPage, this.totalPages, this.totalItems, this.limit});

  factory MetadataBean.fromJson(Map<String, dynamic> json) => _$MetadataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataBeanToJson(this);
}

