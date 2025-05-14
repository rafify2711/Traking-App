import 'package:json_annotation/json_annotation.dart';

part 'metadata_response.g.dart';

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? limit;

  Metadata({this.currentPage, this.totalPages, this.totalItems, this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
