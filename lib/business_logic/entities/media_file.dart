import 'package:equatable/equatable.dart';

abstract class MediaFileEntity extends Equatable {
  final int id;
  final String filename;
  final int directoryId;
  final int size;
  final String? uploadedBy;
  final DateTime? uploadedAt;

  const MediaFileEntity({
    required this.id,
    required this.filename,
    required this.directoryId,
    required this.size,
    this.uploadedBy,
    this.uploadedAt,
  });

  @override
  List<Object> get props => [
    id,
    filename,
    directoryId,
    size,
    ?uploadedBy,
    ?uploadedBy,
  ];
}
