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
    final MediaCloudBloc mediaCloudBloc = context.read<MediaCloudBloc>();

    if (file.type == 'media') {
      // File
      return Column(
        children: [
          IconButton(
            icon: Icon(Icons.file_open),
            color: Colors.blueGrey.shade900,
            onPressed: () => mediaCloudBloc.add(StreamFileEvent(file.id!)),
          ),
          Text(file.name),
        ],
      );
    } else {
      // Directory
      return Column(
        children: [
          IconButton(
            icon: Icon(Icons.folder),
            color: Colors.blueGrey.shade900,
            iconSize: 75,
            onPressed: () {
              if (file.password != null) {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(child: Container(child: TextField()));
                  },
                );
              }
              mediaCloudBloc.add(
                GetFilesEvent(file.id!, file.parentId, file.password),
              );
            },
          ),
          Text(file.name, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );
    }
  }
}
