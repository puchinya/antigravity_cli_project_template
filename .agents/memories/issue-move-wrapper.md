# 🧠 Task Memory & Minutes: Issue - Move MCP Wrapper to tools/ Directory

## 📋 イシュー概要
- **対象:** `mcp_github_wrapper.sh` の `tools/` ディレクトリへの移動および関連設定の変更
- **目的:** プロジェクトルートの整理整頓のため、MCP用のラッパースクリプトを新規作成する `tools/` ディレクトリに移動し、それに伴う環境変数パスやMCP設定、実行権限等の各種修正を完璧に行う。

## 🤝 決定事項 (Agreed Specifications)
- **移動先:** `/Users/nabeshimamasataka/Documents/git/antigravity_cli_project_template/tools/mcp_github_wrapper.sh`
- **スクリプト内のパス変更:** スクリプトの配置が1階層深くなるため、`.env.mcp` の参照先を `$DIR/../.env.mcp`（プロジェクトルート）に変更する。
- **`mcp_config.json` の変更:** `"command"` の絶対パスを `tools/` 配下に更新する。

## ⏳ 残件・次回への申し送り (Remaining TODOs)
- [x] `tools/` ディレクトリの作成
- [x] `mcp_github_wrapper.sh` の移動と中身（環境変数読み込みパス）の修正
- [x] `mcp_config.json` の設定パスの更新
- [x] 人間による確認
