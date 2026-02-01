import 'package:client/business_logic/entities/file.dart';
import 'package:client/data/models/file.dart';
import 'package:dio/dio.dart';

import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/core/data_state.dart';
import 'package:client/data/data_source/remote/media_cloud_api_service.dart';

class MediaCloudRepositoryImpl implements MediaCloudRepository {
  final MediaCloudApiService _apiService;

  MediaCloudRepositoryImpl(this._apiService);

  // GET METHODS
  // Get root
  @override
  Future<DataState<List<FileModel>>> getRoot() async {
    try {
      final response = await _apiService.getRoot();
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Get files from directory
  @override
  Future<DataState<List<FileModel>>> getFiles(int parentId) async {
    try {
      final response = await _apiService.getFiles(parentId);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // download file
  @override
  Future<DataState<Stream<List<int>>>> downloadFile(int fileId) async {
    try {
      final response = await _apiService.downloadFile(fileId);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Download multiple files
  @override
  Future<DataState<Stream<List<int>>>> downloadMultipleFiles(
    List<int> fileIds,
  ) async {
    try {
      final response = await _apiService.downloadMultipleFiles(fileIds);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Download directory
  @override
  Future<DataState<Stream<List<int>>>> downloadDirectory(
    int directoryId,
    String? password,
  ) async {
    try {
      final passwordHeader = {'x-directory-password': password};
      final response = await _apiService.downloadDirectory(
        directoryId,
        passwordHeader,
      );
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Stream file
  @override
  Future<DataState<Stream<List<int>>>> streamFile(int fileId) async {
    try {
      final response = await _apiService.streamFile(fileId);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // POST METHODS
  // Create directory
  @override
  Future<DataState<FileModel>> createDirectory(FileEntity directory) async {
    try {
      final body = {
        'name': directory.name,
        'parent_id': directory.parentId,
        'password': directory.password,
        'added_by': directory.addedBy,
      };
      final response = await _apiService.createDirectory(body);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Upload files
}
