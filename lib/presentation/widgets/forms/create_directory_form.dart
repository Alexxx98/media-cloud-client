import 'package:client/business_logic/entities/file.dart';
import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_event.dart';
import 'package:client/presentation/widgets/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateDirectoryForm extends StatefulWidget {
  final MediaCloudBloc bloc;
  final FileEntity? currentDirectory;

  const CreateDirectoryForm({
    super.key,
    required this.bloc,
    this.currentDirectory,
  });

  @override
  State<CreateDirectoryForm> createState() => _CreateDirectoryFormState();
}

class _CreateDirectoryFormState extends State<CreateDirectoryForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final creatorController = TextEditingController();

  int? currentDirectoryId;

  @override
  Widget build(BuildContext context) {
    print(widget.currentDirectory);
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
                        parentId: currentDirectoryId,
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
    );
  }
}
