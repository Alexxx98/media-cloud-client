import 'package:client/business_logic/entities/previous_directory_response.dart';
import 'package:client/data/models/file.dart';

class PreviousDirectoryResponseModel extends PreviousDirectoryResponseEntity {
  final FileModel directory;
  final List<FileModel> files;

  const PreviousDirectoryResponseModel({
    required this.directory,
    required this.files,
  }) : super(directory: directory, files: files);

  @override
  List<Object?> get props => [...super.props, directory, files];

  // Deserializer
  factory PreviousDirectoryResponseModel.fromJson(Map<String, dynamic> json) {
    return PreviousDirectoryResponseModel(
      directory: json['directory'],
      files: json['files'],
    );
  }
}
