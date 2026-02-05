import 'package:client/presentation/bloc/media_cloud_bloc.dart';
import 'package:client/presentation/bloc/media_cloud_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileViewer extends StatelessWidget {
  const FileViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCloudBloc, MediaCloudState>(
      builder: (context, state) {
        return Scaffold(backgroundColor: Colors.grey.shade600);
      },
    );
  }
}
