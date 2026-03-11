import 'package:client/business_logic/entities/file.dart';
import 'package:equatable/equatable.dart';

class PreviousDirectoryResponseEntity extends Equatable {
  final FileEntity directory;
  final List<FileEntity> files;

  const PreviousDirectoryResponseEntity({
    required this.directory,
    required this.files,
  });

  @override
  List<Object?> get props => [directory, files];
}
