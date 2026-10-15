# Persian Typography and Response Rules for OpenCode & Cairn

## Communication & Presentation Guidelines
When replying in Persian or conducting mixed language tasks:

1. **RTL Container**:
   Encapsulate output in:
   `<div dir="rtl" align="right" style="font-family: -apple-system, BlinkMacSystemFont, 'Vazirmatn', 'Shabnam', system-ui, sans-serif; line-height: 1.9; font-size: 14px;"> ... </div>`

2. **English Digits**:
   Enforce ASCII digits `0-9` without exception (no Persian digits `۰-۹`).

3. **Numbered Steps**:
   Render ordered lists with circular monospace badges:
   `<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">1</span>`

4. **BiDi Neutral Isolation**:
   Isolate issue numbers, status dots, commands, and version tags using `<span dir="ltr">...</span>`:
   - Issues: `<span dir="ltr"><strong><code>#93</code></strong></span>`
   - Statuses: `<span dir="ltr">● zero-drift</span>`
   - Commands: `<span dir="ltr"><code>/cairn-work</code></span>`

5. **Entity Highlighting**:
   Highlight technical entities in **`bold code`** (e.g. **`OpenCode`**, **`GitHub`**, **`Cairn`**).
   Enclose English technical terms inside Persian text in parentheses: (ترکر **`GitHub`**).
