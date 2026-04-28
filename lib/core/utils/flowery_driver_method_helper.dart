import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/driver.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';


enum CurrentOrderState {
  inProgress,
  arrivedAtPickupPoint,
  startDeliver,
  arrivedToTheUser,
  deliveredToTheUser,
  completed,
}

abstract class FloweryDriverMethodHelper {
  static Driver? driverData;
  static String? currentDriverOrderId;
  static String? currentUserToken;

  static String getCurrentOrderStateButtonTitle({
    required String currentOrderState,
  }) {
    if (CurrentOrderState.inProgress.name == currentOrderState) {
      return "AppText.arrivedAtPickupPoint.tr()";
    } else if (CurrentOrderState.arrivedAtPickupPoint.name ==
        currentOrderState) {
      return "AppText.startDeliver.tr()";
    } else if (CurrentOrderState.startDeliver.name == currentOrderState) {
      return "AppText.arrivedToTheUser.tr()";
    } else if (CurrentOrderState.arrivedToTheUser.name == currentOrderState) {
      return "AppText.deliveredToTheUser.tr()";
    } else {
      return "AppText.deliveredToTheUser.tr()";
    }
  }
}

