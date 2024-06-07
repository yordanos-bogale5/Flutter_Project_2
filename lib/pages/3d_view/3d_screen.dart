import 'package:flutter/material.dart';
import 'package:babylonjs_viewer/babylonjs_viewer.dart';

class ThreeDScreen extends StatelessWidget {
  final String modelPath;

  const ThreeDScreen({Key? key, required this.modelPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View in 3D',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BabylonJSViewer(
              src: modelPath,
            ),
          ),
        ],
      ),
    );
  }
}
