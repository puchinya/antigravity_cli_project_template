# 🧠 Task Memory & Minutes: Issue - Define AI Subagents

## 📋 イシュー概要
- **対象:** プロジェクト開発に必要な専門AIサブエージェントの定義と `AGENTS.md` へのルール反映
- **目的:** 開発の並行化と専門性を最大化するため、仕様設計（`doc_architect`）、フロントエンド（`frontend_engineer`）、バックエンド（`backend_engineer`）、データベース（`database_administrator`）の4つの専門AIサブエージェントを定義し、連携ルールをドキュメント化する。

## 🤝 決定事項 (Agreed Specifications)
- **定義するサブエージェント:**
  1. `doc_architect` (仕様設計・要件落とし込み)
  2. `frontend_engineer` (フロントエンド開発)
  3. `backend_engineer` (バックエンド開発)
  4. `database_administrator` (データベース設計・運用)
- **開発フローでの連携:**
  - 親エージェントがタスク全体のロードマップを作り、各サブエージェントへタスクを並行・専門的に切り出してデリゲートする。
  - ルールブック `AGENTS.md` にこれらのサブエージェントの役割と協調フローを明文化。

## ⏳ 残件・次回への申し送り (Remaining TODOs)
- [x] 各サブエージェントを `define_subagent` ツールで定義
- [x] `AGENTS.md` にサブエージェント役割とデリゲーションのルールを追加
- [x] 人間による確認
