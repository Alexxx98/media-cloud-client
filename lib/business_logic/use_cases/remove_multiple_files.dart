import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class RemoveMultipleFiles {
  final MediaCloudRepository _mediaCloudRepository;

  RemoveMultipleFiles(this._mediaCloudRepository);

  Future<DataState<Map<String, String>>> call(List<int> fileIds) async {
    return await _mediaCloudRepository.removeMultipleFiles(fileIds);
  }
}
