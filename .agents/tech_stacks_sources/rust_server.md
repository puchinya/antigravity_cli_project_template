# 🦀 Backend: Rust Server

## 🛠️ Technical Specs
- **Language:** Rust (Stable, Edition 2024)
- **Web Framework:** Axum (v0.8.x)
- **Async Runtime:** Tokio (v1.x)
- **Database Connection & ORM:** SQLx (v0.8.x) または SeaORM
- **Serialization / Deserialization:** Serde (v1.0)
- **Logging / Tracing:** tracing & tracing-subscriber

## 📌 Architecture & Coding Rules
- **Directory Structure (すべて `/src/backend/` 配下で行うこと):**
  - エントリポイント: `/src/backend/src/main.rs`
  - ルーティング・ハンドラー（コントローラーレイヤー）: `/src/backend/src/handlers/`
  - ビジネスロジック・サービスレイヤー: `/src/backend/src/services/`
  - データアクセス・リポジトリレイヤー: `/src/backend/src/repositories/`
  - データベースモデル・DTO: `/src/backend/src/models/`
  - エラー定義: `/src/backend/src/errors.rs`
  - 設定管理: `/src/backend/src/config.rs`
- **Coding Style:**
  - **警告ゼロの厳守:** コンパイラおよび `cargo clippy` の警告をゼロにすること。警告の無視（`#[allow(...)]`）は明確な理由がない限り禁止。
  - **非同期プログラミング:** 非同期関数（`async fn`）を適切に使用し、Tokioランタイムをブロックするような同期型ブロッキング処理（例: 重い計算や同期I/O）は `tokio::task::spawn_blocking` に委ねること。
  - **エラーハンドリング:** `unwrap()` や `expect()` の使用はテストや確実な事前チェックがある場合を除き原則禁止。実稼働コードでは `Result<T, E>` を返し、`thiserror` 等を用いてドメイン固有のカスタムエラーを定義して適切にハンドリングすること。
  - **スレッドセーフティ:** 状態（State）をハンドラー間で共有する場合は、`std::sync::Arc` や `tokio::sync::RwLock` / `Mutex` を使用してスレッドセーフに管理すること（Axumの `State` 抽出子を推奨）。

## 🚀 Commands
- 開発サーバー起動（ホットリロード）: `cargo watch -x run` (要 `cargo-watch`)
- 通常起動: `cargo run`
- ビルド: `cargo build --release`
- テスト実行: `cargo test`
- 静的解析: `cargo clippy -- -D warnings`
- フォーマット適用: `cargo fmt`
