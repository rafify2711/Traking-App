import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/editProfile/data/model/updated_user_model.dart';
import 'package:tracking_app/features/editProfile/data/model/user_response/user_response.dart';
import 'package:tracking_app/features/editProfile/domain/repository/edit_profile_repo.dart';

@injectable
class EditProfileUseCase {
  EditProfileRepo editProfileRepo;
  EditProfileUseCase(this.editProfileRepo);

  Future<ApiResult<UserResponse>> editProfile(UpdatedUserModel user) async {
    return await editProfileRepo.editProfile(user);
  }
}
