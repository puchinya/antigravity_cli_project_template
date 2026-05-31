# 🧠 Task Memory & Minutes: Issue - Implement DinD/DooD Support in Docker Environment

## 📋 イシュー概要
- **対象:** 作業用Dockerコンテナ内でのテスト環境用コンテナ起動（DinD/DooD）への対応と規約化
- **目的:** 作業用コンテナ内部からテスト用コンテナ（テスト用DBなど）を自律的かつ動的に立ち上げて統合テスト等を実施できるよう、Docker-in-Docker (DinD) または Docker-out-of-Docker (DooD, ソケット共有) への対応ルールを明文化し、環境を整備する。

## 🤝 決定事項 (Agreed Specifications)
- **DinD/DooD アプローチの選定:**
  - パフォーマンスとローカル開発の容易さを考慮し、ホストマシンの `/var/run/docker.sock` を作業用コンテナにマウントする Docker-out-of-Docker (DooD) を第一選択肢として推奨。
  - 必要に応じて完全隔離型の DinD（`docker:dind` イメージ等）も考慮する。
- **作業用コンテナの要件:**
  - 作業用コンテナ（開発環境・CI等）には、`docker` CLI および `docker-compose` CLI が予めインストールされている必要がある。
- **`AGENTS.md` への追記:**
  - `AGENTS.md` の「🐳 Dockerコンテナ開発とコマンド承認の省略フロー」に、コンテナ内でのコンテナ起動（DinD/DooD）に関する実装・環境設計の指針を追加する。

## ⏳ 残件・次回への申し送り (Remaining TODOs)
- [x] `AGENTS.md` への DinD/DooD 対応規約の追記
- [x] 人間による確認
