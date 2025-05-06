

import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/utils/enums/gender_enum.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/apply/data/models/country_model/country_model.dart';

class ApplyState extends Equatable {
  const ApplyState({
    this.applyState,
    this.applyResponse,
    this.selectedGender = Gender.female,
    this.selectedCountry,
    this.countries = const [],
    this.selectedVehicleType,
    this.isLoading = false,
  });

  final BaseState<ApplyResponse>? applyState;
  final ApplyResponse? applyResponse;
  final Gender selectedGender;
  final CountryModel? selectedCountry;
  final List<CountryModel> countries;
  final String? selectedVehicleType;
  final bool isLoading;

  ApplyState copyWith({
    BaseState<ApplyResponse>? applyState,
    ApplyResponse? applyResponse,
    Gender? selectedGender,
    CountryModel? selectedCountry,
    List<CountryModel>? countries,
    String? selectedVehicleType,
    bool? isLoading,
  }) {
    return ApplyState(
      applyState: applyState ?? this.applyState,
      applyResponse: applyResponse ?? this.applyResponse,
      selectedGender: selectedGender ?? this.selectedGender,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      countries: countries ?? this.countries,
      selectedVehicleType: selectedVehicleType ?? this.selectedVehicleType,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        applyState,
        applyResponse,
        selectedGender,
        selectedCountry,
        countries,
        selectedVehicleType,
        isLoading,
      ];
}
