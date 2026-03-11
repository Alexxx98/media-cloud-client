import 'package:client/business_logic/entities/file.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class OpenDirectory {
  final MediaCloudRepository _mediaCloudRepository;

  OpenDirectory(this._mediaCloudRepository);

  Future<DataState<List<FileEntity>>> call(
    int? parentId,
    String? password,
  ) async {
    if (parentId != null) {
      return await _mediaCloudRepository.openDirectory(parentId, password);
    } else {
      return await _mediaCloudRepository.openDirectory(null, null);
    }
  }
}
