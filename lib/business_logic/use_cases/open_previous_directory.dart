import 'package:client/business_logic/entities/previous_directory_response.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class OpenPreviousDirectory {
  final MediaCloudRepository _mediaCloudRepository;

  OpenPreviousDirectory(this._mediaCloudRepository);

  Future<DataState<PreviousDirectoryResponseEntity>> call(
    int directoryId,
  ) async {
    return await _mediaCloudRepository.openPreviousDirectory(directoryId);
  }
}
