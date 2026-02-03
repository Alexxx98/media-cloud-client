import 'dart:typed_data';

import 'package:client/business_logic/entities/file.dart';

abstract class MediaCloudEvent {
  MediaCloudEvent();
}

class GetFilesEvent extends MediaCloudEvent {
  final int? parentId;

  GetFilesEvent(this.parentId);
}

class DownloadFileEvent extends MediaCloudEvent {
  final int fileId;

  DownloadFileEvent(this.fileId);
}

class DownloadMultipleFilesEvent extends MediaCloudEvent {
  final List<int> fileIds;

  DownloadMultipleFilesEvent(this.fileIds);
}

class StreamFileEvent extends MediaCloudEvent {
  final int fileId;

  StreamFileEvent(this.fileId);
}

class CreateDirectoryEvent extends MediaCloudEvent {
  final FileEntity directory;

  CreateDirectoryEvent(this.directory);
}

class UploadFilesEvent extends MediaCloudEvent {
  final List<Uint8List> files;

  UploadFilesEvent(this.files);
}

class RenameFileEvent extends MediaCloudEvent {
  final String name;

  RenameFileEvent(this.name);
}

class ChangePasswordEvent extends MediaCloudEvent {
  final String password;

  ChangePasswordEvent(this.password);
}

class DeleteDirectory extends MediaCloudEvent {
  final int directoryId;
  final String? password;

  DeleteDirectory(this.directoryId, this.password);
}

class RemoveFile extends MediaCloudEvent {
  final int fileId;

  RemoveFile(this.fileId);
}

class RemoveMultipleFiles extends MediaCloudEvent {
  final List<int> fileIds;

  RemoveMultipleFiles(this.fileIds);
}
