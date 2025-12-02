
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/chat_model.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chat = Provider.of<ChatModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polytalk Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              final ok = await showDialog<bool>(context: context, builder: (c)=> AlertDialog(
                title: const Text('Очистить сообщения?'),
                actions: [
                  TextButton(onPressed: ()=> Navigator.of(c).pop(false), child: const Text('Отмена')),
                  TextButton(onPressed: ()=> Navigator.of(c).pop(true), child: const Text('Очистить')),
                ],
              ));
              if (ok == true) {
                await chat.clear();
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatModel>(
              builder: (context, model, _) {
                final messages = model.messages;
                if (messages.isEmpty) {
                  return const Center(child: Text('Нет сообщений. Напиши первое!'));
                }
                return ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(12),
                  itemCount: messages.length,
                  itemBuilder: (context, i) => MessageBubble(message: messages[i]),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Написать сообщение...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      final text = _controller.text.trim();
                      if (text.isEmpty) return;
                      Provider.of<ChatModel>(context, listen: false).send(text);
                      _controller.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
