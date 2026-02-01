import 'package:equatable/equatable.dart';

class FileEntity extends Equatable {
  final int? id;
  final String? type;
  final String name;
  final int? parentId;
  final String? password;
  final int? size;
  final String? mimeType;
  final String? addedBy;
  final DateTime? addedAt;

  const FileEntity({
    this.id,
    this.type,
    required this.name,
    this.parentId,
    this.password,
    required this.size,
    this.mimeType,
    this.addedBy,
    this.addedAt,
  });

  @override
  List<Object> get props => [
    ?id,
    ?type,
    name,
    ?parentId,
    ?password,
    ?size,
    ?mimeType,
    ?addedBy,
    ?addedBy,
  ];
}
