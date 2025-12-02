import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nick = TextEditingController();
  @override Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('PolyTalk — Регистрация')),
      body: Padding(padding: EdgeInsets.all(16), child: Column(children: [
        TextField(controller: _nick, decoration: InputDecoration(labelText:'Ник')),
        SizedBox(height:12),
        ElevatedButton(onPressed: ()=>Navigator.pop(ctx), child: Text('Зарегистрироваться (демо)')),
      ])),
    );
  }
}
