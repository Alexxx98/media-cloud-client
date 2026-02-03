import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class RemoveFile {
  final MediaCloudRepository _mediaCloudRepository;

  RemoveFile(this._mediaCloudRepository);

  Future<DataState<Map<String, String>>> call(int fileId) async {
    return await _mediaCloudRepository.removeFile(fileId);
  }
}
