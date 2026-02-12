import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadFilesForm extends StatefulWidget {
  final MediaCloudBloc bloc;

  const UploadFilesForm({super.key, required this.bloc});

  @override
  State<UploadFilesForm> createState() => _UploadFilesFormState();
}

class _UploadFilesFormState extends State<UploadFilesForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int? parentId;
    return Dialog(
      child: BlocListener(
        bloc: widget.bloc,
        listener: (context, state) {
          if (state is FilesLoaded) {
            parentId = state.currentDirectoryParentId;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade700,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Upload Files', style: TextStyle(fontSize: 32)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
