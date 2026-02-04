import 'dart:typed_data';

import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class DownloadMultipleFiles {
  final MediaCloudRepository _mediaCloudRepository;

  DownloadMultipleFiles(this._mediaCloudRepository);

  Future<DataState<Uint8List>> call(List<int> fileIds) async {
    return await _mediaCloudRepository.downloadMultipleFiles(fileIds);
  }
}
