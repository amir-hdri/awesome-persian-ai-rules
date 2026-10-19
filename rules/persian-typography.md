# Persian Typography, Direction, and BiDi Standards for AI Agents

> **Standard Version**: 1.1.0  
> **Target Audience**: AI Coding Assistants, LLMs, Chat Agents (Antigravity, Cursor, Claude Code, OpenCode, Windsurf, Copilot)

---

## 1. Core Directives

### 1.1 RTL Direction & Right Alignment Wrapper
All Persian responses should be encapsulated in a top-level RTL container to guarantee consistent line spacing, proper right alignment, and system font fallback:
```html
<div dir="rtl" align="right" style="font-family: 'Iranian Sans', 'IRANSans', 'IranSans', 'Vazirmatn', -apple-system, BlinkMacSystemFont, system-ui, sans-serif; line-height: 1.9; font-size: 14px;">
  <!-- Persian Response Content -->
</div>
```

### 1.2 Strict English Digits (0-9)
- Always use standard ASCII digits (`0-9`) for all numbers, counts, issue IDs, dates, versions, percentages, and metrics.
- **Never** output Persian/Arabic digits (`۰, ۱, ۲, ۳, ۴, ۵, ۶, ۷, ۸, ۹`). This prevents BiDi inversion bugs, database query syntax errors, and inconsistencies across codebases.

### 1.3 Ordered Lists & Monospace Circular Badges (Option A)
Standard Markdown numbered lists (e.g. `1. `, `2. `) in RTL mode frequently flip the period to the wrong side (`.1`). To eliminate this rendering defect permanently, use circular monospace badges:
```html
<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-inline-end:8px;">1</span>
```

### 1.4 BiDi Isolation for Tokens, Hashtags, and Indicators
In an RTL block, characters with neutral or weak Unicode directionality (`#`, `/`, `●`, `-`, `@`, `~`) will flip positions if placed adjacent to Persian words or numbers.  
You **must** isolate these elements with an explicit LTR wrapper:

- **Issue Hashtags**:
  - ❌ Incorrect: `ایشو #42` (renders visually as `ایشو 42#`)
  - ✅ Correct: `ایشو <span dir="ltr"><strong><code>#42</code></strong></span>` (renders visually as `ایشو #42`)
- **Status Indicators & Dots**:
  - ❌ Incorrect: `● online` (renders with dot on the right side)
  - ✅ Correct: `<span dir="ltr">● online</span>` (renders with dot on the left side)
- **Slash Commands & Paths**:
  - ❌ Incorrect in Markdown: `` `<span dir="ltr"><code>/deploy</code></span>` `` or `` `<code dir="ltr">/deploy</code>` `` (renders raw escaped HTML text in chat UI)
  - ❌ Incorrect raw text: `/deploy` inside RTL text (the `/` flips to the end: `deploy/`)
  - ✅ Correct in pure Markdown: `` `‎/deploy` `` (anchored with Unicode LRM `\u200e` before the slash inside standard backticks)
  - ✅ Correct in HTML prose: `<span dir="ltr"><code>/deploy</code></span>` (only when outside backticks)
- **Version Tags**:
  - ❌ Incorrect: `نسخه v1.0.0`
  - ✅ Correct: `نسخه <span dir="ltr"><code>v1.0.0</code></span>` or `نسخه `‎`v1.0.0`‎``
- **Critical Anti-Pattern**: NEVER wrap HTML tags inside markdown backticks (e.g. NEVER write `` `<code dir="ltr">...</code>` `` or `` `<span dir="ltr">...</span>` ``), as chat markdown renderers escape them and display raw escaped HTML text instead of formatted code chips.

### 1.5 Emphasis and Code Entities
- Highlight critical takeaways, conclusions, and verdicts in **bold**.
- Wrap names of tools, platforms, file paths, branch names, and code identifiers in **`bold code`**:
  - Examples: **`React`**, **`Docker`**, **`PostgreSQL`**, **`GitHub`**, **`main`**, **`config.json`**.
- When embedding English technical terms or tool names into Persian sentences, enclose them in parentheses where natural:
  - Example: `(سرویس **Redis**) با (دیتابیس **PostgreSQL**) در وضعیت (حالت **active**) متصل شد.`

### 1.6 Developer-Grade Accessible Badges & Cards
- Never use pale, washed-out neon colors (e.g. light cyan `#38bdf8`) on white backgrounds for text.
- Use high-contrast, eye-friendly tones with high readability:
  - Success: `color: #047857; background: rgba(16, 185, 129, 0.12);`
  - Info / Action: `color: #0284c7; background: rgba(56, 189, 248, 0.15);`
  - Warning: `color: #b45309; background: rgba(245, 158, 11, 0.12);`
  - Error: `color: #b91c1c; background: rgba(239, 68, 68, 0.12);`

### 1.7 RTL Markdown Tables & Text Alignment
- **RTL Column Reading Order**: In Persian RTL reading order (right-to-left), the primary descriptive column (e.g. **کاربرد** یا عنوان) MUST ALWAYS be defined as the **FIRST column** in the Markdown table (e.g. `| کاربرد | دستور اسلش |`), so the browser's RTL engine places it on the right side.
- **Strict Right-Alignment (`---:`)**: All text columns must be right-aligned using `---:` instead of default or left-alignment (`:---`), ensuring Persian descriptions and headers are aligned to the right.
- **Slash Commands in Table Cells**: Anchor commands with Unicode LRM (`\u200e`) before the leading slash inside backticks (e.g. `` `‎/cairn:status` ``), ensuring the slash stays on the left of the command name.
- **Clean Markdown Tables**: Always generate standard GitHub Flavored Markdown tables. Avoid raw unrendered HTML `<table>` blocks or unescaped HTML tags inside table cells.

### 1.8 نیم‌فاصله (ZWNJ) طبق نگارش رسمی فارسی
- **Use ZWNJ (`\u200c`)** for prefixes and suffixes, per the official Persian orthography (دستور خط فارسی، فرهنگستان زبان و ادب فارسی):
  - «می‌شود»، «نمی‌تواند»، «بخوانید»
  - «کتاب‌ها»، «داده‌های»، «بزرگ‌تر»، «پیچیده‌ترین»
- **Compound words** take ZWNJ between their parts:
  - «برنامه‌ریزی»، «پیاده‌سازی»، «به‌روزرسانی»، «راستی‌آزمایی»، «یکپارچه‌سازی»، «دانش‌آموز»
- **Separate words** take a regular space: «به صورت»، «به عنوان»، «به کار»، «راست به چپ».
- **Clean Punctuation Spacing**: Attach punctuation marks (`،`, `.`, `:`, `؛`, `؟`, `!`) directly to the preceding word without spaces, followed by exactly one space before the next word.



