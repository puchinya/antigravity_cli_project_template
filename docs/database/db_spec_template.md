# 📊 テーブル設計書: `users` (ユーザー管理テーブル)
本ファイルはテンプレートです。

## 📝 概要
アプリケーションにログインするユーザーの基本情報を管理するマスターテーブル。

## ⚙️ テーブル定義
- **テーブル名:** `users`
- **プライマリキー:** `id`

| カラム名 (Physical) | 論理名 (Logical) | データ型 (Type) | NULL | 初期値 (Default) | 制約・備考 (Constraints/Notes) |
| :--- | :--- | :--- | :---: | :--- | :--- |
| `id` | ユーザーID | `UUID` | NO | `gen_random_uuid()` | PRIMARY KEY |
| `email` | メールアドレス | `VARCHAR(255)` | NO | - | UNIQUE / ログインIDとして使用 |
| `password_hash` | ハッシュ化パスワード | `VARCHAR(255)` | NO | - | 生パスワードの保存は厳禁 |
| `display_name` | 表示名 | `VARCHAR(20)` | NO | - | 空白文字のみの登録は不可 |
| `created_at` | 作成日時 | `TIMESTAMPTZ` | NO | `CURRENT_TIMESTAMP` | レコード作成時のみ |
| `updated_at` | 更新日時 | `TIMESTAMPTZ` | NO | `CURRENT_TIMESTAMP` | レコード更新時に自動更新 |

## 🔗 リレーションシップ (インデックス・外部キー)
- **インデックス:**
  - `idx_users_email`: `email` カラム（高速検索・一意性担保のため）
- **外部キー制約 (Foreign Keys):**
  - なし（このテーブルが親となります）

## ⚠️ 実装時の注意点（AI厳守）
- ユーザー削除時、このテーブルに関連する `user_profiles` や `orders` などの子レコードの扱い（論理削除にするか、`ON DELETE CASCADE` にするか）は、必ずユースケースの機能仕様書を確認すること。
