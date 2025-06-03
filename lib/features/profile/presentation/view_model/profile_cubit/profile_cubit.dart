import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/auth/apply/domain/use_case/get_vehicle_use_case.dart';

import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';
import 'package:tracking_app/features/profile/domain/use_case/get_logged_driver_data_use_case.dart';
import 'package:tracking_app/features/profile/domain/use_case/get_vechile_name_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetLoggedDriverDataUseCase getLoggedDriverDataUseCase;
  final GetVechileNameUseCase getVechileNameUseCase;

  ProfileCubit(this.getLoggedDriverDataUseCase, this.getVechileNameUseCase)
    : super(const ProfileState());

  Future<void> getLoggedDriverData() async {
    emit(
      state.copyWith(orderState: BaseLoading<GetLoggedDriverDataResponse>()),
    );

    final result = await getLoggedDriverDataUseCase.invoke();
    switch (result) {
      case ApiSuccess<GetLoggedDriverDataResponse>():
        final driverData = result.data;
        final vehicleId = driverData?.driver?.vehicleType;
        if (vehicleId != null && vehicleId.isNotEmpty) {
          await getVechileName(vehicleId);
        }
        {
          emit(
            state.copyWith(
              orderState: BaseSuccess<GetLoggedDriverDataResponse>(
                data: result.data,
              ),

              driverData: result.data,
            ),
          );

          break;
        }
      case ApiError<GetLoggedDriverDataResponse>():
        {
          emit(
            state.copyWith(
              orderState: BaseError<GetLoggedDriverDataResponse>(
                errorMessage: result.failure?.errorMessage ?? 'Unknown error',
              ),
            ),
          );
        }
    }
  }

  Future<void> getVechileName(String vehicleId) async {
    emit(state.copyWith(vehicleNameState: BaseLoading<GetVehicleResponse>()));

    final result = await getVechileNameUseCase.invoke(vehicleId);
    switch (result) {
      case ApiSuccess<GetVehicleResponse>():
        {
          emit(
            state.copyWith(
              vehicleNameState: BaseSuccess<GetVehicleResponse>(data: result.data),

              getVehicle: result.data,
            ),
          );
        }
      case ApiError<GetVehicleResponse>():
        {
          emit(
            state.copyWith(
              vehicleNameState: BaseError<GetVehicleResponse>(
                errorMessage: result.failure?.errorMessage ?? 'Unknown error',
              ),
            ),
          );
        }
    }
  }
}
