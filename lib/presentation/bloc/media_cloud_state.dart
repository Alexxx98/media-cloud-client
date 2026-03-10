import 'package:client/business_logic/entities/file.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

enum FileExplorerStatus { loading, loadedFiles, pickedFiles, error }

class FileExplorerState extends Equatable {
  final FileExplorerStatus status;
  final FileEntity? currentDirectory;
  final List<FileEntity>? loadedFiles;
  final List<PlatformFile>? pickedFiles;
  final String? errorMessage;

  const FileExplorerState({
    this.status = FileExplorerStatus.loading,
    this.currentDirectory,
    this.loadedFiles,
    this.pickedFiles,
    this.errorMessage,
  });

  // copyWith method allows to store parameters data across multiple emitts
  // The copyWIth name is just a convention, not built in flutter method to override
  FileExplorerState copyWith({
    FileEntity? currentDirectory,
    List<FileEntity>? loadedFiles,
    List<PlatformFile>? pickedFiles,
    bool? isLoading,
    String? errorMessage,
  }) {
    return FileExplorerState(
      // If new parameter value is passed, use it, if not, keep the current one
      status: status,
      currentDirectory: currentDirectory ?? this.currentDirectory,
      loadedFiles: loadedFiles ?? this.loadedFiles,
      pickedFiles: pickedFiles ?? this.pickedFiles,

      // Error message does not require to be state persistant
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    currentDirectory,
    loadedFiles,
    pickedFiles,
    errorMessage,
  ];
}
