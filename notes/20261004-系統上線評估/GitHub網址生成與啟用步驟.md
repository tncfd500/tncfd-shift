# GitHub 網址生成指南與推播啟用步驟

## 一、批判性顧問說明：為什麼我現在無法直接給您一個「已上線」的 GitHub 網址？

根據 GitHub 官方安全架構規範：
1. **GitHub Pages 網址格式**為：
   ```
   https://<您的GitHub帳號>.github.io/<專案儲存庫名稱>/
   ```
2. **需要您的 GitHub 授權**：本機目前尚未登入您的 GitHub 帳號（需要您的 GitHub 帳號名稱與上傳授權）。AI 無法也不應該在未經您授權的情況下，擅自把包含消防大隊同仁名冊的系統推送到未知帳號上。

---

## 二、只需兩步驟，立即產生您的專屬網址！

### 步驟 1：在 GitHub 建立 Repository（儲存庫）
1. 打開瀏覽器登入 [GitHub](https://github.com/)。
2. 點擊右上角的 **「+」➔「New repository」**。
3. **Repository name** 輸入例如：`tncfd-shift`（或您喜歡的英文名稱）。
4. 選擇 **Public**（公開，免費版 Pages 需設為 Public；若有 GitHub Pro/Team 亦可選 Private）。
5. 點擊最下方綠色按鈕 **「Create repository」**。

---

### 步驟 2：告訴我您的 GitHub 帳號名稱，或在本機執行推送

若您告訴我您的 **GitHub 帳號名稱** 與剛建立的 **Repository 名稱**（例如：帳號是 `tncfd5`，專案是 `tncfd-shift`）：
- 您的專屬上線網址將會是：
  👉 `https://tncfd5.github.io/tncfd-shift/`

您也可以直接在專案目錄下打開終端機執行以下 4 行指令上傳：
```bash
git init
git add .
git commit -m "feat: 發布排班與智慧填假系統"
git branch -M main
git remote add origin https://github.com/<您的GitHub帳號>/<專案名稱>.git
git push -u origin main
```
上傳後至 GitHub 專案頁面點擊 **Settings ➔ Pages**，將 Branch 設定為 `main` 並按 **Save**，網址即正式生效！
