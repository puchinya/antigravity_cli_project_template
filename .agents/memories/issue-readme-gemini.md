# 🧠 Task Memory & Minutes: Issue - Document Tech Stack and GEMINI.md Generation in README

## 📋 イシュー概要
- **対象:** `README.md` に技術スタックの決定および `GEMINI.md` の自動生成手順を記載する
- **目的:** 開発者がプロジェクトを開始する際、自律的かつ規約に沿った開発を行えるようにするため、`.agents/tech_stacks_sources/` を用いた技術選定および `GEMINI.md` の動的生成手順を `README.md` に追記する。

## 🤝 決定事項 (Agreed Specifications)
- **追記内容:**
  - カタログ（`tech_stacks_sources/`）からの選択プロセス。
  - AIへの指示による `GEMINI.md` の動的生成の流れ。
  - `GEMINI.md` が本プロジェクトの絶対的な技術スペック・規約であり、直接の手動編集は禁止されるというルール（`AGENTS.md` に準拠）の明記。
- **配置箇所:** `README.md` 内のGitHub MCP設定より前に配置（開発開始時に最初に行う手順であるため）。

## ⏳ 残件・次回への申し送り (Remaining TODOs)
- [x] `README.md` への手順の追記
- [x] 人間による確認
