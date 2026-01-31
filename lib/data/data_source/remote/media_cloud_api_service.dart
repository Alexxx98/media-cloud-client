// Generate part file: dart run build_runner build

import 'package:client/data/models/media_file.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:client/data/models/media_directory.dart';

import 'package:client/core/constants.dart';

part 'media_cloud_api_service.g.dart';

@RestApi(baseUrl: mediaCloudApiServiceURL)
abstract class MediaCloudApiService {
  factory MediaCloudApiService(Dio dio) = _MediaCloudApiService;

  // GET METHODS
  // Get app root
  @GET('/root')
  Future<List<MediaDirectoryModel>> getRoot();

  // Get files and directories of parent directory
  @GET('/directory/{directoryId}')
  Future<List<Map<String, dynamic>>> getFiles(
    @Path('directoryId') int parentId,
  );

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
    @Header('x-directory-password') String password,
    @Path('directoryId') int directoryId,
  );

  // POST METHODS
  // Create directory
  @POST('/directory/create')
  Future<MediaDirectoryModel> createDirectory(
    @Body() Map<String, dynamic> body,
  );

  // Upload files
  @POST('/file/upload')
  Future<List<MediaFileModel>> uploadFiles(List<MediaFileModel> mediaFiles);

  // PATCH METHODS
  // Rename directory
  @PATCH('/directory/{directoryId}/rename')
  Future<MediaDirectoryModel> renameDirectory(
    @Path('directoryId') int directoryId,
    @Header('x-direcotry-password') String password,
    @Body() Map<String, String> body,
  );

  // Rename file
  @PATCH('/file/{fileId}/rename')
  Future<MediaFileModel> renameFile(
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
    @Path('directoryId') int diretoryId,
  );

  // Delete file
  @DELETE('/file/{fileId}/delete')
  Future<Map<String, String>> deleteFile(@Path('fileId') int fileId);

  // Delete multiple files
  @DELETE('/files/delete')
  Future<Map<String, String>> deleteMultipleFiles(
    @Query('fileIds') List<int> fileIds,
  );
}
