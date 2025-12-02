import 'package:flutter/material.dart';
import '../services/translate_service.dart';

class ChatScreen extends StatefulWidget {
  final String peer;
  final String me;
  ChatScreen({required this.peer, required this.me});

  @override State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _ctrl = TextEditingController();
  final List<Map<String,String>> messages = []; // {from,text}

  void _send() async {
    final t = _ctrl.text.trim();
    if (t.isEmpty) return;
    setState(()=> messages.add({'from': widget.me, 'text': t}));
    _ctrl.clear();
    final translated = await TranslateService.translate(t, 'en'); // demo target en
    if (translated!=null) setState(()=> messages.add({'from': widget.peer, 'text': translated}));
  }

  @override Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.peer)),
      body: Column(children: [
        Expanded(child: ListView.builder(itemCount: messages.length, itemBuilder: (_,i){
          final m = messages[i];
          final isMe = m['from']==widget.me;
          return Align(alignment: isMe?Alignment.centerRight:Alignment.centerLeft, child: Container(margin: EdgeInsets.all(8), padding: EdgeInsets.all(10), decoration: BoxDecoration(color:isMe?Colors.teal[200]:Colors.grey[700], borderRadius: BorderRadius.circular(8)), child: Text(m['text']!)));
        })),
        Padding(padding: EdgeInsets.all(8), child: Row(children:[Expanded(child: TextField(controller: _ctrl)), IconButton(icon: Icon(Icons.send), onPressed: _send)]))
      ],),
    );
  }
}
