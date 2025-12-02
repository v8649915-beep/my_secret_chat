import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MSCApp());
}

class MSCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MSC',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: LoginScreen(),
    );
  }
}
