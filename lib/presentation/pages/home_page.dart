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
  int? parentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: currentDirectoryId != null
            ? IconButton(
                onPressed: () {
                  if (parentId != null) {
                    context.read<MediaCloudBloc>().add(
                      GetFilesEvent(parentId!),
                    );
                  } else {
                    context.read<MediaCloudBloc>().add(GetRootEvent());
                  }
                },
                icon: Icon(Icons.arrow_back),
              )
            : null,
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
    );
  }
}
