My Secret Chat - fixed project for GitHub Actions

What to do:
1. Download and unzip this archive.
2. Upload all files (contents) to your GitHub repository root (branch main).
   - Make sure pubspec.yaml and lib/ are in the repo root.
3. Push to GitHub. The included GitHub Actions workflow will run automatically.
   It will run `flutter create` if the android/ folder is missing, then build the APK.
4. After successful run go to Actions -> Build run -> Artifacts -> download my_secret_chat_apk.

Notes:
- This project is intentionally minimal: actual app UI/features can be developed later.
- If you want a fully-featured app (chat, Firebase, translation), tell me and I'll add it step-by-step.
