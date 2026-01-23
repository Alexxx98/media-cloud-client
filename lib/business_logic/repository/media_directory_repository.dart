import 'package:client/business_logic/entities/media_directory.dart';

abstract class MediaDirectoryRepository {
  // post methods
  Future<MediaDirectoryEntity> createDirectory(
    MediaDirectoryRepository directory,
  );

  // Update methods
  Future<MediaDirectoryEntity> updateDirectory(
    int directoryId,
    MediaDirectoryEntity directory,
  );

  // Destroy methods
  Future<Map<String, dynamic>> removeDirecotry(int direcotryId);
}
