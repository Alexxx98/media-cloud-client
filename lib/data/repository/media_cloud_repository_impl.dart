import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:client/business_logic/entities/file.dart';
import 'package:client/business_logic/repository/media_cloud_repository.dart';

import 'package:client/data/models/file.dart';
import 'package:client/data/data_source/remote/media_cloud_api_service.dart';

import 'package:client/core/data_state.dart';

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
      print(e);
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
  Future<DataState<Uint8List>> downloadFile(int fileId) async {
    try {
      final response = await _apiService.downloadFile(fileId);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Download multiple files
  @override
  Future<DataState<Uint8List>> downloadMultipleFiles(List<int> fileIds) async {
    try {
      final response = await _apiService.downloadMultipleFiles(fileIds);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Download directory
  @override
  Future<DataState<Uint8List>> downloadDirectory(
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
  Future<DataState<Uint8List>> streamFile(int fileId) async {
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
      print(e);
      return DataFailed(e);
    }
  }

  // Upload files
  @override
  Future<DataState<List<FileModel>>> uploadFiles(
    int directoryId,
    List<Uint8List> files,
    String? uploadedBy,
  ) async {
    try {
      // Write all files as MultipartFile into a list
      List<MultipartFile> multipartFiles = [];
      for (int index = 0; index < files.length; index++) {
        MultipartFile multipartFile = MultipartFile.fromBytes(files[index]);
        multipartFiles.add(multipartFile);
      }
      // Create form data body
      final body = FormData.fromMap({
        'files': multipartFiles,
        'parent_id': directoryId,
        'uploaded_by': ?uploadedBy,
      });
      final response = await _apiService.uploadFiles(body);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // PATCH METHODS
  // Rename directory
  @override
  Future<DataState<FileModel>> renameDirectory(
    int directoryId,
    String name,
    String? password,
  ) async {
    try {
      final passwordHeader = {'x-directory-password': password};
      final body = {'original_name': name};
      final response = await _apiService.renameDirectory(
        directoryId,
        passwordHeader,
        body,
      );
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Change directory's password
  @override
  Future<DataState<Map<String, String>>> changePassword(
    int directoryId,
    String currentPassword,
    String newPassword,
  ) async {
    try {
      final body = {
        'current_password': currentPassword,
        'new_password': newPassword,
      };
      final response = await _apiService.changePassword(directoryId, body);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Rename file
  @override
  Future<DataState<FileModel>> renameFile(int fileId, String name) async {
    try {
      final body = {'original_name': name};
      final response = await _apiService.renameFile(fileId, body);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // DELETE METHODS
  // Delete directory
  @override
  Future<DataState<Map<String, String>>> deleteDirectory(
    int directoryId,
    String? password,
  ) async {
    try {
      final passwordHeader = {'x-directory-password': password};
      final response = await _apiService.deleteDirectory(
        directoryId,
        passwordHeader,
      );
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Remove File
  @override
  Future<DataState<Map<String, String>>> removeFile(int fileId) async {
    try {
      final response = await _apiService.removeFile(fileId);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  // Remove multiple files
  @override
  Future<DataState<Map<String, String>>> removeMultipleFiles(
    List<int> fileIds,
  ) async {
    try {
      final query = {'file_ids': fileIds};
      final response = await _apiService.removeMultipleFiles(query);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
