// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverOrdersResponse _$DriverOrdersResponseFromJson(
  Map<String, dynamic> json,
) => DriverOrdersResponse(
  message: json['message'] as String?,
  metadata:
      json['metadata'] == null
          ? null
          : MetadataBean.fromJson(json['metadata'] as Map<String, dynamic>),
  orders:
      (json['orders'] as List<dynamic>?)
          ?.map((e) => OrdersBean.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DriverOrdersResponseToJson(
  DriverOrdersResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.metadata,
  'orders': instance.orders,
};

OrdersBean _$OrdersBeanFromJson(Map<String, dynamic> json) => OrdersBean(
  id: json['id'] as String?,
  driver: json['driver'] as String?,
  order:
      json['order'] == null
          ? null
          : OrderBean.fromJson(json['order'] as Map<String, dynamic>),
  v: json['v'],
  store:
      json['store'] == null
          ? null
          : StoreBean.fromJson(json['store'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrdersBeanToJson(OrdersBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver': instance.driver,
      'order': instance.order,
      'v': instance.v,
      'store': instance.store,
    };

StoreBean _$StoreBeanFromJson(Map<String, dynamic> json) => StoreBean(
  name: json['name'] as String?,
  image: json['image'] as String?,
  address: json['address'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  latLong: json['latLong'] as String?,
);

Map<String, dynamic> _$StoreBeanToJson(StoreBean instance) => <String, dynamic>{
  'name': instance.name,
  'image': instance.image,
  'address': instance.address,
  'phoneNumber': instance.phoneNumber,
  'latLong': instance.latLong,
};

OrderBean _$OrderBeanFromJson(Map<String, dynamic> json) => OrderBean(
  id: json['id'] as String?,
  user:
      json['user'] == null
          ? null
          : UserBean.fromJson(json['user'] as Map<String, dynamic>),
  orderItems:
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItemsBean.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPrice: json['totalPrice'],
  paymentType: json['paymentType'] as String?,
  isPaid: json['isPaid'] as bool?,
  isDelivered: json['isDelivered'] as bool?,
  state: json['state'] as String?,
  orderNumber: json['orderNumber'] as String?,
  v: json['v'],
);

Map<String, dynamic> _$OrderBeanToJson(OrderBean instance) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'orderItems': instance.orderItems,
  'totalPrice': instance.totalPrice,
  'paymentType': instance.paymentType,
  'isPaid': instance.isPaid,
  'isDelivered': instance.isDelivered,
  'state': instance.state,
  'orderNumber': instance.orderNumber,
  'v': instance.v,
};

OrderItemsBean _$OrderItemsBeanFromJson(Map<String, dynamic> json) =>
    OrderItemsBean(
      product:
          json['product'] == null
              ? null
              : ProductBean.fromJson(json['product'] as Map<String, dynamic>),
      price: json['price'],
      quantity: json['quantity'],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$OrderItemsBeanToJson(OrderItemsBean instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      'id': instance.id,
    };

ProductBean _$ProductBeanFromJson(Map<String, dynamic> json) =>
    ProductBean(id: json['id'] as String?, price: json['price']);

Map<String, dynamic> _$ProductBeanToJson(ProductBean instance) =>
    <String, dynamic>{'id': instance.id, 'price': instance.price};

UserBean _$UserBeanFromJson(Map<String, dynamic> json) => UserBean(
  id: json['id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
);

Map<String, dynamic> _$UserBeanToJson(UserBean instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'gender': instance.gender,
  'phone': instance.phone,
  'photo': instance.photo,
};

MetadataBean _$MetadataBeanFromJson(Map<String, dynamic> json) => MetadataBean(
  currentPage: json['currentPage'],
  totalPages: json['totalPages'],
  totalItems: json['totalItems'],
  limit: json['limit'],
);

Map<String, dynamic> _$MetadataBeanToJson(MetadataBean instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'limit': instance.limit,
    };
