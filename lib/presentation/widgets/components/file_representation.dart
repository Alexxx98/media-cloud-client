import 'package:client/business_logic/entities/file.dart';
import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileRepresentation extends StatelessWidget {
  final FileEntity file;

  const FileRepresentation({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    if (file.type == 'media') {
      return Column(
        children: [
          IconButton(
            icon: Icon(Icons.file_open),
            color: Colors.black,
            onPressed: () =>
                context.read<MediaCloudBloc>().add(StreamFileEvent(file.id!)),
          ),
          Text(file.name),
        ],
      );
    } else {
      return Column(
        children: [
          IconButton(
            icon: Icon(Icons.folder),
            color: Colors.blueGrey.shade900,
            iconSize: 75,
            onPressed: () =>
                context.read<MediaCloudBloc>().add(GetFilesEvent(file.id!)),
          ),
          Text(file.name, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );
    }
  }
}
