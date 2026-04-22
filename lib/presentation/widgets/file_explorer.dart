import 'package:client/business_logic/entities/file.dart';
import 'package:client/data/models/file.dart';
import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';
import 'package:client/presentation/widgets/components/file_representation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileExplorer extends StatelessWidget {
  const FileExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    MediaCloudBloc mediaCloudBloc = context.read<MediaCloudBloc>();

    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      body: BlocBuilder<MediaCloudBloc, MediaCloudState>(
        builder: (context, state) {
          switch (state.status) {
            case FileExplorerStatus.loading:
              return CircularProgressIndicator();
            case FileExplorerStatus.success:
              if (state.loadedFiles != null) {
                List<FileEntity> files = state.loadedFiles!;
                if (state.currentDirectory != null) {
                  if (files.isEmpty) {
                    files.insert(0, FileModel(name: 'Previous'));
                  }
                  try {
                    if (files[0].name != 'Previous') {
                      files.insert(0, FileModel(name: 'Previous'));
                    }
                  } on Exception {
                    // Do nothing
                  }
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    if (files[index].name == 'Previous') {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(Icons.subdirectory_arrow_left),
                          iconSize: 75,
                          onPressed: () {
                            if (state.currentDirectory!.parentId != null) {
                              mediaCloudBloc.add(
                                OpenPreviousDirectoryEvent(
                                  state.currentDirectory!.parentId!,
                                ),
                              );
                            } else {
                              mediaCloudBloc.add(OpenDirectoryEvent(null));
                            }
                          },
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FileRepresentation(file: files[index]),
                      );
                    }
                  },
                );
              } else {
                return SizedBox();
              }
            case FileExplorerStatus.error:
              return SizedBox(child: Text(state.errorMessage!));
          }
        },
      ),
    );
  }
}
