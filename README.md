# 🇮🇷 Persian Agent Rules & BiDi Standards
> Universal typography, bidirectional formatting, and response standards for all AI coding agents (Antigravity, Cursor, Claude Code, OpenCode, Windsurf, Copilot).

<p align="center">
  <img src="https://img.shields.io/badge/Direction-RTL%20%2B%20BiDi%20Safe-blue?style=flat-square" alt="RTL" />
  <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License" />
  <img src="https://img.shields.io/badge/Supported%20Agents-Antigravity%20|%20Cursor%20|%20Claude%20|%20OpenCode%20|%20Windsurf-orange?style=flat-square" alt="Agents" />
</p>

---

<div dir="rtl" align="right" style="font-family: -apple-system, BlinkMacSystemFont, 'Vazirmatn', 'Shabnam', system-ui, sans-serif; line-height: 1.9; font-size: 14px;">

این ریپازیتوری شامل **مجموعه استانداردهای قطعی نگارش، فرمت‌بندی، رفع مشکلات BiDi و تایپوگرافی فارسی** برای استفاده در تمامی ایجنت‌های هوش مصنوعی و دستیارهای کدنویسی است. هدف این پروژه جلوگیری دائمی از به‌هم‌ریختگی متون راست‌به‌چپ، جابه‌جایی نشانه‌هایی مانند هشتگ (<span dir="ltr"><code>#</code></span>)، اسلش (<span dir="ltr"><code>/</code></span>)، نقطه در لیست‌های عددی و کدهای ترکیبی است.

### 🌟 ویژگی‌های کلیدی
- **کپسول‌بندی استاندارد RTL**: هدایت کامل خروجی در قالب تگ والد با فونت‌های مدرن سیستم (`Vazirmatn` و `Shabnam`) و ارتفاع خط استاندارد (`1.9`).
- **ارقام انگلیسی یکدست (0-9)**: جلوگیری از تولید ارقام فارسی برای حفظ یکپارچگی کدها، شناسه‌ها و مقادیر فنی.
- **بج‌های دایره‌ای مونو برای لیست‌ها**: جایگزینی کامل فرمت سنتی `1.` با بج‌های مدرن دایره‌ای مونو جهت جلوگیری قطعی از جابه‌جایی نقطه در BiDi.
- **ایزوله‌سازی نمادها و هشتگ‌ها**: حل مشکل جابه‌جا شدن هشتگ در ایشوها (مانند <span dir="ltr"><strong><code>#93</code></strong></span>)، وضعیت‌ها (مانند <span dir="ltr">● active</span>) و مسیرها.
- **آداپتورهای اختصاصی برای هر ایجنت**: تنظیمات آماده برای **`Cursor`**، **`Claude Code`**، **`OpenCode`**، **`Antigravity`**، **`Windsurf`** و **`GitHub Copilot`**.

</div>

---

## 📁 Repository Structure

```text
persian-agent-rules/
├── README.md                      # Complete documentation & usage guide
├── LICENSE                        # MIT License
├── install.sh                     # Automatic multi-agent setup script
├── rules/
│   ├── persian-typography.md      # Core typography & formatting specification
│   └── bidi-helpers.md            # Cheat sheet for BiDi edge cases & solutions
├── adapters/                      # Ready-to-use rule files for each agent
│   ├── antigravity/               # Antigravity (~/.gemini/config/rules/ or .gemini/rules/)
│   ├── claude/                    # Claude Code (CLAUDE.md)
│   ├── cursor/                    # Cursor (.cursorrules & .cursor/rules/*.mdc)
│   ├── opencode/                  # OpenCode & Cairn (AGENTS.md)
│   ├── windsurf/                  # Windsurf Cascade (.windsurfrules)
│   ├── copilot/                   # GitHub Copilot (.github/copilot-instructions.md)
│   └── prompts/                   # Web Chatbots / Custom Instructions
└── examples/
    └── badge-showcase.html        # Visual HTML preview of cards & list badges
```

---

## 🚀 Quick Start & Installation

You can automatically configure your current workspace for any agent using the included installer:

```bash
# Clone the repository
git clone https://github.com/amir-hdri/persian-agent-rules.git
cd persian-agent-rules

# Configure all supported agents in your target project:
./install.sh --target /path/to/your/project --agent all

# Or configure a specific agent:
./install.sh --target /path/to/your/project --agent cursor
./install.sh --target /path/to/your/project --agent claude
./install.sh --target /path/to/your/project --agent opencode
./install.sh --target /path/to/your/project --agent antigravity
```

---

## 📐 Rule Matrix & Comparisons

| Problem (Standard Markdown) | Visual Defect | Solution in Persian Agent Rules | Clean Result |
| :--- | :--- | :--- | :--- |
| `ایشو #93` | `ایشو 93#` (Hashtag flipped) | `ایشو <span dir="ltr"><strong><code>#93</code></strong></span>` | ایشو <span dir="ltr"><strong><code>#93</code></strong></span> |
| `1. مرحله اول` | `.1 مرحله اول` (Period flipped) | `<span style="...">1</span> مرحله اول` | <span style="display:inline-flex;align-items:center;justify-content:center;width:20px;height:20px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:11px;font-family:ui-monospace,monospace;">1</span> مرحله اول |
| `● all systems green` | `all systems green ●` (Bullet flipped) | `<span dir="ltr">● all systems green</span>` | <span dir="ltr" style="color:#047857;font-weight:bold;">● all systems green</span> |
| `نسخه v2.8` | `نسخه 2.8v` (Version scrambled) | `نسخه <span dir="ltr"><code>v2.8</code></span>` | نسخه <span dir="ltr"><code>v2.8</code></span> |

---

## 🛠 Manual Configuration per Agent

<div dir="rtl" align="right" style="font-family: -apple-system, BlinkMacSystemFont, 'Vazirmatn', 'Shabnam', system-ui, sans-serif; line-height: 1.9; font-size: 14px;">

### ۱. **`Cursor`**
فایل <span dir="ltr"><code>adapters/cursor/.cursorrules</code></span> را در ریشه پروژه قرار دهید یا فایل <span dir="ltr"><code>adapters/cursor/rules/persian-style.mdc</code></span> را در پوشه <span dir="ltr"><code>.cursor/rules/</code></span> کپی کنید.

### ۲. **`Claude Code`**
محتوای <span dir="ltr"><code>adapters/claude/CLAUDE.md</code></span> را در فایل <span dir="ltr"><code>CLAUDE.md</code></span> در ریشه مخزن یا در <span dir="ltr"><code>~/.claude/CLAUDE.md</code></span> قرار دهید.

### ۳. **`OpenCode`** و **`Cairn`**
محتوای <span dir="ltr"><code>adapters/opencode/AGENTS.md</code></span> را در فایل <span dir="ltr"><code>AGENTS.md</code></span> پروژه قرار دهید.

### ۴. **`Google Antigravity`**
فایل <span dir="ltr"><code>adapters/antigravity/persian-typography.md</code></span> را در مسیر <span dir="ltr"><code>~/.gemini/config/rules/persian-typography.md</code></span> (برای تمام پروژه‌ها به صورت سراسری) یا در <span dir="ltr"><code>.gemini/rules/</code></span> داخل پروژه قرار دهید.

### ۵. چت‌بات‌های تحت وب (مانند **`ChatGPT`** و **`Claude.ai`**)
متن آماده داخل <span dir="ltr"><code>adapters/prompts/system-prompt-snippet.md</code></span> را کپی کرده و در بخش **`Custom Instructions`** یا سیستم پرامپت چت‌بات خود قرار دهید.

</div>

---

## 📄 License
This project is licensed under the [MIT License](LICENSE).
