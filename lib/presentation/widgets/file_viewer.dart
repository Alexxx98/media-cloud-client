import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';
import 'package:client/presentation/widgets/components/file_representation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileViewer extends StatelessWidget {
  const FileViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaCloudBloc mediaCloudBloc = context.read<MediaCloudBloc>();
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      body: BlocConsumer<MediaCloudBloc, MediaCloudState>(
        listener: (context, state) {
          if (state is DirectoryCreated) {
            if (state.currentDirectoryId == null) {
              mediaCloudBloc.add(GetRootEvent());
            } else {
              mediaCloudBloc.add(GetFilesEvent(state.currentDirectoryId!));
            }
          }
          if (state is CloudError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is FilesLoaded && state.files != null) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: state.files!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FileRepresentation(file: state.files![index]),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
