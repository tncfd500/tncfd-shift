# 臺南市政府消防局第五救災救護大隊 — 勤二休二排班與智慧填假系統

🚒 本系統專為臺南市政府消防局第五救災救護大隊量身打造，落實「做兩天休兩天（勤二休二）」之輪休規範、雙層智慧排假仲裁、勤務安全三大防線（最低 4 人在勤密碼授權、大隊幕僚最低 3 人在勤、合格安全官在勤）與互調班精靈。

---

## 🌐 快速線上使用（GitHub Pages）
本系統已配置為靜態入口網頁 `index.html`，可直接透過 GitHub Pages 部署並由手機或電腦瀏覽器開啟。

---

## ☁️ 多人即時同步設定指南（Google Firebase Firestore）

本系統支援 **「GitHub Pages（前端網頁）+ Google Firebase Firestore（即時雲端資料庫）」**，讓所有知道網址的同仁在手機上操作時，**0.3 秒內自動即時同步同一張班表**！

### 步驟 1：建立免費 Firebase 專案（免綁信用卡）
1. 登入 [Firebase 控制台 (Firebase Console)](https://console.firebase.google.com/)。
2. 點擊 **「新增專案」**（例如命名為 `tncfd-shift-system`），關閉 Google Analytics 後點選「建立專案」。

### 步驟 2：啟用 Firestore 資料庫
1. 進入專案後，點選左側選單的 **「Build (建構)」➔「Firestore Database」**。
2. 點擊 **「建立資料庫」**，選擇位置（如 `asia-east1` 台灣 或 `asia-southeast1` 新加坡）。
3. 安全性規則選擇 **「以測試模式啟動 (Start in test mode)」**（或設定讀寫規則如下）：
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /shifts/{document=**} {
         allow read, write: if true;
       }
     }
   }
   ```
4. 點擊「啟用」。

### 步驟 3：取得前端設定代碼 (firebaseConfig)
1. 點選專案總覽旁邊的 **「專案設定 (齒輪圖示)」➔「一般」**。
2. 在「您的應用程式」區塊點選 **「網頁圖示 (</>)」** 註冊網頁應用程式。
3. 複製畫面中的 `firebaseConfig` 物件內容，例如：
   ```json
   {
     "apiKey": "AIzaSy...",
     "authDomain": "tncfd-shift-system.firebaseapp.com",
     "projectId": "tncfd-shift-system",
     "storageBucket": "tncfd-shift-system.appspot.com",
     "messagingSenderId": "...",
     "appId": "..."
   }
   ```

### 步驟 4：貼入網頁並啟用
1. 開啟排班網頁，點擊頂端 **「☁️ 雲端多人同步」** 按鈕。
2. 將上述代碼貼入文字框中，點選 **「💾 儲存並啟用即時同步」**。
3. 頂端指示燈即會亮起 **「🟢 雲端同步已連線」**。從此任何同仁填假或調班，所有在線同仁之手機與電腦畫面將自動即時刷新！

---

## 🚀 如何發布到 GitHub Pages？

1. 在 GitHub 建立一個公開或私有 Repository（例如 `tncfd-shift-system`）。
2. 將此資料夾內的所有檔案（包含 `index.html`）推送至該 Repository：
   ```bash
   git init
   git add .
   git commit -m "feat: 發布勤二休二排班與智慧填假系統"
   git branch -M main
   git remote add origin https://github.com/<您的GitHub帳號>/tncfd-shift-system.git
   git push -u origin main
   ```
3. 在 GitHub 該專案頁面點擊 **Settings ➔ Pages**。
4. 在 **Build and deployment** 底下的 **Source** 選擇 `Deploy from a branch`，Branch 選擇 `main` / `/(root)`，點擊 **Save**。
5. 等待 1 分鐘，即可獲得公開網址：`https://<您的GitHub帳號>.github.io/tncfd-shift-system/`！
