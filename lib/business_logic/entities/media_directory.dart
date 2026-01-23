import 'package:equatable/equatable.dart';

abstract class MediaDirectoryEntity extends Equatable {
  final int id;
  final String name;
  final int? parentId;
  final String? password;
  final String? creator;
  final DateTime? createdAt;

  const MediaDirectoryEntity({
    required this.id,
    required this.name,
    this.parentId,
    this.password,
    this.creator,
    this.createdAt,
  });

  @override
  List<Object> get props => [
    id,
    name,
    ?parentId,
    ?password,
    ?creator,
    ?createdAt,
  ];
}
