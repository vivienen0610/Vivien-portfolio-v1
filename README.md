# 作品集網站 · 說明書 (Spec / 維護說明)

> 給未來的你:這份文件說明「網站是哪個檔、怎麼改、怎麼重新上線」。不需要工程背景,照著做就行。
>
> **這份文件也可以整份貼給任何 AI**,它就能秒懂你的網站、幫你改得更準。
> 只想快速改東西 → 看 `如何改網頁.md`(內含「貼給 AI 的範本」)。

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

**不限定 Claude Code。** 現成的「貼給 AI 的範本」放在 `如何改網頁.md`,複製來套用即可。

---

## 3. 常見修改:去哪裡找

用 Cmd/Ctrl+F 搜尋以下關鍵字,就會跳到對應位置:

| 想改什麼 | 搜尋這個關鍵字 |
|---|---|
| 開場大標語(金句) | `class="tagline"` |
| 職稱(Senior Marketing…) | `class="role"` |
| Hero 五張數字卡 | `class="stat-row"` |
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

## 4. 怎麼重新上線?(已設定好自動部署)

**設定已完成(2026/7):**
- GitHub repo:`github.com/vivienen0610/Vivien`(branch `main`)
- Netlify 站 `ubiquitous-crostata-bd1d44` 已連動這個 repo。
- **只要 push 到 GitHub,Netlify 就自動重建、上線,網址不變**(約 1 分鐘)。

**更新網站的固定流程:**
1. 改好 `index-styleA.html`(在電腦上用編輯器,或直接在 GitHub 網頁上改)
2. 若在電腦上改:打開 **GitHub Desktop** → 填一句說明 → **Commit** → 按 **Push origin**
   (若直接在 GitHub 網頁改:按 **Commit changes** 即可,這步就等於 push)
3. Netlify 自動偵測 → 重建 → 上線 ✅

> 原理:`build.sh` 會把 `index-styleA.html` 複製成 `deploy/index.html` 並帶上圖片,Netlify 發佈 `deploy/` 資料夾。你完全不用管這步,Netlify 自動做。

> ⚠️ 上傳一律走 **GitHub(Push / Commit)**。**不要**再用「拖曳 `deploy/` 到 Netlify」的舊方法,會跟自動部署打架。
>
> 💡 電腦的「指令列 git」目前沒有存 GitHub 憑證,所以上傳那一下要用 **GitHub Desktop** 按 Push(它登入後就記得帳號了)。

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

---

## 7. 換電腦 / 交接須知(重要)

**核心:這個網站不綁定任何一台電腦。** 程式碼與完整修改歷史都在 **GitHub**,網站由 **Netlify** 託管,兩者都綁在你的**個人帳號**上。只要帳號能登入,資料就不會遺失、網站照常運作,跟哪台電腦、有沒有 Claude Code 都無關。

**換到新電腦時,怎麼拿回檔案(不用從舊電腦搬):**
- 直接從 GitHub 取得最新、最完整的版本:
  - 最簡單:到 `github.com/vivienen0610/Vivien` → 綠色 **Code** 鈕 → **Download ZIP**
  - 或裝 GitHub Desktop → 登入 → **Clone** 這個 repo 到新電腦

**離職 / 交接前務必確認(最重要,風險都在「帳號登不進去」):**
1. **GitHub 帳號**(vivienen0610)用**個人 email** 能獨立登入,設好密碼與雙重驗證(2FA)。→ 程式碼與歷史永久保留。
2. **Netlify 帳號**能獨立登入。⚠️ 若當初是用「Google / GitHub 一鍵登入」,務必確認那是**私人帳號**,不是公司帳號 / 公司信箱,否則離職後可能登不進去。
3. 網站上的聯絡資訊(email / 電話 / LinkedIn)都是私人的 → OK。

**之後怎麼改網頁(不需 Claude Code):** 見第 2、4 節 —— 在 GitHub 網頁改 `index-styleA.html` → Commit → Netlify 自動上線。要 AI 幫忙就用 `如何改網頁.md` 裡的範本。

**⚠️ 不要帶走:** `ai-portfolio-private/`(未模糊的客戶提案原圖)屬客戶機密,離職後不應留存;網站只需已模糊版,那個已經在 repo 裡了。
