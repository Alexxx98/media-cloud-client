import 'package:client/business_logic/entities/file.dart';
import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/widgets/forms/create_directory_form.dart';
import 'package:client/presentation/widgets/forms/upload_files_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuDrawer extends StatelessWidget {
  final FileEntity? currentDirectory;

  const MenuDrawer({super.key, this.currentDirectory});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MediaCloudBloc>();

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
                      return CreateDirectoryForm(
                        bloc: bloc,
                        currentDirectory: currentDirectory,
                      );
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
                    context: (context),
                    builder: (dialogContext) {
                      return UploadFilesForm(
                        bloc: bloc,
                        currentDirectory: currentDirectory,
                      );
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
