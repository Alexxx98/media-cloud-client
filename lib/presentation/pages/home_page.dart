import 'package:client/presentation/widgets/file_viewer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cloud.Home',
          style: TextStyle(color: Colors.grey.shade300),
        ),
        backgroundColor: Colors.black,
      ),
      body: FileViewer(),
    );
  }
}
