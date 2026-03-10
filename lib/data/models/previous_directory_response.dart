import 'package:client/data/models/file.dart';
import 'package:equatable/equatable.dart';

class PreviousDirectoryResponse extends Equatable {
  final FileModel directory;
  final List<FileModel> files;

  const PreviousDirectoryResponse({
    required this.directory,
    required this.files,
  });

  @override
  List<Object?> get props => [directory, files];

  // Deserializer
  factory PreviousDirectoryResponse.fromJson(Map<String, dynamic> json) {
    return PreviousDirectoryResponse(
      directory: json['directory'],
      files: json['files'],
    );
  }
}
