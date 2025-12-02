
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Message {
  final String text;
  final String sender;
  final DateTime time;

  Message({required this.text, required this.sender, required this.time});

  Map<String, dynamic> toJson() => {
        'text': text,
        'sender': sender,
        'time': time.toIso8601String(),
      };

  static Message fromJson(Map<String, dynamic> j) => Message(
        text: j['text'],
        sender: j['sender'],
        time: DateTime.parse(j['time']),
      );
}

class ChatModel extends ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => List.unmodifiable(_messages);

  ChatModel() {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('polytalk_messages');
    if (raw != null) {
      final list = jsonDecode(raw) as List<dynamic>;
      _messages = list.map((e) => Message.fromJson(Map<String, dynamic>.from(e))).toList();
      notifyListeners();
    }
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(_messages.map((m) => m.toJson()).toList());
    await prefs.setString('polytalk_messages', raw);
  }

  Future<void> send(String text, {String sender = 'You'}) async {
    final msg = Message(text: text, sender: sender, time: DateTime.now());
    _messages.insert(0, msg);
    await _save();
    notifyListeners();
  }

  Future<void> clear() async {
    _messages.clear();
    await _save();
    notifyListeners();
  }
}
