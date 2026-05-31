# 🧠 Task Memory & Minutes: Issue - Add Rust Server Tech Stack Source

## 📋 イシュー概要
- **対象:** 技術スタックソースにRustのサーバー開発を追加する
- **目的:** AI（Antigravity CLI / agy）がRustを用いたサーバーサイド（バックエンド）開発を行う際の、技術スペック・ディレクトリ構成・コーディング規約の絶対的な基準となる `rust_server.md` を `.agents/tech_stacks_sources/` 配下に追加する。

## 🤝 決定事項 (Agreed Specifications)
- 技術スタックソースファイル名: `.agents/tech_stacks_sources/rust_server.md`
- 主な技術構成:
  - Edition: Rust 2024
  - Framework: Axum (v0.8.x) (デフォルト推奨)
  - Async Runtime: Tokio
  - ORM / Query Builder: SQLx (v0.8+, PostgreSQL等の非同期クエリ用)
  - Serialization: Serde (v1.0)
  - ディレクトリ構造規約: `src/backend` 内にCargoプロジェクトを構成し、ドメイン駆動設計（DDD）やレイヤードアーキテクチャに準拠した書き分けを規定する。

## ⏳ 残件・次回への申し送り (Remaining TODOs)
- [x] `.agents/tech_stacks_sources/rust_server.md` の作成
- [x] 作成内容の人間による確認
