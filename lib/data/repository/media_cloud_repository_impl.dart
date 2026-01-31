import 'package:client/business_logic/entities/media_directory.dart';
import 'package:client/business_logic/entities/media_file.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/data/data_source/remote/media_cloud_api_service.dart';

class MediaCloudRepositoryImpl implements MediaCloudRepository {
  final MediaCloudApiService _apiService;

  MediaCloudRepositoryImpl(this._apiService);

  @override
  Future<Map<String, dynamic>> changePassword(int directoryId, String password) async {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<MediaDirectoryEntity> createDirectory(MediaDirectoryEntity directory) {
    // TODO: implement createDirectory
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> deleteDirectory(int directoryId) {
    // TODO: implement deleteDirectory
    throw UnimplementedError();
  }

  @override
  Future<MediaFileEntity> downloadFile(int fileId) {
    // TODO: implement downloadFile
    throw UnimplementedError();
  }

  @override
  Future<List<MediaFileEntity>> downloadFiles(List<int> fileIds, String archiveName) {
    // TODO: implement downloadFiles
    throw UnimplementedError();
  }

  @override
  Future<List<MediaFileEntity>> getFiles(int parentId) {
    // TODO: implement getFiles
    throw UnimplementedError();
  }

  @override
  Future<List<MediaDirectoryEntity>> getRoot() {
    // TODO: implement getRoot
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> removeFile(int fileId) {
    // TODO: implement removeFile
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> removeMultipleFiles(List<int> fileIds) {
    // TODO: implement removeMultipleFiles
    throw UnimplementedError();
  }

  @override
  Future<MediaDirectoryEntity> renameDirectory(int directoryId, String name) {
    // TODO: implement renameDirectory
    throw UnimplementedError();
  }

  @override
  Future<MediaFileEntity> renameFile(int fileId, String name) {
    // TODO: implement renameFile
    throw UnimplementedError();
  }

  @override
  Future<MediaFileEntity> streamFile(int fileId) {
    // TODO: implement streamFile
    throw UnimplementedError();
  }

  @override
  Future<List<MediaFileEntity>> uploadFiles(List<MediaFileEntity> files) {
    // TODO: implement uploadFiles
    throw UnimplementedError();
  }

  @override
}
