import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileRepresentation extends StatelessWidget {
  final int fileId;
  final String name;
  final String fileType;

  const FileRepresentation({
    super.key,
    required this.fileId,
    required this.name,
    required this.fileType,
  });

  @override
  Widget build(BuildContext context) {
    if (fileType == 'media') {
      return IconButton(
        icon: Icon(Icons.file_open),
        color: Colors.black,
        onPressed: () =>
            context.read<MediaCloudBloc>().add(StreamFileEvent(fileId)),
      );
    } else {
      return IconButton(
        icon: Icon(Icons.folder),
        color: Colors.black,
        onPressed: () =>
            context.read<MediaCloudBloc>().add(GetFilesEvent(fileId)),
      );
    }
  }
}
