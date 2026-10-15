# Persian Typography & BiDi Rules for Antigravity

Add this file to `~/.gemini/config/rules/persian-typography.md` (global) or `.gemini/rules/persian-typography.md` (workspace).

```markdown
# Persian Typography, Direction, and Formatting Rules

These rules apply to all Persian responses and mixed Persian/English conversations:

1. **RTL Direction & Right Alignment**:
   Wrap Persian responses in `<div dir="rtl" align="right" style="font-family: 'Vazirmatn', 'Shabnam', 'Sahel', 'Samim', -apple-system, BlinkMacSystemFont, system-ui, sans-serif; line-height: 1.9; font-size: 14px;"> ... </div>` to strictly enforce right-to-left text direction, right alignment, comfortable line height (1.9), and prioritize native Persian typography over fallback fonts.

2. **Emphasis on Important Points & Tech Entities**:
   - Highlight critical takeaways, verdicts, statuses, key requirements, and action items in **bold**.
   - Bold all mentioned tools, platforms, file paths, branches, and code tokens with code formatting: e.g. **`React`**, **`Docker`**, **`PostgreSQL`**, **`GitHub`**, **`main`**, **`src/App.tsx`**.
   - When embedding English tool names, technical statuses, or system metrics in Persian sentences, enclose them in parentheses where appropriate (e.g. (فریم‌ورک **`React`**)، (دیتابیس **`PostgreSQL`**)، (سرویس **`Redis`**)) to keep sentence flow seamless and natural.

3. **Strict English Digits (0-9) & Circular Badge Numbering**:
   - Write ALL numbers, counts, phase numbers, versions, issue numbers, and metrics using standard English ASCII digits (`0-9`). NEVER use Persian/Arabic digits.
   - For numbered lists, steps, and options, use modern circular monospace badges:
     `<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">1</span>`

4. **BiDi Isolation for Slashes, Issue Numbers (#93), Paths, and Badges**:
   - For slash commands, paths, and code tokens (e.g. `/cairn:work 1`, `#93`), anchor them with Unicode LRM (`\u200e`) directly before the leading symbol (e.g. `‎/cairn:work 1` or `‎#93`) inside standard markdown backticks.
   - NEVER wrap HTML tags inside markdown backticks (e.g. NEVER write `` `<code dir="ltr">...</code>` `` or `` `<span dir="ltr">...</span>` ``), as markdown renderers display raw escaped HTML text instead of formatted code.
   - All status badges and indicators (e.g. `‎● all systems green‎`) must keep the symbol strictly on the left side before the English word.

5. **Developer-Grade Compact Tables & RTL Layout**:
   - **RTL Column Order**: In Persian RTL reading order (right-to-left), the primary descriptive column (e.g. **کاربرد** یا عنوان) MUST ALWAYS be the FIRST column in the table definition (e.g. `| کاربرد | دستور اسلش |`), so the browser renders it on the far right.
   - **Text Alignment (Right-Align)**: Always use right-alignment (`---:`) for text columns so that Persian descriptions and headers are strictly right-aligned, avoiding accidental left-alignment (`:---`).
   - **Clean Markdown Tables**: Use standard clean GitHub Flavored Markdown tables. Avoid raw unrendered HTML `<table>` blocks or unescaped HTML tags inside table cells.
   - **High-Contrast Badges**: Never use pale, washed-out neon colors for small text. Use high-contrast, comfortable colors (`#0284c7`, `#047857`, `#b45309`) on subtle translucent backgrounds with at least 12px font size.

6. **Strict Persian ZWNJ (نیم‌فاصله) & Word Spacing**:
   - Always use genuine Unicode ZWNJ (`\u200c`) for prefixes («می‌شود»، «نمی‌تواند»), suffixes («ها»، «های»، «تر»، «ترین»), and compound words («راست‌به‌چپ»، «برنامه‌ریزی»، «پیاده‌سازی»، «به‌روزرسانی»، «راستی‌آزمایی»، «بسته‌بندی»، «به‌صورت»، «به‌عنوان»، «به‌کار»).
   - Never replace ZWNJ with a space (❌ `برنامه ریزی`) or hyphen (❌ `راست-به-چپ`).
   - Attach punctuation (`، . : ؛ ؟ !`) to the preceding word without spaces, followed by a single space before the next word.
```
