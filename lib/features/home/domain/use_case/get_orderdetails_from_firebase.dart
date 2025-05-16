import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/home/data/models/order_details.dart';
import 'package:tracking_app/features/home/domain/repo/home_screen_repo.dart';

@injectable
class GetOrderdetailsFromFirebase {
  HomeScreenRepo homeScreenRepo;
  GetOrderdetailsFromFirebase(this.homeScreenRepo);


  Future<OrderDetails> invoke()async{

    return await homeScreenRepo.getOrderDetailsFromFireBase();

  }
}
