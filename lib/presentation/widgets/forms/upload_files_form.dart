import 'dart:typed_data';

import 'package:client/business_logic/entities/file.dart';
import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';
import 'package:client/presentation/widgets/components/custom_text_form_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadFilesForm extends StatefulWidget {
  final MediaCloudBloc bloc;
  final FileEntity? currentDirectory;

  const UploadFilesForm({super.key, required this.bloc, this.currentDirectory});

  @override
  State<UploadFilesForm> createState() => _UploadFilesFormState();
}

class _UploadFilesFormState extends State<UploadFilesForm> {
  final _formKey = GlobalKey<FormState>();

  final uploadedByController = TextEditingController();

  late int? currentDirectoryId;

  @override
  Widget build(BuildContext context) {
    if (widget.currentDirectory != null) {
      currentDirectoryId = widget.currentDirectory!.id;
    }

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade700,
        ),
        constraints: BoxConstraints(maxWidth: 750),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.black,
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.grey.shade700,
                    ),
                  ),
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result == null) return;

                    widget.bloc.add(PickFilesEvent(result.files));
                  },

                  child: Text('Pick Files'),
                ),
              ),

              // Show picked files
              BlocBuilder<MediaCloudBloc, MediaCloudState>(
                bloc: widget.bloc,
                builder: (context, state) {
                  if (state is FilesPicked) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(state.files.first.name),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormField(
                            textController: uploadedByController,
                            hintText: 'Uploaded by',
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(
                                Colors.black,
                              ),
                              foregroundColor: WidgetStatePropertyAll<Color>(
                                Colors.grey.shade700,
                              ),
                            ),
                            onPressed: () {
                              List<Uint8List> filesBytes = [];

                              for (
                                int index = 0;
                                index < state.files.length;
                                index++
                              ) {
                                filesBytes.add(state.files[index].bytes!);
                              }
                              widget.bloc.add(
                                UploadFilesEvent(
                                  currentDirectoryId!,
                                  filesBytes,
                                  uploadedByController.text,
                                ),
                              );
                              Navigator.pop(context);
                            },
                            child: Text('Upload files'),
                          ),
                        ),
                      ],
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
