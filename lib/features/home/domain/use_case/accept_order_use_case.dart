import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source_imp.dart';
import 'package:tracking_app/features/home/domain/repo/home_repo.dart';

@injectable
class AcceptOrderUseCase {
  final HomeRepo _homeRepo;
  AcceptOrderUseCase(this._homeRepo);

  Future<ApiResult<void>> invoke({required AcceptOrderRequestEntity request}) async {
    return await _homeRepo.acceptOrder(request: request);
  }
}
