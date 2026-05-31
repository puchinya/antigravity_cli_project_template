# 🐳 Infrastructure: Docker Compose & Development Environment

## 🛠️ General Architecture & Best Practices
本プロジェクトでは、開発環境およびテスト環境の構築に Docker / Docker Compose を採用し、環境の差異による問題を防ぐとともに、コマンド一つで実行可能なローカル環境を構築します。

### 📌 ベースイメージ選定・ビルドの規約
1. **厳密なバージョン固定**:
   - `latest` タグの使用は禁止します。マイナーバージョンやパッチバージョンまで明記（例: `alpine:3.19.1`）するか、可能な限り SHA-256 ハッシュ（Digest）を指定して再現性を担保してください。
2. **軽量なイメージの採用**:
   - 実行用のコンテナには、`alpine` や `distroless` などの軽量・セキュアなベースイメージを採用してください。
3. **マルチステージビルドの徹底**:
   - ビルド環境と実行環境を分離し、最終的なイメージサイズを最小限に抑えるとともに、ビルドツールなどの不要なツールが混入することを防いでください。

---

## 🏗️ Docker Compose によるオーケストレーション規約
ローカル環境では、複数のサービスが協調して動作します。Docker Compose を使用する際は、以下のベストプラクティスに従ってください。

### 1. サービスの依存関係と起動制御 (`depends_on` & `healthcheck`)
サービス間で依存関係がある場合（例: APIサーバーがデータストアの準備完了を待つ場合）、単に `depends_on` を指定するだけでなく、必ずヘルスチェック（`healthcheck`）を定義し、依存先の準備が完全に完了してから後続サービスが起動するように設計してください。

```yaml
services:
  dependency-service:
    image: <image-name>:<version>
    healthcheck:
      test: ["CMD", "healthcheck-command"]
      interval: 5s
      timeout: 5s
      retries: 5

  app-service:
    image: <image-name>:<version>
    depends_on:
      dependency-service:
        condition: service_healthy
```

### 2. ホストとコンテナの隔離とボリューム設計
- **コードのホットリロード (開発用):**
  - ローカル開発時は、ホストマシンのソースコードディレクトリをコンテナ内のワーキングディレクトリにバインドマウント（Bind Mount）し、ローカルでのコード変更が即座に反映されるように設計します。
- **データの永続化:**
  - データストア等のデータは、ホストマシンのボリューム（例: `./.docker/data`）にマウントし、コンテナを破棄・再作成してもデータが失われないように永続化設計を行います。

### 3. 環境変数の管理
- パスワードや認証キーなどの機密情報は Dockerfile や docker-compose.yml に直接ハードコードせず、`.env` ファイル等から環境変数として読み込む構成にしてください。

---

## 🚀 Bootstrap & Management Commands (コンテナ操作用コマンド)
ローカル開発・テスト環境の起動・停止は以下の汎用コマンドを用いて制御します。

- **環境のビルドと起動（一発起動）:**
  ```bash
  docker compose up --build
  ```
- **バックグラウンド（デタッチモード）での起動:**
  ```bash
  docker compose up -d
  ```
- **ログの監視 (リアルタイム確認):**
  ```bash
  docker compose logs -f
  ```
- **コンテナの停止 (データ永続化):**
  ```bash
  docker compose down
  ```
- **環境の完全クリーンアップ (コンテナ停止 & ボリューム・データの完全削除):**
  ```bash
  docker compose down -v
  ```
