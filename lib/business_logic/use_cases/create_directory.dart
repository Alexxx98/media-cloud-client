import 'package:client/business_logic/entities/file.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class CreateDirectory {
  final MediaCloudRepository _mediaCloudRepository;

  CreateDirectory(this._mediaCloudRepository);

  Future<DataState<FileEntity>> call(FileEntity directory) async {
    return await _mediaCloudRepository.createDirectory(directory);
  }
}
