import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/order_tap/data/model/driver_orders_response.dart';

class DriverOrderState extends Equatable {
  const DriverOrderState({
    this.driverOrderState,
    this.canceledCount,
    this.completedCount,
    this.driverOrderData,
  });

  final BaseState? driverOrderState;
  final DriverOrdersResponse? driverOrderData;
  final int? canceledCount;

  final int? completedCount;

  DriverOrderState copyWith({
    final BaseState? driverOrderState,
    final DriverOrdersResponse? driverOrderData,
    final int? canceledCount,
    final int? completedCount,
    // String? errorMessage,
  }) {
    return DriverOrderState(
      driverOrderState: driverOrderState ?? this.driverOrderState,
      driverOrderData: driverOrderData ?? this.driverOrderData,
      canceledCount: canceledCount ?? this.canceledCount,
      completedCount: completedCount ?? this.completedCount,
      // errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    driverOrderData,
    driverOrderState,
    canceledCount,
    completedCount,
  ];
}
