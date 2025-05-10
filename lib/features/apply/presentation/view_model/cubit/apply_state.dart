import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/utils/enums/gender_enum.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/apply/data/models/country_model/country_model.dart';
import 'package:tracking_app/features/apply/data/models/get_all_vehicles_response/vehicle.dart';

class ApplyState extends Equatable {
  ApplyState({
    this.errorMessage,
    this.selectedVehicle,
    this.applyState,
    this.applyResponse,
    this.selectedGender = Gender.female,
    this.selectedCountry,
    this.countries = const [],
    this.vehicles,
    this.isLoading = false,
  });

  final BaseState? applyState;
  final ApplyResponse? applyResponse;
  final List<Vehicle>? vehicles;
  final Gender selectedGender;
  final CountryModel? selectedCountry;
  final List<CountryModel> countries;
  Vehicle? selectedVehicle;
  final String? errorMessage;

  final bool isLoading;

  ApplyState copyWith({
    BaseState? applyState,
    ApplyResponse? applyResponse,
    Vehicle? selectedVehicle,
    String? errorMessage,
    Gender? selectedGender,
    CountryModel? selectedCountry,
    List<CountryModel>? countries,
    List<Vehicle>? vehiclesResponse,

    bool? isLoading,
  }) {
    return ApplyState(
      applyState: applyState ?? this.applyState,
      applyResponse: applyResponse ?? this.applyResponse,
      selectedGender: selectedGender ?? this.selectedGender,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      countries: countries ?? this.countries,
      vehicles: vehiclesResponse ?? vehicles,
      isLoading: isLoading ?? this.isLoading,
      selectedVehicle: selectedVehicle ?? this.selectedVehicle,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    applyState,
    applyResponse,
    selectedGender,
    selectedCountry,
    countries,
    vehicles,
    isLoading,
    selectedVehicle,
    errorMessage,
  ];
}
