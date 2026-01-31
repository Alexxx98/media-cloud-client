import 'package:equatable/equatable.dart';

class MediaFileEntity extends Equatable {
  final int id;
  final String? type;
  final String name;
  final int directoryId;
  final int size;
  final String? addedBy;
  final DateTime? addedAt;

  const MediaFileEntity({
    required this.id,
    this.type,
    required this.name,
    required this.directoryId,
    required this.size,
    this.addedBy,
    this.addedAt,
  });

  @override
  List<Object> get props => [
    id,
    ?type,
    name,
    directoryId,
    size,
    ?addedBy,
    ?addedBy,
  ];
}
