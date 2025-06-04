import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/editProfile/data/model/user_response/user_response.dart';
import 'package:tracking_app/features/editProfile/domain/useCase/edit_profile_use_case.dart';
import 'package:tracking_app/features/editProfile/domain/useCase/upload_photo.dart';
import 'package:tracking_app/features/editProfile/presentation/viewModel/cubit/edit_profile_state.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase editProfileUseCase;
  final UploadPhoto uploadPhotoUseCase;

  EditProfileCubit(this.editProfileUseCase, this.uploadPhotoUseCase)
    : super(const EditProfileState());

  Future<void> uploadProfilePhoto(File? photo) async {
    try {
      emit(state.copyWith(status: EditProfileStatus.loading));

      await uploadPhotoUseCase.uploadPhoto(photo!);

      emit(state.copyWith(status: EditProfileStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: EditProfileStatus.failure,
          errorMessage: LocaleKeys.failedToUploadPhoto.tr(),
        ),
      );
    }
  }

  Future<void> editProfile(UpdatedUserModel updatedUser) async {
    emit(state.copyWith(status: EditProfileStatus.loading));

    final result = await editProfileUseCase.editProfile(updatedUser);

    if (result is ApiSuccess<UserResponse>) {
      emit(state.copyWith(status: EditProfileStatus.success, profile: result.data));
    } else if (result is ApiError<UserResponse>) {
      emit(state.copyWith(status: EditProfileStatus.failure, errorMessage: result.failure?.errorMessage ?? 'Unknown error'));
    }
  
    
  }
}
