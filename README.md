# PRD 開發專案

這是一個整合了 **OpenSpec** 與 AI 代理（Antigravity）協作的開發環境。
專案中配置了自動化的開工與收工腳本，協助開發者與 AI 順暢地進行版本控制與任務交接。

## 系統需求
*   **Node.js**: `> v24.13.x`
*   **GitHub CLI**: 建議安裝以方便驗證與操作 GitHub。
*   **OpenSpec**: `v1.1.1` (`npm install -g @fission-ai/openspec@1.1.1`)

## 快速上手

### 1. 開工 (Start Development)
在每次開始開發之前，請在終端機執行：
```bash
npm run dev:start
```
**這個指令會：**
*   自動從 GitHub (`origin main`) 抓取最新程式碼 (`git pull`)。
*   顯示 `handover.md`（交接文件），讓您與 AI 了解上次開發到哪裡，以及接下來的任務。
*   提供後續的操作提示。

### 2. 開發階段 (Development Phase)
我們使用 OpenSpec 來管理 AI 任務，您可以透過以下斜線指令 (Slash commands) 要求 AI 執行工作：
*   `/opsx:new <任務描述>`：建立一個新的功能變更（目錄會自動加上 `01-`、`02-` 等編號前綴）。
*   `/opsx:continue`：接續尚未完成的變更計畫。
*   `/opsx:apply`：讓 AI 套用經過討論的程式碼變更。

### 3. 收工 (Wrap Up)
完成一天的開發或告一段落時，請執行：
```bash
npm run dev:ending
```
**這個指令會：**
*   提醒並協助建立或更新 `tasks.md` 與 `handover.md`。
*   自動將已完成的 OpenSpec 變更進行歸檔 (archive)。
*   將所有進度打包 (Commit) 並自動推送到 GitHub (`git push`)。

## 專案結構
*   `.agent/`：OpenSpec 的核心設定與工作流定義 (Workflows & Skills)。
*   `startup.sh`：開工腳本。
*   `ending.sh`：收工腳本。
*   `package.json`：專案的 npm 設定檔，包含了腳本指令。
*   `HISTORY.md`：專案建置與 AI 對話過程紀錄。
*   `handover.md`：開發交接文件（於初次收工或開工時產生）。
*   `tasks.md`：任務追蹤清單（於初次收工時產生）。
