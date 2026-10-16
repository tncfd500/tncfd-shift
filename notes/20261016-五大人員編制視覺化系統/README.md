# 臺南市政府消防局第五大隊 人員編制視覺化系統

## 專案位置與線上網址
- **線上公開網址**：[https://tncfd500.github.io/tncfd-shift/personnel.html](https://tncfd500.github.io/tncfd-shift/personnel.html)
- **中文網址別名**：[https://tncfd500.github.io/tncfd-shift/1150116五大人員編制_視覺化系統.html](https://tncfd500.github.io/tncfd-shift/1150116五大人員編制_視覺化系統.html)
- **勤二休二排班系統**：[https://tncfd500.github.io/tncfd-shift/](https://tncfd500.github.io/tncfd-shift/)
- **桌面快捷檔案**：`C:\Users\TNCFD\Desktop\1150116五大人員編制_視覺化系統.html`
- **本機原始檔案**：`c:\Users\TNCFD\Desktop\勤務系統\personnel.html`

## 系統現況與修復說明 (2026-10-17 核心穩定修復)

### 1. 根本問題診斷與修復
- **事故原因**：在先前版本中，匯出 Excel 函式內的 `</body>` 字串意外被腳本替換工具誤判為 HTML 結尾，導致彈窗標籤與 `</body>` 被硬生生插入 JavaScript 代碼中間，進而引發瀏覽器腳本致命語法錯誤，造成整個頁面資料未加載且按鈕無法點選。
- **修復處置**：
  1. 將 HTML 結構徹底重新編譯，完全隔離 HTML 標籤與匯出字串。
  2. 加入 DOM Ready 雙重監聽（`DOMContentLoaded` + `window.onload`）與健檢容錯機制。
  3. 加入本地快取自我修復機制：若瀏覽器存有舊版損毀快取，自動辨識並瞬間回退至內建完整 14 個單位 231 員預設名冊，杜絕空白或無法點擊的狀況。

### 2. 完整功能一覽
- **隨開即編**：無密碼阻擋，任何人點開皆可直接點擊「職稱」或「姓名」行內修改。
- **直覺拖曳 (Drag & Drop)**：長按人員卡片（`⠿` 圖示）可直接拖曳跨分隊調動或同分隊排班排序。
- **實體存檔功能**：
  - 頂部設有顯眼的「💾 儲存存檔」按鈕，支援 `Ctrl + S` 秒速存檔。
  - 即時顯示最後存檔時間，並提供「📜 存檔紀錄」版本快照，誤操作隨時一鍵還原。
- **附註說明修改**：頂部「📌 附註說明」欄位開放自由點擊修改。
- **四種專業檢視**：組織卡片、官制總表、人事調動對照（Sheet1）與人力分析圖表。
- **資料匯出與列印**：支援匯出最新 Excel 試算表及 A4 橫式最佳化紙本列印。
