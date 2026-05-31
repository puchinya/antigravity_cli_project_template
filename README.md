# Antigravity CLI Project Template

AI駆動開発をするときのプロジェクトテンプレートです。

## 🛠️ 技術スタックの選択と `GEMINI.md` の生成

本プロジェクトでは、開発で使用する技術スタック（Webフレームワーク、データベース、言語など）に応じて、AI（Antigravity CLI / agy）の行動指針となる `GEMINI.md` を動的に生成します。

### ⚙️ セットアップ手順

1. **技術スタックカタログの選択**
   `.agents/tech_stacks_sources/` に格納されているMarkdownファイル（例: `nextjs.md`, `postgresql.md`, `rust_server.md` など）から、今回の開発で使用するスタックを選択します。

2. **AIへの指示と `GEMINI.md` の生成**
   開発開始時にAIに対して「今回の技術スタックは〇〇.mdと✕✕.md」と指示を与えます。AIは指定されたカタログの内容を統合し、プロジェクトのルートディレクトリに `GEMINI.md` を自動生成（または上書き）します。
   
   > [!IMPORTANT]
   > 生成された `GEMINI.md` は本プロジェクトにおける技術スペックと開発ルールの「絶対的な正解」となります。直接手動で編集せず、技術スタックの構成変更を行う場合はカタログ（`.agents/tech_stacks_sources/`）を編集した上で再生成してください。


## 🚀 GitHub MCP サーバー連携のセットアップ

本プロジェクトでは、GitHubと連携してIssueやPull Requestの操作を行うためのMCP（Model Context Protocol）サーバーを利用できます。
セキュリティ確保のため、個人用アクセストークンは外部環境変数ファイル（`.env.mcp`）に隔離して管理します。

### ⚙️ セットアップ手順

1. **環境変数ファイルの作成**
   プロジェクトルートにあるテンプレートファイル `.env.mcp.template` をコピーし、`.env.mcp` というファイル名で作成します。
   ```bash
   cp .env.mcp.template .env.mcp
   ```

2. **GitHub Personal Access Token (PAT) の設定**
   GitHubの「[Settings -> Developer settings -> Personal access tokens (classic)](https://github.com/settings/tokens)」からトークンを発行し、作成した `.env.mcp` 内の `GITHUB_PERSONAL_ACCESS_TOKEN` に設定します。
   
   ```env
   GITHUB_PERSONAL_ACCESS_TOKEN=your_actual_token_here
   ```
   *(※ `.env.mcp` は `.gitignore` に登録されているため、誤ってGitHubにコミットされることはありません)*

3. **反映と再起動**
   保存完了後、Antigravity CLI を再起動することで、GitHub連携機能が有効化されます。
