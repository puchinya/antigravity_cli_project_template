# 🚀 Project Blueprint & Global Agent Rules

<project_blueprint>
This project uses a "Root-Integrated Monorepo" structure, managing the source code for both the application running on the user terminal (Frontend) and the server (Backend) in a single repository. This allows AI (Antigravity CLI / agy) and humans to co-exist at a high level and develop at lightning speed.
</project_blueprint>

---

## 📚 External Context Reference & 【GEMINI.md and Skill Definition Auto-Generation Rules】

<section id="gemini_catalog_generation">
1. **On-Demand Build of Tech Stack and Skill Definitions:**
   - Under `.agents/tech_stacks_sources/`, various technical components (catalogs) are stored. These files encapsulate the specifications of each technology as well as its technology-specific architectural rules (directory structures, code styles).
   - At the start of development, when specified by a human (e.g., "The current stack is XX.md and YY.md"), the agent must read the exact contents of the corresponding Markdown files.
   - **Auto-generation of GEMINI.md**: Beautifully integrate and structure the selected multiple catalog contents into a single document, and output (create new or overwrite) it to the root directory as `GEMINI.md`.
   - **Auto-construction of dedicated skills for each subagent**: **Simultaneously** with the generation of `GEMINI.md`, allocate the architectural rules and conventions of the selected tech stack based on each subagent's scope of concern, and dynamically create or overwrite `.agents/skills/<subagent_name>/SKILL.md` (e.g., merge Next.js specifications into `frontend_engineer/SKILL.md`, and PostgreSQL or Docker Compose specifications into `database_administrator/SKILL.md` or `backend_engineer/SKILL.md`). This dynamically constructs and optimizes the abilities of each agent on demand.
2. **Post-generation Rules:**
   - The generated `GEMINI.md` and `.agents/skills/*/SKILL.md` serve as the absolute technical specifications and capability rules for each AI in this project. Humans should not manually edit these files directly.
</section>

---

## 🏗️ Source Code Separation & Implementation Rules (Strictly for AI)

<section id="directory_separation_rules">
The source code of this project is completely separated within `/src/`. Agents must strictly separate and write code into the following directories depending on the target of the task.

1. **User Terminal Application (Frontend) Implementation & Modification:**
   - Implement everything under `/src/frontend/`.
   - Design philosophy and code conventions must follow the "Frontend" section within the auto-generated `GEMINI.md`.
2. **Server & Database (Backend) Implementation & Modification:**
   - Implement everything under `/src/backend/`.
   - Design philosophy and code conventions must follow the "Backend/Infrastructure" section within the auto-generated `GEMINI.md`.
</section>

---

## 🧠 Development Memory & Specification Creation/Update Rules

<section id="memory_and_docs_rules">
1. **GitHub Issue Verification & Creation Rule at Start of Development (AI Mandatory Check Gate):**
   <rule id="issue_check_gate">
   - Before starting tasks such as new feature development, modifications, or configuration adjustments, the AI must check if a corresponding GitHub Issue already exists.
   - If no such Issue exists, the AI must automatically create a new Issue using the GitHub CLI (`gh issue create`) or the GitHub API.
   - For development, always branch off a topic branch (e.g., `feature/issue-[number]` or `fix/issue-[number]`) corresponding to the created (or existing) Issue number before starting development.
   </rule>

2. **Daily Work Logs & Progress Memory (Ephemeral Memory / Minutes):**
   <rule id="ephemeral_memory_isolation">
   - Do **NOT** directly append daily development memories or progress to this file (`AGENTS.md`), `GEMINI.md`, or the specification files under `/docs/` (to avoid Git conflicts 100%).
   - When starting a new task or issue, always generate a separate file `.agents/memories/issue-[number].md` inside the hidden directory (or reference it if it exists), and **isolate/accumulate decisions and remaining tasks (TODOs) as minutes** there.
   </rule>

3. **Creation & Update of Specifications and Table Designs (Promotion Rule):**
   <rule id="doc_promotion_rules">
   - All ground-truth specifications for this project are stored under the `/docs/` directory at the top level so that humans can intuitively browse them via browser, etc.
   - To define or modify these, first establish consensus with humans and draft them in the "Issue-specific Memory" described above.
   - Once human consensus is reached, the agent itself must clean up and write (or append/update) them as structured, human-readable documents in the corresponding Markdown files under the `/docs/` directory.
   </rule>

4. **Definition of Done (DoD) & Specification Auto-Synchronization Rules (AI Mandatory Check Gate):**
   <rule id="definition_of_done">
   - Before making a commit involving feature implementation, database changes, or API modifications, the agent is obligated to synchronize the documents under the specification directories below with the latest code. Reporting "Task Complete" with unsynchronized specifications is considered a rule violation.
     - **Functional Specs**: Append/create functional requirements and specifications in Markdown under `/docs/features/`.
     - **Database Specs**: Append/create the latest ER diagrams, table schemas, and column definitions in Markdown under `/docs/database/`.
     - **API Specs**: Append/create the latest endpoints, requests/responses, and HTTP methods in Markdown under `/docs/api/`.
   - **Thorough Automatic Exclusion of Unnecessary Files/Directories (.gitignore Auto-Registration Rule):**
     - If the AI agent discovers files or directories that should not be tracked by Git—such as package manager temporary caches (e.g., `.pnpm-store`), build artifacts, test data, log files, or host-dependent caches—it must **automatically and immediately append exclusion rules to `.gitignore`** without waiting for human instructions.
     - If these unnecessary files accidentally enter Git tracking, immediately remove them from the index (`git rm --cached`), update `.gitignore`, and re-commit. Verify and guarantee at the DoD stage that absolutely no unnecessary files are mixed into the repository.
   - When creating commits and pull requests, ensure that these synchronized document updates and `.gitignore` exclusion settings are included in the same commit (or PR).
   </rule>
</section>

---

## 🌳 Git Branching Model & Release Flow Conventions (Enhanced GitHub Flow)

<section id="git_flow_rules">
To balance parallel development stability and release management, this project adopts an "Enhanced GitHub Flow" based on GitHub Flow. Agents and development members must strictly adhere to the following flow.

1. **Basic Branching Rules:**
   - **`main` branch (Production / Release Branch):**
     - Represents the production environment or the latest stable release. Direct commits or merging feature development PRs directly are prohibited.
   - **`dev/development-version` branch (Development/Staging Branch):**
     - Parent branch for development corresponding to each release version (e.g., `dev/v1.0.0`, `dev/v1.1.0`, etc.).
     - Issue-based development must always target this `dev/development-version` as the baseline (merge target).
   - **Topic branches (`feature/issue-[number]` / `fix/issue-[number]`):**
     - Disposable development branches corresponding to each issue or task (feature development, bug fixes, etc.).

2. **Development & Release Cycle:**
   - ① When starting a new issue, branch a topic branch (e.g., `feature/issue-42`) from the latest baseline `dev/development-version` branch.
   - ② Implement and test inside the topic branch, then create and merge a pull request targeting `dev/development-version` once completed.
   - ③ At release time, merge the `dev/development-version` branch into the `main` branch (via pull request) and tag it with the release version (e.g., `v1.0.0`).

3. **Conventions for AI Auto-Commit, Auto-Push, and Auto-PR Creation (AI Autonomous Execution Rules):**
   <rule id="ai_git_automation">
   - **Auto-Commit & Push:** Each engineer agent must automatically `git commit` changes and `git push` to the remote repository in the topic branch once the Definition of Done (DoD) is met and specifications are synchronized. The commit message must include the issue number (e.g., `feat: implement login API (issue-42)`).
   - **Auto Pull Request (PR) Creation:** The `project_manager` or the implementing engineer agent must immediately create a pull request targeting the `dev/development-version` branch using the GitHub CLI (`gh pr create`) or equivalent tools after pushing. The PR title and description must include specification changes and verification results.
   </rule>
</section>

---

## 🤖 Specialized AI Subagents & Collaborative Development Conventions

<section id="ai_subagents_rules">
Since this project is a monorepo, multiple technical elements (Frontend, Backend, DB, Design) coexist. To maximize development expertise and concurrency, we define and utilize specialized AI subagents under the coordination of the parent agent (Main AI).

The specific roles and behavioral guidelines of each subagent are separated and stored in their respective skill definition files (`SKILL.md`) under `.agents/skills/`.

1. **List of Specialized Subagents:**
   <subagent_definitions>
   - **[`doc_architect`](file://./.agents/skills/doc_architect/SKILL.md) (Spec Design & Requirements Definition):**
     - Responsible for creating functional specifications (`/docs/features/`) and data model designs, and analyzing requirements.
   - **[`frontend_engineer`](file://./.agents/skills/frontend_engineer/SKILL.md) (Frontend Development):**
     - Responsible for UI implementation and API integration under `/src/frontend/`. Dynamically configures itself based on `GEMINI.md`.
   - **[`backend_engineer`](file://./.agents/skills/backend_engineer/SKILL.md) (Backend Development):**
     - Responsible for API implementation and business logic under `/src/backend/`. Dynamically configures itself based on `GEMINI.md`.
   - **[`database_administrator`](file://./.agents/skills/database_administrator/SKILL.md) (DBA / Database Operation):**
     - Responsible for schema changes, container configuration, and designing/running migration files.
   </subagent_definitions>

2. **Rules for Collaborative Development (Delegation):**
   <rule id="collaboration_rules">
   - **Parent Agent (Main AI) Coordination Responsibility:** The parent agent acts as the project manager. It directly oversees overall roadmap creation, WBS decomposition, and consensus-building with humans (users). **It expands and files the established WBS as GitHub Issues for progress tracking.** Specific implementation tasks are delegated by summoning the appropriate specialized subagents using `invoke_subagent`.
   - **Loading Abilities (Skills):** Summoned subagents must read their own definition file (`SKILL.md` mentioned above) at the start of their task to load their roles and behavioral conventions.
   - **Separation of Concerns:** Subagents must not directly edit code outside their designated directories (e.g., `/src/frontend/` and `/src/backend/`). Cross-boundary specification changes must be requested through coordination via the parent agent.
   - **Dynamic Self-Configuration via `GEMINI.md` (Dynamic Binding):** Each specialized subagent (`frontend_engineer`, `backend_engineer`, `database_administrator`) must read `GEMINI.md` in the root directory at the start of a task, and dynamically bind/configure its own guidelines and coding standards in accordance with the specific technology stack conventions (Next.js/Flutter, Rust/Axum, PostgreSQL, etc.) defined there.
   </rule>
</section>

---

## 🐳 Core Policy for Docker Container Development (Host Environment Protection)

<section id="container_development_rules">
To ensure safety when executing commands by AI and to keep the host environment clean, this project adopts "Container-Isolated Development."

1. **Separation of Work Environment and Test Environment:**
   - **Work Environment (Agent Workspace):** An independent container (`workspace`) for code editing, Git operations, GitHub API access, and package management.
   - **Test Environment (Test Environment):** A group of test containers (`db`, `web`, `ws`) where the application runs.
   - **Principle:** Direct builds, package operations, and file deletions on the host are strictly prohibited. All development operations must be executed within the `workspace` container.

2. **Command Execution Rules & Self-Audit:**
   - When executing commands, agents must not run them directly on the host. Instead, they must add a container execution prefix to run them in the workspace container.
   - Refer to and comply with the **"🐳 Docker Container Execution Rules"** in each agent's skill definition file (`SKILL.md`) for specific execution methods and self-audit rules.

3. **Control of Test Environment:**
   - Test environment containers are launched and controlled from within the workspace container via Docker-out-of-Docker (DooD).
   - Refer to the infrastructure/DBA skill definition file ([database_administrator/SKILL.md](file://./.agents/skills/database_administrator/SKILL.md)) for specific test environment control commands and volume persistence rules.
</section>

---

## 🧠 Meta Memory: Project Template Architecture History

<meta_memory>
This section details the historical background (meta-memory) of how the project's folder structure and operational rules were decided. Agents should deeply understand this intent and act in a way that does not break this structure.

### 📅 Decision Date
- 2026-05-31

### 🎯 History and Purpose of this Architecture
- **Complete Defeat of Git Conflicts:** When parallel development is carried out across multiple branches, accumulating work logs in a single file inevitably causes conflicts during merges. To solve this, a firewall model was adopted to completely separate the common rules (`AGENTS.md`) and the dynamic memories (`.agents/memories/issue-XX.md`).
- **Human-First Document Placement:** Hiding specifications inside AI-specific dot directories significantly reduces visibility for human development members. Therefore, `/docs/` was placed at the top level where anyone can easily access it, serving as the "absolute source of truth (master)" for AI-generated code and migrations.
- **On-Demand Build Philosophy:** To reuse immutable rules across different projects, specific technical conventions were modularized into `.agents/tech_stacks_sources/`. This allows `AGENTS.md` itself to be a "pure meta-behavioral rulebook" that can be instantly deployed to any project.
- **Minutes as a Defense Against Oblivion:** Since AI loses all conversation context once a session is closed, we enforce saving "decisions and remaining tasks" in individual memory files as minutes. This prevents rework and allows development to resume from the remaining tasks (TODOs) in 1 second upon the next startup.
</meta_memory>