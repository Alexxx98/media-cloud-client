import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class ChangePassword {
  final MediaCloudRepository _mediaCloudRepository;

  ChangePassword(this._mediaCloudRepository);

  Future<DataState<Map<String, String>>> call(
    int directoryId,
    String currentPassword,
    String newPassword,
  ) async {
    return await _mediaCloudRepository.changePassword(
      directoryId,
      currentPassword,
      newPassword,
    );
  }
}
