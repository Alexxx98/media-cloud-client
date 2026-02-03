import 'package:client/core/data_state.dart';

import 'package:client/business_logic/entities/file.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';

class RenameFile {
  final MediaCloudRepository _mediaCloudRepository;

  RenameFile(this._mediaCloudRepository);

  Future<DataState<FileEntity>> call(int fileId, String name) async {
    return await _mediaCloudRepository.renameFile(fileId, name);
  }
}
