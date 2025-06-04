import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/auth/apply/domain/use_case/get_vehicle_use_case.dart';
import 'package:tracking_app/features/logout/domain/usecases/logout_usecase.dart';

import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';
import 'package:tracking_app/features/profile/domain/use_case/get_logged_driver_data_use_case.dart';
import 'package:tracking_app/features/profile/domain/use_case/get_vechile_name_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetLoggedDriverDataUseCase getLoggedDriverDataUseCase;
  final GetVechileNameUseCase getVechileNameUseCase;
  LogoutUseCase logoutUseCase;
  ProfileCubit(this.getLoggedDriverDataUseCase, this.getVechileNameUseCase , this.logoutUseCase)
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
  logOut() async {
    emit(state.copyWith(logOutState: BaseLoading()));
  final result = await  logoutUseCase.invoke();
  switch (result) {
    case ApiSuccess<String>():
      {
        emit(
          state.copyWith(
            logOutState: BaseSuccess<String>(data: result.data),
          ),
        );
      }
    case ApiError<String>():
      {
        emit(
          state.copyWith(
            logOutState: BaseError<String>(
              errorMessage: result.failure?.errorMessage ?? 'Unknown error',
            ),
          ),
        );
      }
                        
  }
//     Future<void> showLogoutConfirmationDialog(BuildContext context) {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // User must tap button to close dialog
//       builder: (BuildContext dialogContext) {
//         return AlertDialog(
//           title: const Text('Confirm Logout'),
//           content: const Text('Are you sure you want to logout?'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(dialogContext).pop(); // Close the dialog
//               },
//             ),
//             TextButton(
//               child: const Text('Logout'),
//               onPressed: () {
//                 Navigator.of(dialogContext).pop(); // Close the dialog
//                 // Call the logout function with proper error handling
//                 userLogout().catchError((error) {
//                   log('Error during logout: $error');
//                 });
//               },
//             ),
//           ],
//         );
//       },
//     );

// }
}}
