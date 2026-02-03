import 'dart:io';

import 'package:client/core/data_state.dart';

import 'package:client/business_logic/entities/file.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';

class CreateFile {
  final MediaCloudRepository _mediaCloudRepository;

  CreateFile(this._mediaCloudRepository);

  Future<DataState<List<FileEntity>>> call(
    int directoryId,
    List<File> files,
    String? uploadedBy,
  ) async {
    return await _mediaCloudRepository.uploadFiles(
      directoryId,
      files,
      uploadedBy,
    );
  }
}
