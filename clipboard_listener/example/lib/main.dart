import 'dart:io';

import 'package:flutter/material.dart';
import 'package:clipboard_listener/clipboard_listener.dart';

Future<void> main() async {
  clipboardListener((data) {
    debugPrint(data.icon.toString());
    debugPrint(data.appName.toString());
    if (data.dataType == DataType.file) {
      debugPrint(data.paths.toString());
    } else if (data.dataType == DataType.text) {
      debugPrint(data.content);
    } else if (data.dataType == DataType.image) {
      debugPrint("width: ${data.image!.width}, height: ${data.image!.height} ,size: ${data.image!.bytes.length}");
      File file = File('temp/clipboard_image.png');
      file.writeAsBytesSync(data.image!.bytes);
    }
    return Future.value('ok');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: Text('Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`'),
        ),
      ),
    );
  }
}
