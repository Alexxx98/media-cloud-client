import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:flutter/material.dart';

class CreateDirectoryForm extends StatefulWidget {
  const CreateDirectoryForm({super.key});

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
    return Center(
      child: Form(child: Column(children: [TextFormField()])),
    );
  }
}
