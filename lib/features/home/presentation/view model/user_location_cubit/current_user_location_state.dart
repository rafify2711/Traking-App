part of 'current_user_location_cubit.dart';

class CurrentUserLocationState extends Equatable {
  const CurrentUserLocationState({
    this.locationState,
    this.lattitude,
    this.longitude,

    // this.errorMessage,
  });
  final BaseState? locationState;
  // final LocationData? locationData;
  final double? lattitude;
  final double? longitude;
  // final String? errorMessage;

  CurrentUserLocationState copyWith({
    BaseState? locationState,
    double? lattitude,
    double? longitude,
    // String? errorMessage,
  }) {
    return CurrentUserLocationState(
      locationState: locationState ?? this.locationState,
      lattitude: lattitude ?? this.lattitude,
      longitude: longitude ?? this.longitude,
      // errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [locationState, lattitude, longitude];
}
