class OrderDataModel {
  final String? state;
  final String? storeName;
  final String? storeAddress;
  final String? storeImage;
  final String? userFirstName;
  final String? userLastName;
  final String? userPhoto;

  OrderDataModel({
    this.state,
    this.storeName,
    this.storeAddress,
    this.storeImage,
    this.userFirstName,
    this.userLastName,
    this.userPhoto,
  });

  factory OrderDataModel.fromOrderData(dynamic orderData) {
    return OrderDataModel(
      state: orderData?.order?.state,
      storeName: orderData?.store?.name,
      storeAddress: orderData?.store?.address,
      storeImage: orderData?.store?.image,
      userFirstName: orderData?.order?.user?.firstName,
      userLastName: orderData?.order?.user?.lastName,
      userPhoto: orderData?.order?.user?.photo,
    );
  }

  String get fullName => '$userFirstName $userLastName';
}
