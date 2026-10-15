# BiDi (Bidirectional) Rendering Cheat Sheet for AI Agents

When generating mixed Persian (RTL) and English/Code (LTR) text, web browsers and markdown renderers rely on the **Unicode Bidirectional Algorithm (UAX #9)**.  
Certain characters are categorized as **Neutrals** or **Weak Types**, which causes them to inherit the RTL direction of preceding Persian letters. This document outlines common BiDi bugs and their one-line solutions.

---

## 1. Summary of Directional Weaknesses

| Character | Name | Problem in RTL | Solution |
| :---: | :--- | :--- | :--- |
| `#` | Hash / Number sign | Appears *after* the number (`42#`) | `<span dir="ltr">#42</span>` |
| `●` / `•` | Bullet / Indicator Dot | Jumps to the end/right of the line | `<span dir="ltr">● Status</span>` |
| `/` | Slash | Inverts path hierarchy or command syntax (`cmd/`) | `‎/cmd` (Unicode LRM) or `<span dir="ltr">/cmd</span>` |
| `-` | Hyphen / Dash | Flips range (`10-20` becomes `20-10`) | `<span dir="ltr">10-20</span>` |
| `.` | Period / Dot | Flips from left to right in ordered lists | Use Circular Badge (Option A) |
| `@` | At sign | Placed on the right of usernames/handles | `<span dir="ltr">@user</span>` |

---

## 2. Practical Examples & Templates

### Issue Numbers & Commit Hashes
```html
<!-- Bad -->
ایشو #42 حل شد.

<!-- Good -->
ایشو <span dir="ltr"><strong><code>#42</code></strong></span> حل شد.
```

### System Status Indicators
```html
<!-- Bad -->
وضعیت سرور: ● online

<!-- Good -->
وضعیت سرور: <span dir="ltr" style="color: #047857; font-weight: bold;">● online</span>
```

### File Paths & CLI Commands
```markdown
<!-- Bad (RTL flips slash to right end) -->
دستور /cairn:status اجرا شد. (نمایش بصری: cairn:status/)

<!-- Bad (Anti-pattern: HTML nested inside markdown backticks renders as raw escaped code) -->
دستور `<code dir="ltr">/cairn:status</code>` اجرا شد.

<!-- Good (Pure Markdown with Unicode LRM \u200e before slash) -->
دستور `‎/cairn:status` اجرا شد.

<!-- Good (HTML outside backticks) -->
دستور <span dir="ltr"><code>/cairn:status</code></span> اجرا شد.
```

### Version Tags
```html
<!-- Bad -->
نسخه جدید v1.4.0 منتشر شد.

<!-- Good -->
نسخه جدید <span dir="ltr"><strong><code>v1.4.0</code></strong></span> منتشر شد.
```

---

## 3. Ordered List Badge Component

Replace raw `1.`, `2.` with this drop-in HTML snippet:

```html
<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">1</span>
```

---

## 4. RTL Markdown Tables Checklist

When rendering tables in Persian RTL mode:

1. **Column Order**: The primary descriptive column (e.g. **کاربرد**, توضیحات) MUST be the **first column** in markdown, placing it on the right side in RTL.
2. **Right Alignment**: Headers must use `---:` (right-align) instead of `:---` (left-align).
3. **Slash Commands in Cells**: Inside table cells, wrap slash commands with Unicode LRM `\u200e` before the slash: `` `‎/command` ``.

```markdown
| کاربرد | دستور اسلش |
| ---: | ---: |
| بررسی وضعیت پروژه | `‎/cairn:status` |
| برنامه‌ریزی فاز جدید | `‎/cairn:plan 1` |
```

---

## 5. Standard Spaces & Font Rendering

When rendering Persian text with compound words and affixes:

1. **Use standard spaces instead of ZWNJ**:
   - Use regular space for compound terms and affixes: `برنامه ریزی`، `پیاده سازی`، `راست به چپ`، `به روز رسانی`، `می شود`، `روش ها`.
   - Avoid ZWNJ (`\u200c`) to guarantee uniform rendering across all text editors, terminals, and IDEs.
2. **Font Priority**: Always place dedicated Persian fonts (especially IRANSans) first in CSS:
   ```css
   font-family: 'Iranian Sans', 'IRANSans', 'IranSans', 'Vazirmatn', -apple-system, BlinkMacSystemFont, system-ui, sans-serif;
   ```
   This ensures that native Persian typography (like IRANSans / Iranian Sans installed on the system) takes precedence over generic system fonts.



