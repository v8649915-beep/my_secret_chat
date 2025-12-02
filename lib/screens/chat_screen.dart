import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt_pkg;
import '../services/translate_service.dart';

class ChatScreen extends StatefulWidget {
  final String peerName;
  final String myNick;
  ChatScreen({required this.peerName, required this.myNick});
  @override _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController ctrl = TextEditingController();
  List<Map<String,String>> messages = []; // {from,text}
  final demoKey = encrypt_pkg.Key.fromUtf8('32byteslengthsupersecretkey!!!!!'); // 32 char
  encrypt_pkg.Encrypter getEncrypter() => encrypt_pkg.Encrypter(encrypt_pkg.AES(demoKey, mode: encrypt_pkg.AESMode.gcm));

  void send() {
    final t = ctrl.text.trim();
    if (t.isEmpty) return;
    final iv = encrypt_pkg.IV.fromSecureRandom(12);
    final enc = getEncrypter().encrypt(t, iv: iv);
    setState(()=> messages.add({'from': widget.myNick, 'text': t}));
    ctrl.clear();
  }

  Future<void> translateMessage(int idx, String target) async {
    final plain = messages[idx]['text']!;
    final tr = await TranslateService.translate(plain, target);
    if (tr!=null) {
      showDialog(context: context, builder: (_)=>AlertDialog(title: Text('Перевод'), content: Text(tr), actions: [TextButton(onPressed: ()=>Navigator.pop(context), child: Text('OK'))]));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Перевод недоступен')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.peerName)),
      body: Column(children: [
        Expanded(child: ListView.builder(itemCount: messages.length, itemBuilder: (_,i){
          final m=messages[i];
          final isMe = m['from']==widget.myNick;
          return Align(alignment: isMe?Alignment.centerRight:Alignment.centerLeft, child: GestureDetector(onLongPress: ()=>translateMessage(i,'ru'), child: Container(margin: EdgeInsets.all(8), padding: EdgeInsets.all(12), decoration: BoxDecoration(color:isMe?Colors.teal[200]:Colors.grey[700], borderRadius: BorderRadius.circular(8)), child: Text(m['text']!))));
        })),
        Padding(padding: EdgeInsets.all(8), child: Row(children: [Expanded(child: TextField(controller: ctrl)), IconButton(icon: Icon(Icons.send), onPressed: send)]))
      ],),
    );
  }
}
