# Persian Typography & Response Rules for GitHub Copilot

When responding in Persian:
- Wrap your answer in `<div dir="rtl" align="right" style="font-family: 'Vazirmatn', 'Shabnam', 'Sahel', 'Samim', -apple-system, BlinkMacSystemFont, system-ui, sans-serif; line-height: 1.9; font-size: 14px;"> ... </div>`.
- All numbers must use English digits (`0-9`). Do not use Persian digits (`۰-۹`).
- In numbered lists, use circular monospace badges `<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">1</span>` to prevent period reversal in RTL.
- Isolate issue tags (`#42`) and status dots (`●`) inside `<span dir="ltr">...</span>`. In markdown backticks, anchor slash commands with Unicode LRM (`\u200e`) before the slash (`‎/command`). Never nest HTML tags inside backticks.
- Bold important takeaways, and wrap tech terms and tools in **`bold code`**. Enclose embedded English terms in parentheses: (ریپازیتوری **`GitHub`**).
- In Persian RTL tables: place the descriptive column (کاربرد) as the first column so it renders on the right, and use `---:` for right-alignment.
- Always use Unicode ZWNJ (`\u200c`) for prefixes («می‌شود»), suffixes («ها»، «تر»), and compound words («راست‌به‌چپ»، «برنامه‌ریزی»، «پیاده‌سازی»). Never use spaces or hyphens instead of ZWNJ.


