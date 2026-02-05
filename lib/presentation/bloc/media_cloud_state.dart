import 'package:client/business_logic/entities/file.dart';

abstract class MediaCloudState {
  final int? currentDirectoryId;

  MediaCloudState({this.currentDirectoryId});
}

class CloudInitial extends MediaCloudState {
  CloudInitial({super.currentDirectoryId});
}

class CloudLoading extends MediaCloudState {
  CloudLoading();
}

class FilesLoaded extends MediaCloudState {
  final List<FileEntity> files;

  FilesLoaded(this.files) : super(currentDirectoryId: files[0].parentId);
}

class FilesDownloaded extends MediaCloudState {
  FilesDownloaded();
}

class StreamingFile extends MediaCloudState {
  final List<int> file;

  StreamingFile(this.file);
}

class DirectoryCreated extends MediaCloudState {
  FileEntity directory;

  DirectoryCreated(this.directory);
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
