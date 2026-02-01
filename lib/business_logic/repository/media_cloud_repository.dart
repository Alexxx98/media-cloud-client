import 'package:client/business_logic/entities/file.dart';
import 'package:client/core/data_state.dart';

abstract class MediaCloudRepository {
  // Get methods
  Future<DataState<List<FileEntity>>> getRoot();
  Future<DataState<List<FileEntity>>> getFiles(int parentId);
  Future<DataState<Stream<List<int>>>> downloadFile(int fileId);
  Future<DataState<Stream<List<int>>>> downloadMultipleFiles(List<int> fileIds);
  Future<DataState<Stream<List<int>>>> downloadDirectory(
    int directoryId,
    String? password,
  );
  Future<DataState<Stream<List<int>>>> streamFile(int fileId);

  // Post methods
  Future<DataState<FileEntity>> createDirectory(FileEntity directory);
  Future<DataState<List<FileEntity>>> uploadFiles(List<FileEntity> files);
  Future<DataState<List<FileEntity>>> downloadFiles(
    List<int> fileIds,
    String archiveName,
  );

  // Update methods
  Future<DataState<FileEntity>> renameDirectory(int directoryId, String name);
  Future<DataState<Map<String, dynamic>>> changePassword(
    int directoryId,
    String password,
  );
  Future<DataState<FileEntity>> renameFile(int fileId, String name);

  // Destroy methods
  Future<DataState<Map<String, dynamic>>> deleteDirectory(int directoryId);
  Future<DataState<Map<String, dynamic>>> removeFile(int fileId);
  Future<DataState<Map<String, dynamic>>> removeMultipleFiles(
    List<int> fileIds,
  );
}
