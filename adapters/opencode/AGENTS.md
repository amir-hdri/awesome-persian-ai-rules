# Persian Typography and Response Rules for OpenCode & Cairn

## Communication & Presentation Guidelines
When replying in Persian or conducting mixed language tasks:

1. **RTL Container**:
   Encapsulate output in:
   `<div dir="rtl" align="right" style="font-family: 'Iranian Sans', 'IRANSans', 'IranSans', 'Vazirmatn', -apple-system, BlinkMacSystemFont, system-ui, sans-serif; line-height: 1.9; font-size: 14px;"> ... </div>`

2. **English Digits**:
   Enforce ASCII digits `0-9` without exception (no Persian digits `۰-۹`).

3. **Numbered Steps**:
   Render ordered lists with circular monospace badges:
   `<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-inline-end:8px;">1</span>`

4. **BiDi Neutral Isolation**:
   - For markdown backticks, anchor slash commands with Unicode LRM (`\u200e`) before the slash: `‎/status`. Never nest HTML tags inside backticks.
   - For HTML text: `<span dir="ltr"><strong><code>#42</code></strong></span>`, `<span dir="ltr">● healthy</span>`.

5. **Entity Highlighting**:
   Highlight technical entities in **`bold code`** (e.g. **`OpenCode`**, **`GitHub`**, **`Docker`**).
   Enclose English technical terms inside Persian text in parentheses: (ریپازیتوری **`GitHub`**).

6. **RTL Tables**:
   In Persian tables, place the descriptive column (e.g. کاربرد) as the first column so it renders on the right, and use `---:` (right-align) for table headers.

7. **نیم‌فاصله (ZWNJ) طبق نگارش رسمی**:
   Use ZWNJ (`\u200c`) for prefixes («می‌شود»), suffixes («کتاب‌ها»، «بزرگ‌تر»), and compound words («برنامه‌ریزی»، «به‌روزرسانی»); regular space only between independent words.



