import 'dart:typed_data';

import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';

class StreamFile {
  final MediaCloudRepository _mediaCloudRepository;

  StreamFile(this._mediaCloudRepository);

  Future<DataState<Uint8List>> call(int fileId) async {
    return await _mediaCloudRepository.streamFile(fileId);
  }
}
