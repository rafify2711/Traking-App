import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String? id;
  final String? type;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Vehicle({
    this.id,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json['_id'] as String?,
    type: json['type'] as String?,
    image: json['image'] as String?,
    createdAt:
        json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
    updatedAt:
        json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'type': type,
    'image': image,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
  };

  @override
  List<Object?> get props => [id, type, image, createdAt, updatedAt, v];
}
