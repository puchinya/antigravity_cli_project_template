# 🧠 Task Memory & Minutes: Issue - Docker Container Development and Command Auto-Approval

## 📋 イシュー概要
- **対象:** Dockerコンテナを活用した開発手法の採用と、都度承認不要な「安全コマンド自動承認フロー」の構築・ルール反映
- **目的:** AI開発における「コマンド実行時の都度承認プロンプト」による人間の認知負荷を劇的に下げるため、開発作業を完全にDockerコンテナ内に隔離し、安全な `docker compose exec` などのコマンドの自動承認設定を促す運用ルールを明文化する。

## 🤝 決定事項 (Agreed Specifications)
- **コンテナ内開発の原則:**
  - フロントエンド、バックエンド、データベースの開発・テスト・ビルドは、ローカルホストではなく Docker コンテナ内で実行する。
- **承認省略の実現手法:**
  - ホスト側での `docker compose exec` および `docker exec` コマンドプレフィックスの自動承認（Allowed）登録を推奨。
  - これにより、コンテナ内部での `cargo`, `pnpm`, `npm` 等の開発操作は都度の承認ダイアログなしでAIが自律的に実行できるようになる。
- **`AGENTS.md` への記載:**
  - 🐳 Docker開発＆コマンド承認省略の規約を追加。

## ⏳ 残件・次回への申し送り (Remaining TODOs)
- [x] `AGENTS.md` へのコンテナ開発＆承認省略規約の追加
- [x] 人間による確認とホスト側設定の連携
