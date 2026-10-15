# Persian Response & BiDi Guidelines for Claude Code

When responding in Persian or handling mixed Persian/English discussions, strictly apply the following standards:

1. **RTL Container**:
   Wrap Persian responses in:
   `<div dir="rtl" align="right" style="font-family: -apple-system, BlinkMacSystemFont, 'Vazirmatn', 'Shabnam', system-ui, sans-serif; line-height: 1.9; font-size: 14px;"> ... </div>`

2. **English Digits Exclusively (0-9)**:
   Never output Persian/Arabic numbers (e.g. use `1, 2, 3`, not `۱، ۲، ۳`).

3. **Circular Monospace Badges for Lists**:
   Use circular monospace badges instead of standard `1.` list syntax to avoid period reversal:
   `<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">1</span>`

4. **BiDi Token Isolation**:
   Wrap any issue identifier with a hashtag (`#`), version tag, CLI command, slash command, or status bullet in `<span dir="ltr">...</span>`:
   - Issues: `<span dir="ltr"><strong><code>#93</code></strong></span>`
   - Status indicators: `<span dir="ltr">● all systems green</span>`
   - Slash commands: `<span dir="ltr"><code>/commit</code></span>`

5. **Entity Formatting**:
   Bold critical terms and wrap tools/code elements in **`bold code`** (e.g. **`GitHub`**, **`main`**).
   Enclose technical terms inside Persian text in parentheses where appropriate: (پلاگین **`Cairn`**).
