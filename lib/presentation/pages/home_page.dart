import 'package:client/dependency_injection.dart';
import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/widgets/create_directory_form.dart';
import 'package:client/presentation/widgets/file_viewer.dart';
import 'package:client/presentation/widgets/option_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cloud.Home',
          style: TextStyle(color: Colors.grey.shade300),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.more_vert, color: Colors.grey.shade300),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
        backgroundColor: Colors.black,
      ),

      // Options
      endDrawer: OptionDrawer(),
      body: Placeholder(),
    );
  }
}
