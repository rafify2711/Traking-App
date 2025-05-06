
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_data.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/apply/domain/repos/auth_repo.dart';

@injectable
class ApplyUseCase {
  final AuthRepo authRepo;

  ApplyUseCase({required this.authRepo});

  Future<ApiResult<ApplyResponse>> apply(ApplyData applyData) async{
    return await authRepo.apply(applyData);
  }
}