import 'package:client/business_logic/entities/media_file.dart';

class MediaFileModel extends MediaFileEntity {
  const MediaFileModel({
    required super.id,
    super.type,
    required super.name,
    required super.directoryId,
    required super.size,
    super.addedBy,
    super.addedAt,
  });

  // deserializer
  factory MediaFileModel.fromJson(Map<String, dynamic> json) => MediaFileModel(
    id: json['id'] as int,
    type: json['type'] as String,
    name: json['original_name'] as String,
    directoryId: json['parent_id'] as int,
    size: json['size'] as int,
    addedBy: json['added_by'] as String? ?? '',
    addedAt: json['added_at'] as DateTime,
  );

  // serializer
  Map<String, dynamic> toJson() => {
    'id': id,
    'original_name': name,
    'parent_id': directoryId,
    'size': size,
    'added_by': addedBy ?? '',
  };
}
