import 'package:client/business_logic/entities/media_directory.dart';
import 'package:client/business_logic/entities/media_file.dart';
import 'package:client/core/data_state.dart';

abstract class MediaCloudRepository {
  // Get methods
  Future<DataState<List<MediaDirectoryEntity>>> getRoot();
  Future<DataState<List<MediaFileEntity>>> getFiles(int parentId);
  Future<DataState<MediaFileEntity>> downloadFile(int fileId);
  Future<DataState<MediaFileEntity>> streamFile(int fileId);

  // Post methods
  Future<DataState<MediaDirectoryEntity>> createDirectory(
    MediaDirectoryEntity directory,
  );
  Future<DataState<List<MediaFileEntity>>> uploadFiles(
    List<MediaFileEntity> files,
  );
  Future<DataState<List<MediaFileEntity>>> downloadFiles(
    List<int> fileIds,
    String archiveName,
  );

  // Update methods
  Future<DataState<MediaDirectoryEntity>> renameDirectory(
    int directoryId,
    String name,
  );
  Future<DataState<Map<String, dynamic>>> changePassword(
    int directoryId,
    String password,
  );
  Future<DataState<MediaFileEntity>> renameFile(int fileId, String name);

  // Destroy methods
  Future<DataState<Map<String, dynamic>>> deleteDirectory(int directoryId);
  Future<DataState<Map<String, dynamic>>> removeFile(int fileId);
  Future<DataState<Map<String, dynamic>>> removeMultipleFiles(
    List<int> fileIds,
  );
}
