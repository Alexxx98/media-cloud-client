import 'package:client/business_logic/entities/file.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class RenameDirectory {
  final MediaCloudRepository _mediaCloudRepository;

  RenameDirectory(this._mediaCloudRepository);

  Future<DataState<FileEntity>> call(
    int directoryId,
    String name,
    String? password,
  ) async {
    return await _mediaCloudRepository.renameDirectory(
      directoryId,
      name,
      password,
    );
  }
}
