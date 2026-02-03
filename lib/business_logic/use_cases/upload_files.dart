import 'dart:io';
import 'dart:typed_data';

import 'package:client/core/data_state.dart';

import 'package:client/business_logic/entities/file.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';

class UploadFiles {
  final MediaCloudRepository _mediaCloudRepository;

  UploadFiles(this._mediaCloudRepository);

  Future<DataState<List<FileEntity>>> call(
    int directoryId,
    List<Uint8List> files,
    String? uploadedBy,
  ) async {
    return await _mediaCloudRepository.uploadFiles(
      directoryId,
      files,
      uploadedBy,
    );
  }
}
