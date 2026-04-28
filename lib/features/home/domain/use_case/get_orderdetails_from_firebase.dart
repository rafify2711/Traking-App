import 'package:injectable/injectable.dart';

import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/domain/repo/home_repo.dart';

@injectable
class GetOrderdetailsFromFirebase {
  HomeRepo homeScreenRepo;
  GetOrderdetailsFromFirebase(this.homeScreenRepo);

  Future<OrderResponse> invoke() async {
    return await homeScreenRepo.getOrderDetailsFromFireBase();
  }
}
