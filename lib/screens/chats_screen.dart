import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatsScreen extends StatelessWidget {
  final String nick;
  ChatsScreen({required this.nick});

  @override Widget build(BuildContext ctx) {
    final peers = ['Alice', 'Bob', 'Carlos'];
    return Scaffold(
      appBar: AppBar(title: Text('PolyTalk — $nick')),
      body: ListView.builder(itemCount: peers.length, itemBuilder: (_,i){
        return ListTile(
          leading: CircleAvatar(child: Text(peers[i][0])),
          title: Text(peers[i]),
          subtitle: Text('Нажмите для начала чата'),
          onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_)=>ChatScreen(peer: peers[i], me: nick))),
        );
      }),
    );
  }
}
