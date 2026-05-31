# 💻 Frontend: Next.js

## 🛠️ Technical Specs
- **Framework:** Next.js (v14.x, App Router)
- **Language:** TypeScript (v5.4+, Strict Mode)
- **Package Manager:** pnpm (v9.x)

## 📌 Architecture & Coding Rules
- **Directory Structure:**
  - UI・共通コンポーネント: `/src/components`
  - ビジネスロジック・状態管理: `/src/hooks`（カスタムフックへの分離を徹底）
- **Coding Style:**
  - コンポーネントおよび関数はすべてアロー関数（`const Fn = () => {}`）で統一。
  - `any` 型の使用は原則禁止。

## 🚀 Commands
- 起動: `pnpm dev`
- リンター: `pnpm lint`
