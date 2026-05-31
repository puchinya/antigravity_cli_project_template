# 🐳 Infrastructure: PostgreSQL

## 🛠️ Technical Specs (データベース仕様)
- **Database:** PostgreSQL (v16)
- **Deployment:** Docker Compose によるローカルコンテナ起動
- **Port Mapping:** `localhost:5432`
- **Default Database:** `app_db` (ユーザー名、パスワード、DB名はルートの `.env` を参照)
- **Storage Persistence:** ホストマシンのボリューム（例: `./.docker/db_data`）にデータを永続化

## 🏗️ Database Architecture & Schema Rules (設計・データ構造の規約)
PostgreSQLのスキーマ設計およびテーブル操作を行う際、エージェント（AI）は以下のデータモデル規約を厳守してください。

- **1. テーブル命名規則**
  - テーブル名、カラム名はすべて小文字の蛇形記法（`snake_case`）で統一。
  - テーブル名は複数形（例: `users`, `user_profiles`, `orders`）とする。
- **2. 共通メタデータカラム**
  - すべての物理テーブルには、レコード追跡のために以下のカラムを必ず含めること。
    - `id`: 主キー（UUID、または暗号的に安全な自動インクリメントID）
    - `created_at`: タイムスタンプ（`TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP`）
    - `updated_at`: タイムスタンプ（更新時に現在時刻へ自動修正される設定）
- **3. 外部キーと整合性**
  - リレーションを組む際は必ず明示的に外部キー制約（`FOREIGN KEY`）を設定すること。
  - 親レコード削除時の挙動（`ON DELETE CASCADE` や `ON DELETE SET NULL`）をユースケースに応じて必ず明示すること。

## 📌 Database Operation Rules (AI実装時の約束事)
- **インデックスの最適化:**
  - 検索クエリ（`WHERE` 句）や結合（`JOIN` 句）で頻繁に使用されるカラムには、パフォーマンス向上のため必ずインデックス（`CREATE INDEX`）を設計すること。
- **マイグレーションによる管理:**
  - データベースのスキーマ変更（テーブル追加・カラム変更）を行う際は、生SQLを直接データベースに流し込むのではなく、必ずプロジェクトで採用しているマイグレーションツール（Prisma、Liquibase、golang-migrate等）の仕組みを通してファイルとして履歴を残すこと。
- **セキュリティと型:**
  - パスワードなどの機密情報は生テキストで保存せず、必ずハッシュ化された値を格納する設計にすること。

## 🚀 Database Commands (AI実行用コマンド)
- コンテナの起動（バックグラウンド）: `docker compose up -d`
- コンテナの停止（データ維持）: `docker compose down`
- コンテナの停止（ボリューム削除）: `docker compose down -v`
- データベースのログ確認: `docker compose logs -f db`
