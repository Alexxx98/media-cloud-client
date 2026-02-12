import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';
import 'package:client/presentation/widgets/file_viewer.dart';
import 'package:client/presentation/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? currentDirectoryId;
  int? currentDirectoryParentId;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: context.read<MediaCloudBloc>(),
      listener: (context, state) {
        if (state is FilesLoaded) {
          currentDirectoryId = state.currentDirectoryId;
          currentDirectoryParentId = state.currentDirectoryParentId;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          // Get previous directory files
          leading: IconButton(
            onPressed: () {
              if (currentDirectoryParentId != null) {
                context.read<MediaCloudBloc>().add(
                  GetFilesEvent(
                    currentDirectoryId!,
                    currentDirectoryParentId,
                    null,
                  ),
                );
              } else {
                context.read<MediaCloudBloc>().add(GetRootEvent());
              }
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            'Cloud.Home',
            style: TextStyle(color: Colors.grey.shade300),
          ),
          backgroundColor: Colors.black,
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.more_vert, color: Colors.grey.shade300),
                );
              },
            ),
          ],
        ),
        endDrawer: MenuDrawer(),
        body: FileViewer(),
      ),
    );
  }
}
