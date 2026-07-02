# 作品集網站 · 維護說明

> 給未來的你:這份文件說明「網站是哪個檔、怎麼改、怎麼重新上線」。不需要工程背景,照著做就行。

---

## 1. 網站是哪個檔?

**整個網站 = 一個檔:`index-styleA.html`**
(所有文字、樣式、圖片清單、程式都在裡面。改網站 = 改這個檔。)

其他檔案:
- `images/` — 所有圖片。
- `index.html`、`index.dark-backup-*.html` — 舊版備份,**沒有用到、不要理它**。
- `deploy/`、`build.sh`、`netlify.toml` — 部署用的設定(見第 4 節)。

> ⚠️ **只改 `index-styleA.html`**,別動 `index.html`。

---

## 2. 怎麼編輯?(兩種)

### 方式 A:小改(換文字、數字、連結)— 直接找、直接改
在 GitHub 網頁打開 `index-styleA.html`,用瀏覽器搜尋(Cmd/Ctrl+F)找到那段文字 → 改 → 按 **Commit**(存檔)→ 網站幾分鐘後自動更新。

### 方式 B:大改(版型、加區塊)— 交給 AI
這個檔是「單一自包含 HTML」,可以貼給**任何 AI**(Claude.ai、ChatGPT 都行):
> 把 `index-styleA.html` 全部內容貼進去 →「幫我把 XX 改成 YY,回傳完整檔案」→ 把結果貼回 GitHub 覆蓋、Commit。

**不限定 Claude Code。**

---

## 3. 常見修改:去哪裡找

用 Cmd/Ctrl+F 搜尋以下關鍵字,就會跳到對應位置:

| 想改什麼 | 搜尋這個關鍵字 |
|---|---|
| 開場大標語(金句) | `class="tagline"` |
| 職稱(Senior Marketing…) | `class="role"` |
| Hero 六張數字卡 | `class="stat-row"` |
| Email / 電話 / LinkedIn | `vivienen0610` |
| **履歷下載連結** | `Vivien-Hsu-CV.pdf`(見第 5 節) |
| 簡介的合作夥伴推薦語 | `Partner testimonials` |
| AI Agent 內容 | `const AGENTS`(亮點句在 `const TAKE`) |
| 銷售策略 / Sales Kit | `2026 Dcard KA Sales Kit` |
| Sales Kit 幻燈片清單 | `const SALESKIT` |
| 消費報告幻燈片清單 | `const CONSUMER` |
| 年度通案三檔 | `id="campaign"` |
| 「我的工作方法」那條 | `我的工作方法` |
| 品牌提案(含金句、成果) | `const PROPOSALS` |
| 品牌合作成果 / 影片 | `const COLLAB` |

**改文字**:找到中文那段,直接改字即可(每段通常長這樣 `<span class="zh">中文</span><span class="en">English</span>`,中英各改一份)。

**換圖片**:把新圖放進 `images/` 對應資料夾,檔名沿用舊的最省事;若換新檔名,就把 HTML 裡的舊路徑改成新路徑。

---

## 4. 怎麼重新上線?(GitHub + Netlify 自動部署)

一次性設定好後,**以後只要 push 就自動更新**:

1. 在 GitHub 建一個 repo,把整個專案推上去。
2. 到 [Netlify](https://app.netlify.com) → Add new site → Import from Git → 選這個 repo。
3. Netlify 會自動讀 `netlify.toml`(已設定好:打包 `deploy/`、發佈),直接按部署。
4. 之後**每次在 GitHub Commit,網站自動重建上線**,網址不變。

> 原理:`build.sh` 會把 `index-styleA.html` 複製成 `deploy/index.html` 並帶上圖片,Netlify 發佈 `deploy/` 資料夾。你完全不用管這步,Netlify 自動做。

**手動打包(若要本機測或拖拉上傳):** 終端機執行 `bash build.sh`,產出 `deploy/` 資料夾,拖到 https://app.netlify.com/drop 也可。

---

## 5. 履歷下載

「下載履歷」按鈕目前指向 `Vivien-Hsu-CV.pdf`。二選一:
- **放檔**:把履歷命名為 `Vivien-Hsu-CV.pdf` 放進專案根目錄(和 `index-styleA.html` 同層),`build.sh` 記得一起複製(或直接放進 `deploy/`)。
- **用雲端連結**:搜尋 `Vivien-Hsu-CV.pdf`,把兩處的 `href="Vivien-Hsu-CV.pdf"` 改成你的雲端連結(記得設公開檢視)。

---

## 6. 安全 & 提醒

- **改壞了能救**:GitHub 有版本紀錄,可在 repo 的 Commits 找到上一版、還原。所以放心改。
- **本機預覽**:直接用瀏覽器打開 `index-styleA.html` 就能看(滾動動畫、圖片都會正常)。
- ⚠️ **客戶機密**:品牌提案的圖片含客戶機密,已做模糊處理。**日後若換上新的提案圖,務必先確認競品排名/數字都糊化再上線**——網站公開後任何人都能放大檢視。
- **分享預覽圖**:換了 hero 或想更新社群分享縮圖,重新產生 `images/og-cover.png` 即可;部署後記得把 HTML 裡 `og:image` 換成完整網址 `https://你的網域/images/og-cover.png`。
