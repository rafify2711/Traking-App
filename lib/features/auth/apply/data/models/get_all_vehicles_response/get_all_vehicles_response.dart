import 'package:equatable/equatable.dart';

import 'metadata.dart';
import 'vehicle.dart';

class GetAllVehiclesResponse extends Equatable {
  final String? message;
  final Metadata? metadata;
  final List<Vehicle>? vehicles;

  const GetAllVehiclesResponse({this.message, this.metadata, this.vehicles});

  factory GetAllVehiclesResponse.fromJson(Map<String, dynamic> json) {
    return GetAllVehiclesResponse(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null
              ? null
              : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      vehicles:
          (json['vehicles'] as List<dynamic>?)
              ?.map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'metadata': metadata?.toJson(),
    'vehicles': vehicles?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [message, metadata, vehicles];
}
