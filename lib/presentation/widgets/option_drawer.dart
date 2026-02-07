import 'package:flutter/material.dart';

class OptionDrawer extends StatelessWidget {
  const OptionDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
