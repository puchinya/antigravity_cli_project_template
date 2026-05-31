# 📱 Mobile: Flutter

## 🛠️ Technical Specs
- **SDK Version:** Flutter 3.x
- **Language:** Dart (Strict Linting enabled)
- **State Management:** Riverpod

## 📌 Architecture & Coding Rules
- **Directory Structure:**
  - 画面（UIレイヤー）: `/lib/presentation/views`
  - 状態管理（Notifier等）: `/lib/presentation/providers`
  - ドメイン（ビジネスロジック）: `/lib/domain`
- **Coding Style:**
  - Widgetの肥大化を避け、適切に `ConsumerWidget` としてコンポーネント化すること。
  - イミュータブルなデータモデルには `freezed` を使用すること。

## 🚀 Commands
- 起動: `flutter run`
- 生成コードのビルド: `dart run build_runner build --delete-conflicting-outputs`
