part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.orderState,
    this.driverData,
    this.getVehicle,
this.vehicleNameState
    // this.errorMessage,
  });

  final BaseState? orderState;
  final BaseState? vehicleNameState;
  final GetLoggedDriverDataResponse? driverData;
  final GetVehicleResponse? getVehicle;

  ProfileState copyWith({
    BaseState? orderState,
    GetLoggedDriverDataResponse? driverData,
     GetVehicleResponse? getVehicle,
     BaseState? vehicleNameState,

    // String? errorMessage,
  }) {
    return ProfileState(
      orderState: orderState ?? this.orderState,
      driverData: driverData ?? this.driverData,
      getVehicle: getVehicle??this.getVehicle,
        vehicleNameState: vehicleNameState??this.vehicleNameState
    );
  }

  @override
  List<Object?> get props => [orderState, driverData,getVehicle,vehicleNameState];
}
