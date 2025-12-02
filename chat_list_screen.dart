import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'package:uuid/uuid.dart';

class ChatListScreen extends StatefulWidget {
  final String myNick;
  ChatListScreen({required this.myNick});
  @override _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List<Map<String,String>> chats = [];
  @override
  void initState() {
    super.initState();
    chats = [{'id':Uuid().v4(), 'name':'Alice'}, {'id':Uuid().v4(), 'name':'Bob'}];
  }
  void openChat(Map<String,String> c) {
    Navigator.push(context, MaterialPageRoute(builder: (_)=>ChatScreen(peerName: c['name']!, myNick: widget.myNick)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Чаты — ${widget.myNick}')),
      body: ListView.builder(itemCount: chats.length, itemBuilder: (_,i){
        final c=chats[i];
        return ListTile(leading: CircleAvatar(child: Text(c['name']![0])), title: Text(c['name']!), onTap: ()=>openChat(c));
      }),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: (){ setState(()=>chats.add({'id':Uuid().v4(),'name':'User${chats.length+1}'})); }),
    );
  }
}
