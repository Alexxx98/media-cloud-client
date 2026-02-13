import 'package:client/business_logic/entities/file.dart';
import 'package:file_picker/file_picker.dart';

abstract class MediaCloudState {
  MediaCloudState();
}

class CloudInitial extends MediaCloudState {
  CloudInitial();
}

class CloudLoading extends MediaCloudState {
  CloudLoading();
}

class FilesLoaded extends MediaCloudState {
  final int? currentDirectoryId;
  final int? currentDirectoryParentId;
  final List<FileEntity>? files;

  FilesLoaded(
    this.currentDirectoryId,
    this.currentDirectoryParentId,
    this.files,
  );
}

class FilesDownloaded extends MediaCloudState {
  FilesDownloaded();
}

class StreamingFile extends MediaCloudState {
  final List<int> file;

  StreamingFile(this.file);
}

class DirectoryCreated extends MediaCloudState {
  final FileEntity directory;

  DirectoryCreated(this.directory);
}

class FilesPicked extends MediaCloudState {
  final List<PlatformFile> files;

  FilesPicked(this.files);
}

class FilesUploaded extends MediaCloudState {
  final List<FileEntity> files;

  FilesUploaded(this.files);
}

class FileRenamed extends MediaCloudState {
  final FileEntity file;

  FileRenamed(this.file);
}

class PasswordChanged extends MediaCloudState {
  PasswordChanged();
}

class FileRemoved extends MediaCloudState {
  FileRemoved();
}

class CloudError extends MediaCloudState {
  final String message;

  CloudError(this.message);
}
