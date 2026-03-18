import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/widgets/forms/create_directory_form.dart';
import 'package:client/presentation/widgets/forms/upload_files_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuDrawer extends StatelessWidget {
  final MediaCloudBloc bloc;

  const MenuDrawer({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return CreateDirectoryForm(bloc: bloc);
                    },
                  );
                },
                icon: Icon(Icons.create_new_folder),
              ),
              title: Text(
                'Create directory',
                style: TextStyle(color: Colors.grey.shade300),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'Upload Files',
                style: TextStyle(color: Colors.grey.shade300),
              ),
              leading: IconButton(
                icon: Icon(Icons.file_upload),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return UploadFilesForm(bloc: bloc);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
