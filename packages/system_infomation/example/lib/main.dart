import 'package:flutter/material.dart';
import 'package:system_infomation/system_infomation.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: const Center(
          child: Text('Action: Call Rust `greet("Tom")`\nResult: '),
        ),
      ),
    );
  }
}
