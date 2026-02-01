import 'package:client/business_logic/entities/file.dart';

class FileModel extends FileEntity {
  const FileModel({
    super.id,
    super.type,
    required super.name,
    super.parentId,
    super.password,
    super.size,
    super.mimeType,
    super.addedBy,
    super.addedAt,
  });

  // deserializer
  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
    id: json['id'] as int,
    type: json['type'] as String,
    name: json['original_name'] as String,
    parentId: json['parent_id'] as int?,
    size: json['size'] as int?,
    mimeType: json['mime_type'] as String?,
    addedBy: json['added_by'] as String? ?? '',
    addedAt: json['added_at'] as DateTime,
  );

  // serializer
  Map<String, dynamic> toJson() => {
    'id': ?id,
    'type': type,
    'original_name': name,
    'parent_id': ?parentId,
    'password': ?password,
    'size': ?size,
    'mime_type': ?mimeType,
    'added_by': ?addedBy,
  };
}
