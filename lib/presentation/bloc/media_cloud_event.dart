import 'dart:typed_data';

import 'package:client/business_logic/entities/file.dart';

abstract class MediaCloudEvent {
  MediaCloudEvent();
}

class GetRootEvent extends MediaCloudEvent {
  GetRootEvent();
}

class GetFilesEvent extends MediaCloudEvent {
  final int parentId;

  GetFilesEvent(this.parentId);
}

class DownloadDirectoryEvent extends MediaCloudEvent {
  final int directoryId;
  final String? password;

  DownloadDirectoryEvent(this.directoryId, this.password);
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
  final int directoryId;
  final List<Uint8List> files;
  final String? uploadedBy;

  UploadFilesEvent(this.directoryId, this.files, this.uploadedBy);
}

class RenameDirectoryEvent extends MediaCloudEvent {
  final int directoryId;
  final String name;
  final String? password;

  RenameDirectoryEvent(this.directoryId, this.name, this.password);
}

class RenameFileEvent extends MediaCloudEvent {
  final int fileId;
  final String name;

  RenameFileEvent(this.fileId, this.name);
}

class ChangePasswordEvent extends MediaCloudEvent {
  final int directoryId;
  final String currentPassword;
  final String newPassword;

  ChangePasswordEvent(this.directoryId, this.currentPassword, this.newPassword);
}

class DeleteDirectoryEvent extends MediaCloudEvent {
  final int directoryId;
  final String? password;

  DeleteDirectoryEvent(this.directoryId, this.password);
}

class RemoveFileEvent extends MediaCloudEvent {
  final int fileId;

  RemoveFileEvent(this.fileId);
}

class RemoveMultipleFilesEvent extends MediaCloudEvent {
  final List<int> fileIds;

  RemoveMultipleFilesEvent(this.fileIds);
}
