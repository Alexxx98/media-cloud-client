import 'package:client/business_logic/entities/media_file.dart';

abstract class Repository {
  Future<MediaFileEntity> uploadFile(MediaFileEntity file);
  Future<List<MediaFileEntity>> uploadFiles(List<MediaFileEntity> files);
  Future
}
