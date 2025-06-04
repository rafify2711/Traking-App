import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';

import 'package:tracking_app/features/profile/domain/repos/profile_repo.dart';

@injectable
class ChangePasswordUseCase {
  ProfileRepo profileRepo;
  ChangePasswordUseCase(this.profileRepo);

 Future<ApiResult<Map<String, dynamic>>> invoke({required String oldPassword,
    required String newPassword,}) async {
    return await profileRepo.changePassword(
      {
        "password": oldPassword,
        "newPassword": newPassword,
      },
    );
  }


}