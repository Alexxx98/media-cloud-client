import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/widgets/forms/create_directory_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

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
                  final bloc = context.read<MediaCloudBloc>();

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
        ],
      ),
    );
  }
}
