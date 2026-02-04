import 'package:client/business_logic/repository/media_cloud_repository.dart';
import 'package:client/business_logic/use_cases/change_password.dart';
import 'package:client/business_logic/use_cases/create_directory.dart';
import 'package:client/business_logic/use_cases/delete_directory.dart';
import 'package:client/business_logic/use_cases/download_directory.dart';
import 'package:client/business_logic/use_cases/download_file.dart';
import 'package:client/business_logic/use_cases/download_multiple_files.dart';
import 'package:client/business_logic/use_cases/get_files.dart';
import 'package:client/business_logic/use_cases/get_root.dart';
import 'package:client/business_logic/use_cases/remove_file.dart';
import 'package:client/business_logic/use_cases/remove_multiple_files.dart';
import 'package:client/business_logic/use_cases/rename_directory.dart';
import 'package:client/business_logic/use_cases/rename_file.dart';
import 'package:client/business_logic/use_cases/stream_file.dart';
import 'package:client/business_logic/use_cases/upload_files.dart';
import 'package:client/data/data_source/remote/media_cloud_api_service.dart';
import 'package:client/data/repository/media_cloud_repository_impl.dart';
import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final get_it = GetIt.instance;

Future<void> initializeDependencies() async {
  get_it.registerSingleton<Dio>(Dio());

  get_it.registerSingleton<MediaCloudApiService>(
    MediaCloudApiService(get_it()),
  );
  get_it.registerSingleton<MediaCloudRepository>(
    MediaCloudRepositoryImpl(get_it<MediaCloudApiService>()),
  );

  // Use Cases
  get_it.registerSingleton<GetRoot>(GetRoot(get_it()));
  get_it.registerSingleton<GetFiles>(GetFiles(get_it()));
  get_it.registerSingleton<DownloadDirectory>(DownloadDirectory(get_it()));
  get_it.registerSingleton<DownloadFile>(DownloadFile(get_it()));
  get_it.registerSingleton<DownloadMultipleFiles>(
    DownloadMultipleFiles(get_it()),
  );
  get_it.registerSingleton<StreamFile>(StreamFile(get_it()));
  get_it.registerSingleton<CreateDirectory>(CreateDirectory(get_it()));
  get_it.registerSingleton<UploadFiles>(UploadFiles(get_it()));
  get_it.registerSingleton<RenameDirectory>(RenameDirectory(get_it()));
  get_it.registerSingleton<RenameFile>(RenameFile(get_it()));
  get_it.registerSingleton<ChangePassword>(ChangePassword(get_it()));
  get_it.registerSingleton<DeleteDirectory>(DeleteDirectory(get_it()));
  get_it.registerSingleton<RemoveFile>(RemoveFile(get_it()));
  get_it.registerSingleton<RemoveMultipleFiles>(RemoveMultipleFiles(get_it()));

  // Blocs
  get_it.registerFactory<MediaCloudBloc>(
    () => MediaCloudBloc(
      getRootUseCase: get_it(),
      getFileUseCase: get_it(),
      downloadDirectoryUseCase: get_it(),
      downloadFileUseCase: get_it(),
      downloadMultipleFilesUseCase: get_it(),
      streamFileUseCase: get_it(),
      createDirectoryUseCase: get_it(),
      uploadFilesUseCase: get_it(),
      renameDirectoryUseCase: get_it(),
      renameFileUseCase: get_it(),
      changePasswordUseCase: get_it(),
      deleteDirectoryUseCase: get_it(),
      removeFileUseCase: get_it(),
      removeMultipleFilesUseCase: get_it(),
    ),
  );
}
