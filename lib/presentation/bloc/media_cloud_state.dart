import 'package:client/business_logic/entities/file.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

enum FileExplorerStatus { loading, success, error }

class MediaCloudState extends Equatable {
  final FileExplorerStatus status;
  final FileEntity? currentDirectory;
  final List<FileEntity>? loadedFiles;
  final Uint8List? fileBytes;
  final List<PlatformFile>? pickedFiles;
  final String? errorMessage;

  const MediaCloudState({
    this.status = FileExplorerStatus.loading,
    this.currentDirectory,
    this.loadedFiles,
    this.fileBytes,
    this.pickedFiles,
    this.errorMessage,
  });

  // copyWith method allows to store parameters data across multiple emits
  // The copyWIth name is just a convention, not built in flutter method to override
  MediaCloudState copyWith({
    FileExplorerStatus? status,
    FileEntity? currentDirectory,
    List<FileEntity>? loadedFiles,
    Uint8List? fileBytes,
    List<PlatformFile>? pickedFiles,
    bool? isLoading,
    String? errorMessage,
  }) {
    return MediaCloudState(
      // If new parameter value is passed, use it, if not, keep the current one
      status: status ?? this.status,
      currentDirectory: currentDirectory ?? this.currentDirectory,
      loadedFiles: loadedFiles ?? this.loadedFiles,
      fileBytes: fileBytes,
      pickedFiles: pickedFiles,
      // Error message does not require to be state persistant
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    currentDirectory,
    loadedFiles,
    fileBytes,
    pickedFiles,
    errorMessage,
  ];
}
