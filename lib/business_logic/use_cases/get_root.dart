import 'package:client/business_logic/entities/file.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';

import 'package:client/core/data_state.dart';

class GetRoot {
  final MediaCloudRepository _mediaCloudRepository;

  GetRoot(this._mediaCloudRepository);

  Future<DataState<List<FileEntity>>> call() async {
    return await _mediaCloudRepository.getRoot();
  }
}
