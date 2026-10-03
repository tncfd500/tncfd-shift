# GitHub 能否用於本系統即時同步之深度評估與實作指南

## 一、結論：單純靠 GitHub「不行」，但「GitHub + 免費雲端資料庫」可以！

### 1. 為什麼單純 GitHub Pages 做不到？（官方規格限制）
根據 GitHub 官方技術規範（[docs.github.com](https://docs.github.com/pages)）：
* **純靜態託管（Static-only）**：GitHub Pages 只能提供 HTML、CSS、JavaScript 靜態檔案下載，**不支援後端程式（Node.js / Python）、也沒有動態資料庫**。
* **資料仍在本機**：若只把 HTML 傳到 GitHub Pages，同仁打開網址操作時，排班資料依然只存留在各人手機的 `localStorage`，A 同仁劃假，B 同仁手機依然看不到。
* **不能用 GitHub Commit 當資料庫**：
  * 有人提議「同仁填假時自動呼叫 GitHub API commit 檔案」，但這會造成：
    1. **延遲極高**：每次 commit 到生效需要 1～3 分鐘建置，無法達到 1 秒內即時同步。
    2. **衝突覆蓋（Merge Conflict）**：兩位同仁同時點選送出，後者會直接報錯失敗。
    3. **Token 外洩風險**：必須把具備寫入權限的 GitHub Personal Access Token 暴露在前端網頁中，極度危險。

---

## 二、可行架構：GitHub Pages（前端）+ 免費雲端資料庫（後端）

這是業界最標準且 100% 免費的架構：
```
[同仁手機/電腦] 
     │
     ├── 1. 抓取網頁介面 ──────> GitHub Pages (免費靜態網頁託管)
     │
     └── 2. 即時連線讀寫班表 ──> Google Firebase Firestore / Supabase (免費雲端資料庫)
```

### 此架構的優點：
1. **網址好記**：網址為 `https://<您的帳號>.github.io/<專案名>/`。
2. **秒級即時同步**：任何同仁在手機上調班或劃假，其他人的畫面在 0.3 秒內自動變色更新。
3. **完全免費**：
   * GitHub Pages：免費無流量限制。
   * Google Firebase Firestore：每天提供 50,000 次免費讀取、20,000 次寫入（一個大隊一個月用不到 5%）。

---

## 三、建議執行三步驟

1. **申請/準備 Google Firebase 免費專案**：
   - 登入 [Firebase Console](https://console.firebase.google.com/)，點選「建立專案」。
   - 開啟 Firestore Database（測試或安全規則模式）。
   - 取得一組前端設定碼（含 `apiKey`, `projectId`）。
2. **將 Firebase 串接代碼植入系統**：
   - 我會幫您將 `勤二休二排班與智慧填假系統.html` 改為「監聽 Firestore 即時快照（onSnapshot）」。
3. **上傳至 GitHub 並啟用 Pages**：
   - 將檔案推送到 GitHub Repository，在 Settings -> Pages 啟用，即可獲得公開上線網址！
