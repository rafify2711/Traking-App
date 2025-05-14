import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

part 'current_user_location_state.dart';

class CurrentUserLocationCubit extends Cubit<CurrentUserLocationState> {
  CurrentUserLocationCubit() : super(const CurrentUserLocationState());
  Future<void> getCurrentLocation() async {
    // emit(state.copyWith(locationState: BaseLoading()));

    try {
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(
          state.copyWith(
            locationState: BaseError<String>(
              errorMessage: LocaleKeys.locationServiceDisabled.tr(),
            ),
            // errorMessage: LocaleKeys.locationServiceDisabled.tr(),
          ),
        );
        return;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
       
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(
            state.copyWith(
              locationState: BaseError<String>(
                errorMessage: LocaleKeys.locationPermissionIsDeied.tr(),
              ),
            ),
          );
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            locationState: BaseError<String>(
              errorMessage: LocaleKeys.locationPermissionIsDeied.tr(),
            ),
            // errorMessage: LocaleKeys.locationPermissionIsPermanentlyDenied.tr(),
          ),
        );
        return;
      }
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition();
        emit(
          state.copyWith(
            locationState: BaseSuccess(data: position),
            lattitude: position.latitude,
            longitude: position.longitude,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          locationState: BaseError<String>(errorMessage: e.toString()),
          // errorMessage: e.toString(),
        ),
      );
    }
  }
}
