# 🧠 Task Memory & Minutes: Issue - Configure GitHub MCP Server

## 📋 イシュー概要
- **対象:** GitHubと連携するためのMCPサーバーの設定
- **目的:** 開発効率向上のため、Antigravity CLIでGitHubのIssueやPR操作ができるよう、安全な環境変数読み込み（外部ファイル化）の仕組みを含むGitHub MCPサーバー連携を構成する。

## 🤝 決定事項 (Agreed Specifications)
- **環境変数の外部ファイル化:**
  - 機密情報（トークン）を `mcp_config.json` に直接記述せず、外部ファイル `.env.mcp` から読み込む構成を採用。
  - ラッパースクリプト `mcp_github_wrapper.sh` を介して環境変数をロードし、`npx -y @modelcontextprotocol/server-github` を起動する。
- **セキュリティ対策:**
  - テンプレートファイル `.env.mcp.template` を用意。
  - 実データを含む `.env.mcp` が誤ってGitにコミットされないよう、`.gitignore` で確実に除外。
  - セットアップ手順を `README.md` に追加。

## ⏳ 残件・次回への申し送り (Remaining TODOs)
- [x] `.env.mcp.template` の作成
- [x] ラッパースクリプト `mcp_github_wrapper.sh` の作成と実行権限の付与
- [x] `mcp_config.json` の設定更新
- [x] `.gitignore` への `.env.mcp` 追加
- [x] `README.md` へのセットアップ手順の記載
- [x] 人間による確認と動作テスト
