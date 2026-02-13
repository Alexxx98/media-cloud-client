import 'package:client/business_logic/use_cases/remove_multiple_files.dart';
import 'package:client/core/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';

import 'package:client/business_logic/use_cases/change_password.dart';
import 'package:client/business_logic/use_cases/create_directory.dart';
import 'package:client/business_logic/use_cases/delete_directory.dart';
import 'package:client/business_logic/use_cases/download_directory.dart';
import 'package:client/business_logic/use_cases/download_file.dart';
import 'package:client/business_logic/use_cases/download_multiple_files.dart';
import 'package:client/business_logic/use_cases/get_files.dart';
import 'package:client/business_logic/use_cases/get_root.dart';
import 'package:client/business_logic/use_cases/remove_file.dart';
import 'package:client/business_logic/use_cases/rename_directory.dart';
import 'package:client/business_logic/use_cases/rename_file.dart';
import 'package:client/business_logic/use_cases/stream_file.dart';
import 'package:client/business_logic/use_cases/upload_files.dart';

class MediaCloudBloc extends Bloc<MediaCloudEvent, MediaCloudState> {
  final GetRoot getRootUseCase;
  final GetFiles getFileUseCase;
  final DownloadDirectory downloadDirectoryUseCase;
  final DownloadFile downloadFileUseCase;
  final DownloadMultipleFiles downloadMultipleFilesUseCase;
  final StreamFile streamFileUseCase;
  final CreateDirectory createDirectoryUseCase;
  final UploadFiles uploadFilesUseCase;
  final RenameDirectory renameDirectoryUseCase;
  final RenameFile renameFileUseCase;
  final ChangePassword changePasswordUseCase;
  final DeleteDirectory deleteDirectoryUseCase;
  final RemoveFile removeFileUseCase;
  final RemoveMultipleFiles removeMultipleFilesUseCase;
  MediaCloudBloc({
    required this.getRootUseCase,
    required this.getFileUseCase,
    required this.downloadDirectoryUseCase,
    required this.downloadFileUseCase,
    required this.downloadMultipleFilesUseCase,
    required this.streamFileUseCase,
    required this.createDirectoryUseCase,
    required this.uploadFilesUseCase,
    required this.renameDirectoryUseCase,
    required this.renameFileUseCase,
    required this.changePasswordUseCase,
    required this.deleteDirectoryUseCase,
    required this.removeFileUseCase,
    required this.removeMultipleFilesUseCase,
  }) : super(CloudInitial()) {
    on<GetRootEvent>(_onRootLoaded);
    on<GetFilesEvent>(_onFilesLoaded);
    on<DownloadDirectoryEvent>(_onDownloadDirectory);
    on<DownloadFileEvent>(_onDownloadFile);
    on<DownloadMultipleFilesEvent>(_onDownloadMultipleFiles);
    on<StreamFileEvent>(_onStreamFile);
    on<CreateDirectoryEvent>(_onCreateDirectory);
    on<PickFilesEvent>(_onPickFiles);
    on<UploadFilesEvent>(_onUploadFiles);
    on<RenameDirectoryEvent>(_onRenameDirectory);
    on<RenameFileEvent>(_onRenameFile);
    on<ChangePasswordEvent>(_onChangePassword);
    on<DeleteDirectoryEvent>(_onDeleteDirectory);
    on<RemoveFileEvent>(_onRemoveFile);
    on<RemoveMultipleFilesEvent>(_onRemoveMultipleFiles);
  }

  Future<void> _onRootLoaded(
    GetRootEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await getRootUseCase();
    if (dataState is DataSuccess) {
      emit(FilesLoaded(null, null, dataState.data!));
    } else {
      emit(CloudError('Could not load cloud root'));
    }
  }

  Future<void> _onFilesLoaded(
    GetFilesEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await getFileUseCase(event.directoryId);
    if (dataState is DataSuccess) {
      emit(
        FilesLoaded(event.directoryId, event.directoryParentId, dataState.data),
      );
    } else {
      emit(CloudError("Could not load directory's files"));
    }
  }

  Future<void> _onDownloadDirectory(
    DownloadDirectoryEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await downloadDirectoryUseCase(
      event.directoryId,
      event.password,
    );
    if (dataState is DataSuccess && dataState.data != null) {
      emit(FilesDownloaded());
    } else {
      emit(CloudError('Could not download the directory'));
    }
  }

  Future<void> _onDownloadFile(
    DownloadFileEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await downloadFileUseCase(event.fileId);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(FilesDownloaded());
    } else {
      emit(CloudError('Could not download file.'));
    }
  }

  Future<void> _onDownloadMultipleFiles(
    DownloadMultipleFilesEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await downloadMultipleFilesUseCase(event.fileIds);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(FilesDownloaded());
    } else {
      emit(CloudError('Could not download files.'));
    }
  }

  Future<void> _onStreamFile(
    StreamFileEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await streamFileUseCase(event.fileId);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(StreamingFile(dataState.data!));
    } else {
      emit(CloudError('Unable to stream the file'));
    }
  }

  Future<void> _onCreateDirectory(
    CreateDirectoryEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await createDirectoryUseCase(event.directory);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(DirectoryCreated(dataState.data!));
    } else {
      emit(CloudError('Could not create the directory.'));
    }
  }

  Future<void> _onPickFiles(
    PickFilesEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(FilesPicked(event.files));
  }

  Future<void> _onUploadFiles(
    UploadFilesEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await uploadFilesUseCase(
      event.directoryId,
      event.files,
      event.uploadedBy,
    );
    if (dataState is DataSuccess && dataState.data != null) {
      emit(FilesUploaded(dataState.data!));
    } else {
      emit(CloudError('Unable to upload files.'));
    }
  }

  Future<void> _onRenameDirectory(
    RenameDirectoryEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await renameDirectoryUseCase(
      event.directoryId,
      event.name,
      event.password,
    );
    if (dataState is DataSuccess && dataState != null) {
      emit(FileRenamed(dataState.data!));
    } else {
      emit(CloudError('Unable to rename the directory.'));
    }
  }

  Future<void> _onRenameFile(
    RenameFileEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await renameFileUseCase(event.fileId, event.name);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(FileRenamed(dataState.data!));
    } else {
      emit(CloudError('Unable to rename the file'));
    }
  }

  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await changePasswordUseCase(
      event.directoryId,
      event.currentPassword,
      event.newPassword,
    );
    if (dataState is DataSuccess && dataState != null) {
      emit(PasswordChanged());
    } else {
      emit(CloudError('Unable to change the password.'));
    }
  }

  Future<void> _onDeleteDirectory(
    DeleteDirectoryEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await deleteDirectoryUseCase(
      event.directoryId,
      event.password,
    );
    if (dataState is DataSuccess && dataState.data != null) {
      emit(FileRemoved());
    } else {
      emit(CloudError('Could not delete the directory.'));
    }
  }

  Future<void> _onRemoveFile(
    RemoveFileEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await removeFileUseCase(event.fileId);
    if (dataState is DataState && dataState.data != null) {
      emit(FileRemoved());
    }
  }

  Future<void> _onRemoveMultipleFiles(
    RemoveMultipleFilesEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(CloudLoading());
    final dataState = await removeMultipleFilesUseCase(event.fileIds);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(FileRemoved());
    } else {
      emit(CloudError('Could remove files.'));
    }
  }
}
