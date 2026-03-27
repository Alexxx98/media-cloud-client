import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileViewer extends StatefulWidget {
  final int fileId;
  final MediaCloudBloc bloc;

  const FileViewer({super.key, required this.fileId, required this.bloc});

  @override
  State<FileViewer> createState() => _FileViewerState();
}

class _FileViewerState extends State<FileViewer> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(StreamFileEvent(widget.fileId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCloudBloc, MediaCloudState>(
      bloc: widget.bloc,
      builder: (context, state) {
        switch (state.status) {
          case (FileExplorerStatus.loading):
            return CircularProgressIndicator();
          case (FileExplorerStatus.error):
            return Text(state.errorMessage!);
          case (FileExplorerStatus.success):
            if (state.fileBytes != null) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(child: Image.memory(state.fileBytes!))],
                ),
              );
            } else {
              return SizedBox();
            }
        }
      },
    );
  }
}
