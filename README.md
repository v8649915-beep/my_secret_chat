My Secret Chat - stable complete project (local demo)

Description:
- Local demo chat app built in Flutter.
- Messages are stored in-memory for demo purposes.
- Messages are encrypted client-side when sending (demo key used); in real app use proper key derivation & secure storage.
- Auto-translate uses libretranslate.de (public service).

How to use with GitHub Actions (cloud build):
1. Upload all files and folders from this project to your GitHub repo (root).
2. Ensure branch 'main' exists. Push changes.
3. GitHub Actions will run the workflow and build an APK. Download artifact from Actions -> my_secret_chat_apk.

Notes:
- This demo project purpose: provide a buildable app with chat UI, translation and encryption hooks.
- For full online chat, integrate Firebase or your backend. I can add that next.
