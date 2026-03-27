import 'package:client/business_logic/entities/file.dart';
import 'package:client/business_logic/use_cases/open_directory.dart';
import 'package:client/business_logic/use_cases/open_previous_directory.dart';
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
import 'package:client/business_logic/use_cases/remove_file.dart';
import 'package:client/business_logic/use_cases/rename_directory.dart';
import 'package:client/business_logic/use_cases/rename_file.dart';
import 'package:client/business_logic/use_cases/stream_file.dart';
import 'package:client/business_logic/use_cases/upload_files.dart';

class MediaCloudBloc extends Bloc<MediaCloudEvent, MediaCloudState> {
  final OpenDirectory openDirectoryUseCase;
  final OpenPreviousDirectory openPreviousDirectoryUseCase;
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
    required this.openDirectoryUseCase,
    required this.openPreviousDirectoryUseCase,
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
  }) : super(MediaCloudState()) {
    on<OpenDirectoryEvent>(_onOpenDirectory);
    on<OpenPreviousDirectoryEvent>(_onOpenPreviousDirectory);
    on<CreateDirectoryEvent>(_onCreateDirectory);
    on<PickFilesEvent>(_onPickFiles);
    on<UploadFilesEvent>(_onUploadFiles);
    on<StreamFileEvent>(_onStreamFile);
  }

  // On open directory event
  Future<void> _onOpenDirectory(
    OpenDirectoryEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(MediaCloudState(status: FileExplorerStatus.loading));
    DataState<List<FileEntity>> dataState;
    if (event.directory != null) {
      dataState = await openDirectoryUseCase(event.directory!.id);
    } else {
      dataState = await openDirectoryUseCase(null);
    }
    if (dataState is DataSuccess) {
      emit(
        MediaCloudState(
          status: FileExplorerStatus.success,
          loadedFiles: dataState.data,
          currentDirectory: event.directory,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FileExplorerStatus.error,
          errorMessage: 'Cannot fetch the directory data',
        ),
      );
    }
  }

  // On open previous directory event
  Future<void> _onOpenPreviousDirectory(
    OpenPreviousDirectoryEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(MediaCloudState(status: FileExplorerStatus.loading));
    final dataState = await openPreviousDirectoryUseCase(
      event.currentDirectoryId,
    );
    if (dataState is DataSuccess && dataState.data != null) {
      emit(
        MediaCloudState(
          status: FileExplorerStatus.success,
          loadedFiles: dataState.data!.files,
          currentDirectory: dataState.data!.directory,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FileExplorerStatus.error,
          errorMessage: 'Unable to load the previous directory',
        ),
      );
    }
  }

  Future<void> _onCreateDirectory(
    CreateDirectoryEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(state.copyWith(status: FileExplorerStatus.loading));
    final dataState = await createDirectoryUseCase(event.directory);
    if (dataState is DataSuccess) {
      add(OpenDirectoryEvent(state.currentDirectory));
    } else {
      emit(
        state.copyWith(
          status: FileExplorerStatus.error,
          errorMessage: 'Could not create a new directory.',
        ),
      );
    }
  }

  void _onPickFiles(PickFilesEvent event, Emitter<MediaCloudState> emit) {
    emit(
      state.copyWith(status: FileExplorerStatus.loading, errorMessage: null),
    );
    emit(
      state.copyWith(
        status: FileExplorerStatus.success,
        pickedFiles: event.files,
      ),
    );
  }

  Future<void> _onUploadFiles(
    UploadFilesEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(
      state.copyWith(status: FileExplorerStatus.loading, errorMessage: null),
    );
    add(OpenDirectoryEvent(state.currentDirectory));
    final dataState = await uploadFilesUseCase(
      event.directoryId,
      event.filesNames,
      event.filesBytes,
      event.uploadedBy,
    );
    if (dataState is DataSuccess) {
      emit(state.copyWith(status: FileExplorerStatus.success));
    } else {
      emit(
        state.copyWith(
          status: FileExplorerStatus.error,
          errorMessage: 'Unable to upload your files',
        ),
      );
    }
  }

  Future<void> _onStreamFile(
    StreamFileEvent event,
    Emitter<MediaCloudState> emit,
  ) async {
    emit(state.copyWith(status: FileExplorerStatus.loading));
    final dataState = await streamFileUseCase(event.fileId);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(
        state.copyWith(
          status: FileExplorerStatus.success,
          fileBytes: dataState.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FileExplorerStatus.error,
          errorMessage: 'Unable to stream the chosen file.',
        ),
      );
    }
  }
}
