# Persian Typography, Direction, and BiDi Standards for AI Agents

> **Standard Version**: 1.0.0  
> **Target Audience**: AI Coding Assistants, LLMs, Chat Agents (Antigravity, Cursor, Claude Code, OpenCode, Windsurf, Copilot)

---

## 1. Core Directives

### 1.1 RTL Direction & Right Alignment Wrapper
All Persian responses should be encapsulated in a top-level RTL container to guarantee consistent line spacing, proper right alignment, and system font fallback:
```html
<div dir="rtl" align="right" style="font-family: -apple-system, BlinkMacSystemFont, 'Vazirmatn', 'Shabnam', system-ui, sans-serif; line-height: 1.9; font-size: 14px;">
  <!-- Persian Response Content -->
</div>
```

### 1.2 Strict English Digits (0-9)
- Always use standard ASCII digits (`0-9`) for all numbers, counts, issue IDs, dates, versions, percentages, and metrics.
- **Never** output Persian/Arabic digits (`۰, ۱, ۲, ۳, ۴, ۵, ۶, ۷, ۸, ۹`). This prevents BiDi inversion bugs, database query syntax errors, and inconsistencies across codebases.

### 1.3 Ordered Lists & Monospace Circular Badges (Option A)
Standard Markdown numbered lists (e.g. `1. `, `2. `) in RTL mode frequently flip the period to the wrong side (`.1`). To eliminate this rendering defect permanently, use circular monospace badges:
```html
<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">1</span>
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
  - ❌ Incorrect: `/deploy` or `src/components/App.tsx` inside Persian prose
  - ✅ Correct: `<span dir="ltr"><code>/deploy</code></span>`
- **Version Tags**:
  - ❌ Incorrect: `نسخه v1.0.0`
  - ✅ Correct: `نسخه <span dir="ltr"><code>v1.0.0</code></span>`

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
