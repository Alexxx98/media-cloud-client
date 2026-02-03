import 'package:client/business_logic/entities/file.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class GetFiles {
  final MediaCloudRepository _mediaCloudRepository;

  GetFiles(this._mediaCloudRepository);

  Future<DataState<List<FileEntity>>> call(int parentId) async {
    return await _mediaCloudRepository.getFiles(parentId);
  }
}
