import 'package:client/presentation/bloc/media_cloud_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MediaCloudBloc>();

    return Scaffold(
      appBar: AppBar(
        // Get previous directory files
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
      endDrawer: MenuDrawer(bloc: bloc),
      body: FileViewer(),
    );
  }
}
