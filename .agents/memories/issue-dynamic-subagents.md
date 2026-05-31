# 🧠 Task Memory & Minutes: Issue - Dynamic Configuration of AI Subagents

## 📋 イシュー概要
- **対象:** AIサブエージェント（`frontend_engineer`, `backend_engineer`, `database_administrator`）の `GEMINI.md` に基づく動的構成ルールの確立
- **目的:** プロジェクトごとに異なる技術スタックが選定された場合でも、各サブエージェントがルートディレクトリの `GEMINI.md` を参照することで、自身の役割や具体的なコーディング規約（Next.js、Rust/Axum等）を動的に構成できるようにルールとシステムプロンプトを適応させる。

## 🤝 決定事項 (Agreed Specifications)
- **エージェントの動的適応:**
  - 各専門エージェントは、固定のスタック規約をプロンプトに持たず、起動時にルートの `GEMINI.md` をパースして自身のコーディング規約やフレームワーク構成を決定する。
- **ルールブックへの記載:**
  - `AGENTS.md` のサブエージェント規約に、「`GEMINI.md` による動的構成（動的バインド）の仕組み」を明文化。
- **サブエージェントプロンプトの再定義:**
  - `define_subagent` を使用し、`GEMINI.md` を読み込んで自己構成するようサブエージェントのシステムプロンプトを更新する。

## ⏳ 残件・次回への申し送り (Remaining TODOs)
- [x] `AGENTS.md` への動的構成ルールの追記
- [x] サブエージェントの動的適応（`AGENTS.md` による動作規定と親エージェントによる召喚時制御への昇華）
- [x] 人間による確認
