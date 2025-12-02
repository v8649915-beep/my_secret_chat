import 'package:flutter/material.dart';
import 'chat_list_screen.dart';

class LoginScreen extends StatefulWidget {
  @override _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nick = TextEditingController();
  bool loading = false;
  void enter() async {
    if (nick.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Введите ник')));
      return;
    }
    setState(()=>loading=true);
    await Future.delayed(Duration(milliseconds: 400));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ChatListScreen(myNick: nick.text.trim())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MSC — Вход')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(controller: nick, decoration: InputDecoration(labelText: 'Ник')),
          SizedBox(height:12),
          ElevatedButton(onPressed: loading?null:enter, child: Text('Войти')),
        ]),
      ),
    );
  }
}
