import 'package:client/business_logic/entities/media_directory.dart';

class MediaDirectoryModel extends MediaDirectoryEntity {
  const MediaDirectoryModel({
    required super.id,
    String? type,
    required super.name,
    super.parentId,
    super.password,
    super.addedBy,
    super.addedAt,
  });

  // deserializer
  factory MediaDirectoryModel.fromJson(Map<String, dynamic> json) =>
      MediaDirectoryModel(
        id: json['id'] as int,
        type: json['type'] as String,
        name: json['original_name'] as String,
        parentId: json['parent_id'] as int,
        addedBy: json['added_by'] as String? ?? '',
        addedAt: json['added_at'] as DateTime,
      );

  // serializer
  Map<String, dynamic> toJson() => {
    'id': id,
    'original_name': name,
    'parent_id': parentId,
    'added_by': addedBy,
  };
}
