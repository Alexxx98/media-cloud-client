import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class DeleteDirectory {
  final MediaCloudRepository _mediaCloudRepository;

  DeleteDirectory(this._mediaCloudRepository);

  Future<DataState<Map<String, String>>> call(
    int directoryId,
    String? password,
  ) async {
    return await _mediaCloudRepository.deleteDirectory(directoryId, password);
  }
}
