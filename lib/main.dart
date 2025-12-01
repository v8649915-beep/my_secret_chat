
import 'package:flutter/material.dart';

void main() {
  runApp(MySecretChatApp());
}

class MySecretChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My Secret Chat")),
        body: Center(child: Text("Encrypted Chat Placeholder")),
      ),
    );
  }
}
