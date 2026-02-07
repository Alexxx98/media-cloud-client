import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';
import 'package:client/presentation/widgets/file_representation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileViewer extends StatelessWidget {
  const FileViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCloudBloc, MediaCloudState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade600,
          body: BlocBuilder<MediaCloudBloc, MediaCloudState>(
            builder: (context, state) {
              if (state.currentDirectoryId == null) {
                context.read<MediaCloudBloc>().add(GetRootEvent());
              } else {
                context.read<MediaCloudBloc>().add(
                  GetFilesEvent(state.currentDirectoryId!),
                );
              }

              if (state is FilesLoaded && state.files != null) {
                return GridView.builder(
                  itemCount: state.files!.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: FileRepresentation(
                        fileId: state.files![index].id!,
                        name: state.files![index].name,
                        fileType: state.files![index].type!,
                      ),
                    );
                  },
                );
              }

              if (state is CloudLoading) {
                return CircularProgressIndicator();
              }

              return SizedBox();
            },
          ),
        );
      },
    );
  }
}
