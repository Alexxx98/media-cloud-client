import 'package:equatable/equatable.dart';

class MediaDirectoryEntity extends Equatable {
  final int id;
  final String? type;
  final String name;
  final int? parentId;
  final String? password;
  final String? addedBy;
  final DateTime? addedAt;

  const MediaDirectoryEntity({
    required this.id,
    this.type,
    required this.name,
    this.parentId,
    this.password,
    this.addedBy,
    this.addedAt,
  });

  @override
  List<Object> get props => [
    id,
    ?type,
    name,
    ?parentId,
    ?password,
    ?addedBy,
    ?addedAt,
  ];
}
