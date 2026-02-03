import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class DownloadDirectory {
  final MediaCloudRepository _mediaCloudRepository;

  DownloadDirectory(this._mediaCloudRepository);

  Future<DataState<List<int>>> call(int directoryId, String? password) async {
    return await _mediaCloudRepository.downloadDirectory(directoryId, password);
  }
}
