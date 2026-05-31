# 🧠 Task Memory & Minutes: Issue - Define Project Manager AI Agent

## 📋 イシュー概要
- **対象:** AIサブエージェントとしての「プロジェクトマネジャー (`project_manager`)」の定義および `AGENTS.md` への反映
- **目的:** 開発全体のロードマップ作成、進捗管理、タスクの切り出し・デリゲーション、人間とのコミュニケーションを統括する司令塔としてのAIエージェントを追加し、プロジェクト推進体制を強固にする。

## 🤝 決定事項 (Agreed Specifications)
- **エージェント定義:** `project_manager`
  - 全体のロードマップ・進捗管理を担当。
  - `docs/requests/` を分析し、WBSやタスク分割を行い、専門サブエージェントへデリゲートする。
  - 人間との対話、意思決定のヒアリングを担う。
- **規約への追加:**
  - `AGENTS.md` の「専門サブエージェント一覧」の最上部に `project_manager` を追記。
  - 親エージェントおよび専門エージェントとの協調体制におけるPMの役割を明文化。

## ⏳ 残件・次回への申し送り (Remaining TODOs)
- [x] `project_manager` エージェントを `define_subagent` ツールで定義
- [x] `AGENTS.md` にプロジェクトマネジャーの役割と協調規約を追加
- [x] 人間による確認
