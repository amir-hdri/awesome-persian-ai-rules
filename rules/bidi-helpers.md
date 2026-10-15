# BiDi (Bidirectional) Rendering Cheat Sheet for AI Agents

When generating mixed Persian (RTL) and English/Code (LTR) text, web browsers and markdown renderers rely on the **Unicode Bidirectional Algorithm (UAX #9)**.  
Certain characters are categorized as **Neutrals** or **Weak Types**, which causes them to inherit the RTL direction of preceding Persian letters. This document outlines common BiDi bugs and their one-line solutions.

---

## 1. Summary of Directional Weaknesses

| Character | Name | Problem in RTL | Solution |
| :---: | :--- | :--- | :--- |
| `#` | Hash / Number sign | Appears *after* the number (`93#`) | `<span dir="ltr">#93</span>` |
| `●` / `•` | Bullet / Indicator Dot | Jumps to the end/right of the line | `<span dir="ltr">● Status</span>` |
| `/` | Slash | Inverts path hierarchy or command syntax | `<span dir="ltr">/cmd</span>` |
| `-` | Hyphen / Dash | Flips range (`10-20` becomes `20-10`) | `<span dir="ltr">10-20</span>` |
| `.` | Period / Dot | Flips from left to right in ordered lists | Use Circular Badge (Option A) |
| `@` | At sign | Placed on the right of usernames/handles | `<span dir="ltr">@user</span>` |

---

## 2. Practical Examples & Templates

### Issue Numbers & Commit Hashes
```html
<!-- Bad -->
ایشو #93 بررسی شد.

<!-- Good -->
ایشو <span dir="ltr"><strong><code>#93</code></strong></span> بررسی شد.
```

### System Status Indicators
```html
<!-- Bad -->
وضعیت سرور: ● online

<!-- Good -->
وضعیت سرور: <span dir="ltr" style="color: #047857; font-weight: bold;">● online</span>
```

### File Paths & CLI Commands
```html
<!-- Bad -->
فایل config/settings.json ویرایش شد و دستور git checkout -b feature اجرا شد.

<!-- Good -->
فایل <span dir="ltr"><code>config/settings.json</code></span> ویرایش شد و دستور <span dir="ltr"><code>git checkout -b feature</code></span> اجرا شد.
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
