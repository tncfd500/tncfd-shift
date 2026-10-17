# 臺南市政府消防局第五大隊 人員編制視覺化系統

## 專案位置與線上網址
- **線上公開網址**：[https://tncfd500.github.io/tncfd-shift/personnel.html](https://tncfd500.github.io/tncfd-shift/personnel.html)
- **中文網址別名**：[https://tncfd500.github.io/tncfd-shift/1150116五大人員編制_視覺化系統.html](https://tncfd500.github.io/tncfd-shift/1150116五大人員編制_視覺化系統.html)
- **勤二休二排班系統**：[https://tncfd500.github.io/tncfd-shift/](https://tncfd500.github.io/tncfd-shift/)
- **桌面快捷檔案**：`C:\Users\TNCFD\Desktop\1150116五大人員編制_視覺化系統.html`
- **本機原始檔案**：`c:\Users\TNCFD\Desktop\勤務系統\personnel.html`

## 最新功能亮點 (v1.3 鍵入即時跳動與高亮反饋版)

### 1. 為什麼先前測試覺得「沒有即時變動」？
1. **失焦延遲問題**：舊版必須在輸入框按 Enter 或點擊其他地方「失焦（blur）」後才會觸發重算，在打字輸入當下上方數字完全不動。
2. **門檻限制缺陷**：舊版對調動人數設置了 `Math.max(..., 34)` 固定底線，導致小於 34 時數字被固定不動；且大隊部助理數被既有欄位阻擋累加。
3. **瀏覽器 CDN 快取**：GitHub Pages 與瀏覽器通常會保留快取，未強制刷新（Ctrl+F5）容易看到尚未更新的舊版腳本。

### 2. 本次核心修正重點
- **鍵入即時響應（Live Keystroke Reactivity）**：
  - 在卡片上點擊「職稱」修改為「事務助理」或「役男」，**每按一個鍵（oninput），頂部數字立刻跳動，無需按 Enter 或等待失焦！**
  - 在人員編輯彈窗（Modal）輸入職稱或在備註填寫「調入/特考」，頂部數字隨鍵入即時動態連動。
- **動態跳動光暈動畫（Pulse Feedback）**：數字變動時伴隨微型放大與蔚藍光暈高亮反饋，肉眼即刻清晰可見。
- **直覺的分隊役男與前後人數微調標籤**：
  - 各分隊卡片右上角設有「前: -」、「後: -」、「役: 1」的互動徽章，點擊即可修改分隊役男數，頂部替代役男與編制總人數立即同步跳動！
- **嚴守版面一致性**：完全不更動既有的整體美觀 UI 版面、卡片外觀與操作配置（其他地方零變動）。
