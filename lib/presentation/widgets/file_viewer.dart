import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';
import 'package:client/presentation/widgets/forms/create_directory_form.dart';
import 'package:client/presentation/widgets/components/file_representation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileViewer extends StatefulWidget {
  const FileViewer({super.key});

  @override
  State<FileViewer> createState() => _FileViewer();
}

class _FileViewer extends State<FileViewer> {
  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MediaCloudBloc>().add(GetRootEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCloudBloc, MediaCloudState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade600,
          body: BlocBuilder<MediaCloudBloc, MediaCloudState>(
            builder: (context, state) {
              if (state is FilesLoaded) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(Icons.create_new_folder),
                            onPressed: () {
                              final cloudBloc = context.read<MediaCloudBloc>();

                              showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return CreateDirectoryForm(
                                    parentId: state.parentId,
                                    bloc: cloudBloc,
                                  );
                                },
                              );
                            },
                            iconSize: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(Icons.upload_file),
                            onPressed: () {},
                            iconSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              if (state is CloudError) {
                print(state.message);
              }
              return SizedBox();
            },
          ),
        );
      },
    );
  }
}
