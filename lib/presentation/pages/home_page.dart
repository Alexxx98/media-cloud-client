import 'package:client/presentation/widgets/file_viewer.dart';
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
      endDrawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            // Create new directory button
            ListTile(
              leading: Icon(Icons.create_new_folder),
              title: Text(
                'Create Directory',
                style: TextStyle(color: Colors.grey.shade300),
              ),
              onTap: () {},
            ),

            // Upload files button
            ListTile(
              leading: Icon(Icons.file_upload),
              title: Text(
                'Upload Files',
                style: TextStyle(color: Colors.grey.shade300),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: FileViewer(),
    );
  }
}
