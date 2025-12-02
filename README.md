
# Polytalk Chat (scaffold)

Это минимальный современный Flutter-проект — локальный прототип чата (без Firebase).
Я сделал UI, локальное сохранение сообщений и простую структуру проекта. 
Ты можешь установить APK локально или подключить Firebase позднее.

## Что внутри
- `lib/main.dart` — точка входа
- `lib/screens/chat_screen.dart` — экран чата
- `lib/widgets/message_bubble.dart` — виджет сообщения
- `pubspec.yaml` — зависимости (shared_preferences, provider)
- `android/`, `ios/` — минимальные шаблоны Android/iOS (embedding v2)

## Как собрать (на твоей машине)
1. Установи Flutter (https://flutter.dev).  
2. Открой терминал в папке проекта.  
3. Выполни `flutter pub get`  
4. Подключи телефон или используй эмулятор.  
5. `flutter run` или `flutter build apk`

## Как загрузить на GitHub
1. На странице твоего репозитория нажми **Add file → Upload files** и загрузишь содержимое этой папки.  
2. Commit → Actions → запусти workflow, как раньше.

Если хочешь — я помогу подключить Firebase и собрать релизные сборки с подписью.
