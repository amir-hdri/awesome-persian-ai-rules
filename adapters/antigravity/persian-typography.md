# Persian Typography & BiDi Rules for Antigravity

Add this file to `~/.gemini/config/rules/persian-typography.md` (global) or `.gemini/rules/persian-typography.md` (workspace).

```markdown
# Persian Typography, Direction, and Formatting Rules

These rules apply to all Persian responses and mixed Persian/English conversations:

1. **RTL Direction & Right Alignment**:
   Wrap Persian responses in `<div dir="rtl" align="right" style="font-family: -apple-system, BlinkMacSystemFont, 'Vazirmatn', 'Shabnam', system-ui, sans-serif; line-height: 1.9; font-size: 14px;"> ... </div>` to strictly enforce right-to-left text direction, right alignment, comfortable line height (1.9), and modern typography.

2. **Emphasis on Important Points & Tech Entities**:
   - Highlight critical takeaways, verdicts, statuses, key requirements, and action items in **bold**.
   - Bold all mentioned tools, platforms, file paths, branches, and code tokens with code formatting: e.g. **`React`**, **`Docker`**, **`PostgreSQL`**, **`GitHub`**, **`main`**, **`src/App.tsx`**.
   - When embedding English tool names, technical statuses, or system metrics in Persian sentences, enclose them in parentheses where appropriate (e.g. (فریم‌ورک **`React`**)، (دیتابیس **`PostgreSQL`**)، (سرویس **`Redis`**)) to keep sentence flow seamless and natural.

3. **Strict English Digits (0-9) & Circular Badge Numbering**:
   - Write ALL numbers, counts, phase numbers, versions, issue numbers, and metrics using standard English ASCII digits (`0-9`). NEVER use Persian/Arabic digits.
   - For numbered lists, steps, and options, use modern circular monospace badges:
     `<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">1</span>`

4. **BiDi Isolation for Slashes, Issue Numbers, Paths, and Badges**:
   - ALL issue numbers with hashtags (e.g. `<span dir="ltr"><strong><code>#42</code></strong></span>`), version numbers (`<span dir="ltr">v1.0.0</span>`), slash commands, paths, and technical tokens in prose text MUST ALWAYS be wrapped in `<span dir="ltr">...</span>` so symbols like `#`, `/`, `@` are strictly on the left before the number, never flipped to the right side.
   - All status badges and indicators (e.g. `<span dir="ltr">● online</span>`) MUST have `dir="ltr"` explicitly set so that the dot (`●`) or symbol is placed strictly on the left side before the English word.

5. **Developer-Grade Minimal Cards & High-Contrast Badges**:
   - Never use pale, washed-out neon colors for small text.
   - Use high-contrast, comfortable colors: either `color: inherit;` or deep saturated tones (`#0284c7`, `#047857`, `#b45309`).
```
