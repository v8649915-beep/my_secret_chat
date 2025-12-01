import 'package:flutter/material.dart';

void main() {
  runApp(MySecretChatApp());
}

class MySecretChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Secret Chat',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('My Secret Chat')),
        body: Center(child: Text('Placeholder app — flutter create will generate native folders on build')),
      ),
    );
  }
}
