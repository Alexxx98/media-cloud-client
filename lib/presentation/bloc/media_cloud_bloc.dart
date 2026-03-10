import 'dart:io';

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
import 'package:client/business_logic/use_cases/open_directory.dart';
import 'package:client/business_logic/use_cases/get_root.dart';
import 'package:client/business_logic/use_cases/remove_file.dart';
import 'package:client/business_logic/use_cases/rename_directory.dart';
import 'package:client/business_logic/use_cases/rename_file.dart';
import 'package:client/business_logic/use_cases/stream_file.dart';
import 'package:client/business_logic/use_cases/upload_files.dart';

class MediaCloudBloc extends Bloc<MediaCloudEvent, FileExplorerState> {
  final GetRoot getRootUseCase;
  final OpenDirectory getFileUseCase;
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
  }) : super(FileExplorerState()) {
    on<GetRootEvent>(_onRootLoaded);
    on<GetFilesEvent>(_onFilesLoaded);
    on<CreateDirectoryEvent>(_onCreateDirectory);
    on<PickFilesEvent>(_onFilesPicked);
    on<CreateDirectoryEvent>(_onCreateDirectory);
  }

  Future<void> _onRootLoaded(
    GetRootEvent event,
    Emitter<FileExplorerState> emit,
  ) async {
    final currentDirectory = state.currentDirectory;
    emit(
      FileExplorerState(currentDirectory: currentDirectory, isLoading: true),
    );
    final dataState = await getRootUseCase();
    if (dataState is DataSuccess) {
      emit(FileExplorerState(loadedFiles: dataState.data, isLoading: false));
    } else {
      emit(ErrorState('Unable to load root files'));
    }
  }

  Future<void> _onFilesLoaded(
    GetFilesEvent event,
    Emitter<FileExplorerState> emit,
  ) async {
    emit(FileExplorerState(isLoading: true));
    final dataState = await getFileUseCase(event.directory.id!);
    if (dataState is DataSuccess) {
      emit(
        FileExplorerState(
          currentDirectory: event.directory,
          loadedFiles: dataState.data,
          isLoading: false,
        ),
      );
    } else {
      emit(ErrorState('Cannot fetch the directory files data'));
    }
  }

  Future<void> _onCreateDirectory(
    CreateDirectoryEvent event,
    Emitter<FileExplorerState> emit,
  ) async {
    final currentDirectory = state.currentDirectory;
    final loadedFiles = state.loadedFiles;
    emit(
      FileExplorerState(
        currentDirectory: currentDirectory,
        loadedFiles: loadedFiles,
        isLoading: true,
      ),
    );
    final dataState = await createDirectoryUseCase(event.directory);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(
        FileExplorerState(
          currentDirectory: currentDirectory,
          loadedFiles: loadedFiles,
          isLoading: false,
        ),
      );
    } else {
      emit(ErrorState('Cannot create a new directory'));
    }
  }

  void _onFilesPicked(PickFilesEvent event, Emitter<FileExplorerState> emit) {
    final currentDirectory = state.currentDirectory;
    final loadedFiles = state.loadedFiles;
    emit(
      FileExplorerState(
        currentDirectory: currentDirectory,
        loadedFiles: loadedFiles,
        pickedFiles: event.files,
      ),
    );
  }
}
