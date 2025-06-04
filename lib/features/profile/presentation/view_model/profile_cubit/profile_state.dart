// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.orderState,
    this.vehicleNameState,
    this.driverData,
    this.getVehicle,
    this.logOutState,
  });

  final BaseState? orderState;
  final BaseState? vehicleNameState;
  final GetLoggedDriverDataResponse? driverData;
  final GetVehicleResponse? getVehicle;
  final BaseState ? logOutState;

  ProfileState copyWith({
    BaseState? orderState,
    GetLoggedDriverDataResponse? driverData,
     GetVehicleResponse? getVehicle,
     BaseState? vehicleNameState,
      final BaseState ? logOutState
    // String? errorMessage,
  }) {
    return ProfileState(
      orderState: orderState ?? this.orderState,
      driverData: driverData ?? this.driverData,
      getVehicle: getVehicle??this.getVehicle,
        vehicleNameState: vehicleNameState??this.vehicleNameState
        ,logOutState: logOutState??this.logOutState
    );
  }

  @override
  List<Object?> get props => [orderState, driverData,getVehicle,vehicleNameState];
}
