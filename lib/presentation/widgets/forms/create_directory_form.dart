import 'package:client/business_logic/entities/file.dart';
import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';
import 'package:client/presentation/widgets/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDirectoryForm extends StatefulWidget {
  final MediaCloudBloc bloc;

  const CreateDirectoryForm({super.key, required this.bloc});

  @override
  State<CreateDirectoryForm> createState() => _CreateDirectoryFormState();
}

class _CreateDirectoryFormState extends State<CreateDirectoryForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final creatorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int? parentId;
    return Dialog(
      child: BlocListener(
        bloc: widget.bloc,
        listener: (context, state) {
          if (state is FilesLoaded) {
            parentId = state.currentDirectoryId;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade700,
          ),
          constraints: BoxConstraints(maxWidth: 750),
          child: Center(
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
                          icon: Icon(Icons.close, color: Colors.black),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Create a new directory',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextFormField(
                      textController: nameController,
                      hintText: 'Name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextFormField(
                      textController: passwordController,
                      obscureText: true,
                      hintText: 'Password',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomTextFormField(
                      textController: creatorController,
                      hintText: 'Creator',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
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
                        FileEntity newDirectory = FileEntity(
                          name: nameController.text,
                          parentId: parentId,
                          password: passwordController.text,
                          addedBy: creatorController.text,
                        );
                        widget.bloc.add(CreateDirectoryEvent(newDirectory));
                        Navigator.pop(context);
                      },
                      child: Text('Create'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
