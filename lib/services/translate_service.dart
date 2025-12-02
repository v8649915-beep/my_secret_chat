import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslateService {
  static Future<String?> translate(String text, String target) async {
    try {
      final resp = await http.post(Uri.parse('https://libretranslate.de/translate'),
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({'q': text, 'source':'auto', 'target': target, 'format':'text'})
      );
      if (resp.statusCode==200) {
        final j = jsonDecode(resp.body);
        return j['translatedText'] as String;
      }
    } catch (e) {
      print('translate error $e');
    }
    return null;
  }
}
