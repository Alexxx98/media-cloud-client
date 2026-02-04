import 'dart:typed_data';

import 'package:client/business_logic/entities/file.dart';
import 'package:client/core/data_state.dart';

abstract class MediaCloudRepository {
  // Get methods
  Future<DataState<List<FileEntity>>> getRoot();
  Future<DataState<List<FileEntity>>> getFiles(int parentId);
  Future<DataState<Uint8List>> downloadFile(int fileId);
  Future<DataState<Uint8List>> downloadMultipleFiles(List<int> fileIds);
  Future<DataState<Uint8List>> downloadDirectory(
    int directoryId,
    String? password,
  );
  Future<DataState<Uint8List>> streamFile(int fileId);

  // Post methods
  Future<DataState<FileEntity>> createDirectory(FileEntity directory);
  Future<DataState<List<FileEntity>>> uploadFiles(
    int directoryId,
    List<Uint8List> files,
    String? uploadedBy,
  );

  // Patch methods
  Future<DataState<FileEntity>> renameDirectory(
    int directoryId,
    String name,
    String? password,
  );

  // Change directory's password
  Future<DataState<Map<String, String>>> changePassword(
    int directoryId,
    String currentPassword,
    String newPassword,
  );

  // Rename file
  Future<DataState<FileEntity>> renameFile(int fileId, String name);

  // Delete methods
  Future<DataState<Map<String, String>>> deleteDirectory(
    int directoryId,
    String? password,
  );
  Future<DataState<Map<String, String>>> removeFile(int fileId);
  Future<DataState<Map<String, String>>> removeMultipleFiles(List<int> fileIds);
}
