import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/utils/enums/gender_enum.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_data.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/apply/data/models/country_model/country_model.dart';
import 'package:tracking_app/features/apply/data/models/get_all_vehicles_response/get_all_vehicles_response.dart';
import 'package:tracking_app/features/apply/data/models/get_all_vehicles_response/vehicle.dart';
import 'package:tracking_app/features/apply/domain/use_case/apply_use_case.dart';
import 'package:tracking_app/features/apply/domain/use_case/get_vehicle_use_case.dart';
import 'package:tracking_app/features/apply/presentation/view_model/cubit/apply_state.dart';

class ApplyCubit extends Cubit<ApplyState> {
  final ApplyUseCase applyUseCase;
  final GetVehiclesUseCase getVehiclesUseCase;
  ApplyCubit(this.applyUseCase, this.getVehiclesUseCase)
    : super( ApplyState());

  final countryController = TextEditingController();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final vehicleTypeController = TextEditingController();
  final vehicleNumberController = TextEditingController();
  final vehicleLicenseController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final idNumberController = TextEditingController();
  final idImageController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  File? vehicleLicenseFile;
  File? idImageFile;

  void setVehicleImage(File? file) {
    vehicleLicenseFile = file;
    // vehicleLicenseController.text (.text mean) da ell text content which appear inside the text field
    vehicleLicenseController.text = file?.path.split("/").last ?? "";
    emit(state.copyWith());
  }

  void setIdImage(File? file) {
    {
      idImageFile = file;
      idImageController.text = file?.path.split("/").last ?? "";
      emit(state.copyWith());
    }
  }

  Future<void> loadCountries(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final countries = await CountryModel.getCountryFromAssets(context);
    CountryModel? selected;
    if (countries.isNotEmpty) {
      final index = await CountryModel.getEgyptIndex(context);
      selected = countries[index];
    }
    emit(
      state.copyWith(
        isLoading: false,
        countries: countries,
        selectedCountry: selected,
      ),
    );
  }

  void setGender(Gender gender) {
    emit(state.copyWith(selectedGender: gender));
  }

  void setSelectedCountry(CountryModel country) {
    emit(state.copyWith(selectedCountry: country));
  }

  void setVehicleType(Vehicle? vehicleType) {
    emit(state.copyWith(selectedVehicle: vehicleType));
  }

  Future<void> apply(ApplyData applyData) async {
    if (vehicleLicenseFile == null || idImageFile == null) {
      emit(
        state.copyWith(
          applyState: BaseError<ApplyResponse>(
            errorMessage: 
           "Please upload all required images",
          ),
        ),
      );
      return;
    }

    emit(state.copyWith(applyState: BaseLoading()));
    final result = await applyUseCase.apply(applyData);

    if (result is ApiSuccess<ApplyResponse>) {
      emit(
        state.copyWith(
          applyState: BaseSuccess<ApplyResponse>(data: result.data),
          applyResponse: result.data,
          
        ),
      );
    } else if (result is ApiError<ApplyResponse>) {
      emit(
        state.copyWith(
          applyState: BaseError<ApplyResponse>(errorMessage:  result.failure?.errorMessage ?? "Something went wrong"),
            
          
        ),
      );
    }
  }

  Future<void> getVehicles() async {
    emit(state.copyWith(applyState: BaseLoading()));
    final result = await getVehiclesUseCase.call();
    
    if (result is ApiSuccess<GetAllVehiclesResponse>) {
      emit(state.copyWith(
                  vehiclesResponse: result.data?.vehicles,
        applyState: BaseSuccess<List<Vehicle>>(data: result.data?.vehicles)));
    } else if (result is ApiError<GetAllVehiclesResponse>) {
      emit(state.copyWith(applyState: BaseError<String>( errorMessage: result.message ?? "Something went wrong")));
    }
  }

  void disposeControllers() {
    countryController.dispose();
    firstNameController.dispose();
    secondNameController.dispose();
    vehicleTypeController.dispose();
    vehicleNumberController.dispose();
    vehicleLicenseController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    idNumberController.dispose();
    idImageController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
