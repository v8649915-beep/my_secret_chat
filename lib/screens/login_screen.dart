import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'chats_screen.dart';

class LoginScreen extends StatefulWidget {
  @override State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool _loading = false;

  void _login() async {
    setState(()=>_loading=true);
    await Future.delayed(Duration(milliseconds:500));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ChatsScreen(nick: _email.text.trim().isEmpty?'User':_email.text.trim())));
  }

  @override Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('PolyTalk — Вход')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: _email, decoration: InputDecoration(labelText:'Email / Nick')),
          TextField(controller: _pass, decoration: InputDecoration(labelText:'Password'), obscureText: true),
          SizedBox(height:12),
          ElevatedButton(onPressed: _loading?null:_login, child: Text('Войти')),
          TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterScreen())), child: Text('Регистрация')),
          SizedBox(height:8),
          Text('Demo режим: зайди и начни чат. Для полного функционала подключи Firebase (инструкция в README).', style: TextStyle(fontSize:12))
        ],),
      ),
    );
  }
}
