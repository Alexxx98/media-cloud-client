// Generate part file: dart run build_runner build

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:client/data/models/file.dart';

import 'package:client/core/constants.dart';

part 'media_cloud_api_service.g.dart';

@RestApi(baseUrl: mediaCloudApiServiceURL)
abstract class MediaCloudApiService {
  factory MediaCloudApiService(Dio dio) = _MediaCloudApiService;

  // GET METHODS
  // Get app root
  @GET('/root')
  Future<List<FileModel>> getRoot();

  // Get files and directories of parent directory
  @GET('/directory/{directoryId}')
  Future<List<FileModel>> getFiles(@Path('directoryId') int parentId);

  // Download single file
  @GET('/file/{fileId}/download')
  Future<Stream<List<int>>> downloadFile(@Path('fileId') int fileId);

  // Download multiple files
  @GET('/files/download')
  Future<Stream<List<int>>> downloadMultipleFiles(
    @Query('fileIds') List<int> fileIds,
  );

  @GET('/directory/{directoryId}/download')
  Future<Stream<List<int>>> downloadDirectory(
    @Path('directoryId') int directoryId,
    @Header('x-directory-password') Map<String, String?> passwordHeader,
  );

  // Stream File
  @GET('file/{fileId}/stream')
  Future<Stream<List<int>>> streamFile(@Path('fileId') int fileId);

  // POST METHODS
  // Create directory
  @POST('/directory/create')
  Future<FileModel> createDirectory(@Body() Map<String, dynamic> body);

  // Upload files
  @POST('/file/upload')
  Future<List<FileModel>> uploadFiles(@Body() FormData body);

  // PATCH METHODS
  // Rename directory
  @PATCH('/directory/{directoryId}/rename')
  Future<FileModel> renameDirectory(
    @Path('directoryId') int directoryId,
    @Header('x-directory-password') Map<String, String?>? passwordHeader,
    @Body() Map<String, String> body,
  );

  // Rename file
  @PATCH('/file/{fileId}/rename')
  Future<FileModel> renameFile(
    @Path('fileId') int fileId,
    @Body() Map<String, String> body,
  );

  // Change directory's password
  @PATCH('/directory/{directoryId}/change_password')
  Future<Map<String, String>> changePassword(
    @Path('directoryId') int directoryId,
    @Body() Map<String, String> body,
  );

  // DELETE METHODS
  // Delete directory
  @DELETE('/directory/{directoryId}/delete')
  Future<Map<String, String>> deleteDirectory(
    @Path('directoryId') int directoryId,
    @Header('x-directory-password') Map<String, String> passwordHeader,
  );

  // Delete file
  @DELETE('/file/{fileId}/delete')
  Future<Map<String, String>> removeFile(@Path('fileId') int fileId);

  // Delete multiple files
  @DELETE('/files/delete')
  Future<Map<String, String>> removeMultipleFiles(
    @Query('fileIds') Map<String, List<int>> query,
  );
}
