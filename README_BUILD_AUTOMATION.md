

## Автоматическая сборка APK и IPA через GitHub Actions

Я добавил в проект workflow для GitHub Actions:
- `.github/workflows/android.yml` — собирает debug и (опционально) release APK.
- `.github/workflows/ios.yml` — собирает ipa на macOS runner (требуются Apple-credentials).

### Как получить собранные артефакты
1. Загрузи этот проект в репозиторий на GitHub (в ветку `main`).
2. В GitHub → Actions запусти workflow вручную (Workflow → Run workflow) или пушни в `main`.
3. После завершения шага "Upload artifacts" в интерфейсе Actions можно скачать артефакты (apk / ipa).

### Какие секреты нужно добавить (Settings → Secrets → Actions)
Для Android (если хочешь signed release):
- `ANDROID_KEYSTORE_BASE64` — содержимое твоего `keystore.jks`, закодированное base64.
- `ANDROID_KEYSTORE_PASSWORD`
- `ANDROID_KEY_ALIAS`
- `ANDROID_KEY_PASSWORD`

Для iOS (если хочешь автоматическую подпись и публикацию):
- `APP_STORE_CONNECT_KEY` — приватный .p8 ключ от App Store Connect в base64.
- `APP_STORE_CONNECT_ISSUER_ID`
- `APP_STORE_CONNECT_KEY_ID`
(Также может потребоваться профиль провижининга — можно настроить через App Store Connect API или вручную в Xcode.)

### Примечания
- Я оставил сборку debug APK без подписи — её можно установить сразу на Android-устройство.
- Для iOS без macOS локальной сборки необходима корректная настройка подписей; процесс сложнее и требует Apple Developer аккаунта.
- Если хочешь, я помогу подготовить значения секретов и шаги по созданию keystore / App Store Connect API key.

