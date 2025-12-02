
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/chat_screen.dart';
import 'models/chat_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PolytalkApp());
}

class PolytalkApp extends StatelessWidget {
  const PolytalkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatModel(),
      child: MaterialApp(
        title: 'Polytalk Chat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ChatScreen(),
      ),
    );
  }
}
