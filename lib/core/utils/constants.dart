class Constants {
  static const String baseUrl = "https://flower.elevateegy.com/api/v1/";
  static const String userToken = "token";
  static const String rememberMe = "remember_me";
  static const String loginEndPoint = "drivers/signin";
  static const String forgetPasswordEndpoint = "drivers/forgotPassword";
  static const String verifyResetCodeEndpoint = "drivers/verifyResetCode";
  static const String resetPasswordEndpoint = "drivers/resetPassword";
  static const String applyEndpoint = "drivers/apply";
  static const String getAllVehiclesEndpoint = "vehicles";
  static const String updateOrderStatusEndPoint = "orders/state";
  static const String getAllPendingOrdersEndPoint = "orders/pending-orders";
  static const String deliveryManMarkerId = "deliveryMan";
  static const String storeMarkerId = "store";
  static const String customerMarkerId = "customer";
  static const String startOrderEndPoint = "orders/start/{id}";
  static const String getLoggedDriverDataEndPoint = "drivers/profile-data";
  static const String getAllDriverOrdersEndPoint = "orders/driver-orders";
  static const String changePasswordEndPoint = "drivers/change-password";
  static const String editProfileEndPoint = "drivers/editProfile";
  static const String uploadPhoto = "drivers/upload-photo";
  static const String logoutEndPoint = "drivers/logout";

  // ─── Firebase / shared bridge (Flowery `Orders` collection, flat fields) ───
  static const String firestoreOrdersCollection = "Orders";
  /// Top-level status string on the order doc (synced with API `orderStatus`).
  static const String firestoreOrderStateField = "Status";
  static const String firestoreDriverLatitudeField = "DriverLatitude";
  static const String firestoreDriverLongitudeField = "DriverLongitude";
  static const String firestoreOrderAcceptedAtField = "OrderAcceptedAt";
  static const String firestoreEstimatedArrivalField = "EstimatedArrival";
  static const String firestorePreparingYourOrderAtField = "PreparingYourOrderAt";
  static const String firestoreOutForDeliveryAtField = "OutForDeliveryAt";
  static const String firestoreArrivedAtField = "ArrivedAt";
  static const String firestoreDeliveredAtField = "DeliveredAt";
  static const String firestoreDriverNameField = "DriverName";
  static const String firestoreDriverPhoneField = "DriverPhone";
}
