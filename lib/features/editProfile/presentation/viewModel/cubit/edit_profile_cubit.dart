import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/editProfile/domain/useCase/edit_profile_use_case.dart';
import 'package:tracking_app/features/editProfile/presentation/viewModel/cubit/edit_profile_state.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase editProfileUseCase;
  final UploadPhotoUseCase uploadPhotoUseCase;

  EditProfileCubit(this.editProfileUseCase, this.uploadPhotoUseCase)
    : super(const EditProfileState());

  Future<void> uploadProfilePhoto(File? photo) async {
    try {
      emit(state.copyWith(status: EditProfileStatus.loading));

      await uploadPhotoUseCase(photo!);

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

    final result = await editProfileUseCase(updatedUser);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: EditProfileStatus.failure,
          errorMessage: failure.errorMessage,
        ),
      ),
      (profile) => emit(
        state.copyWith(status: EditProfileStatus.success, profile: profile),
      ),
    );
  }
}
