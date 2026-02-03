import 'package:client/core/data_state.dart';

import 'package:client/business_logic/repository/media_cloud_repository.dart';

class DownloadFile {
  final MediaCloudRepository _mediaCloudRepository;

  DownloadFile(this._mediaCloudRepository);

  Future<DataState<List<int>>> call(int fileId) async {
    return await _mediaCloudRepository.downloadFile(fileId);
  }
}
