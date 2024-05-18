import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ThreeDScreen extends StatefulWidget {
  final String title;

  ThreeDScreen({Key? key, required this.title}) : super(key: key);

  @override
  _ThreeDScreenState createState() => _ThreeDScreenState();
}

class _ThreeDScreenState extends State<ThreeDScreen> {
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
     const Text(
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
              controller: (WebViewController controller) {
                _controller = controller;
              },
              functions: '''
                function sayHello() { 
                  Print.postMessage("Hello World!"); 
                }

                function toggleAutoRotate() {
                  let viewer = BabylonViewer.viewerManager.getViewerById('viewer-id');
                  viewer.sceneManager.camera.useAutoRotationBehavior = !viewer.sceneManager.camera.useAutoRotationBehavior;
                }
              ''',
              src: 'https://models.babylonjs.com/boombox.glb',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _controller?.runJavascript('sayHello();');
            },
            child: const Text("Add to Cart"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.withOpacity(0.5),
              foregroundColor: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _controller?.runJavascript('toggleAutoRotate();');
            },
            child:  const Text("Add to favorites"),
            style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue.withOpacity(0.5),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
