<p align="center">
  <h1 align="center">🇮🇷 Awesome Persian AI Rules & BiDi Standards</h1>
  <p align="center">
    <strong>قوانین استاندارد، تایپوگرافی، راست‌به‌چپ (RTL) و حل قطعی باگ‌های BiDi برای تمامی ایجنت‌های هوش مصنوعی و کدنویسی</strong>
  </p>
  <p align="center">
    <em>Curated universal Persian (Farsi) typography, RTL layout, and Bidirectional (BiDi) formatting standards for AI Coding Assistants & LLMs.</em>
  </p>
</p>

<p align="center">
  <a href="https://awesome.re"><img src="https://awesome.re/badge.svg" alt="Awesome" /></a>
  <a href="https://github.com/amir-hdri/awesome-persian-ai-rules/stargazers"><img src="https://img.shields.io/github/stars/amir-hdri/awesome-persian-ai-rules?style=for-the-badge&logo=github&color=0284c7" alt="GitHub Stars" /></a>
  <a href="https://github.com/amir-hdri/awesome-persian-ai-rules/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-047857?style=for-the-badge" alt="License" /></a>
  <a href="#-supported-ai-agents"><img src="https://img.shields.io/badge/Agents-Cursor%20%7C%20Claude%20%7C%20Antigravity%20%7C%20OpenCode%20%7C%20Windsurf%20%7C%20Copilot-b45309?style=for-the-badge" alt="Supported Agents" /></a>
  <img src="https://img.shields.io/badge/BiDi-100%25%20Verified-0284c7?style=for-the-badge" alt="BiDi Verified" />
</p>

---

## ⚡ Quick One-Line Install (نصب فوق‌سریع با یک دستور)

بدون نیاز به کلون کردن مخزن، می‌توانید این قوانین را بلافاصله در هر پروژه‌ای نصب و فعال کنید:

```bash
# نصب خودکار برای تمامی ایجنت‌های موجود در پوشه جاری:
curl -fsSL https://raw.githubusercontent.com/amir-hdri/awesome-persian-ai-rules/main/install.sh | bash

# یا پیکربندی یک ایجنت مشخص:
curl -fsSL https://raw.githubusercontent.com/amir-hdri/awesome-persian-ai-rules/main/install.sh | bash -s -- --agent cursor
curl -fsSL https://raw.githubusercontent.com/amir-hdri/awesome-persian-ai-rules/main/install.sh | bash -s -- --agent claude
curl -fsSL https://raw.githubusercontent.com/amir-hdri/awesome-persian-ai-rules/main/install.sh | bash -s -- --agent opencode
curl -fsSL https://raw.githubusercontent.com/amir-hdri/awesome-persian-ai-rules/main/install.sh | bash -s -- --agent antigravity
```

---

<div dir="rtl" align="right" style="font-family: -apple-system, BlinkMacSystemFont, 'Vazirmatn', 'Shabnam', system-ui, sans-serif; line-height: 1.9; font-size: 14px;">

## 🎯 چرا این ریپازیتوری ایجاد شد؟

پاسخ‌های فارسی در دستیارهای هوش مصنوعی (مانند **Cursor**، **Claude Code**، **OpenCode**، **Antigravity** و غیره) معمولاً با مشکلات ساختاری زیر مواجه می‌شوند:
1. **جابه‌جایی هشتگ در ایشوها**: عبارت <span dir="ltr"><code>#93</code></span> به صورت معکوس و به شکل `93#` رندر می‌شود.
2. **برعکس شدن نقطه در لیست‌ها**: در لیست‌های شماره‌دار استاندارد (`1.`، `2.`) نقطه در ابتدای خط و قبل از عدد رندر می‌شود (`.1`).
3. **پریدن دات‌ها و نمادهای وضعیت**: دات وضعیت (<span dir="ltr"><code>● all systems green</code></span>) به انتهای جمله پرت می‌شود.
4. **نامنظمی فاصله‌ها و فونت**: عدم استفاده از فونت سیستم مناسب و ارتفاع خط غیر استاندارد که خوانایی را کاهش می‌دهد.
5. **ارقام نامتجانس**: تداخل ارقام فارسی و انگلیسی در اسکریپت‌ها، توکن‌های کد و کوئری‌ها.

این پروژه یک **استاندارد مرجع و ماژولار** برای حل ریشه‌ای این معضلات به همراه فایل‌های پیکربندی آماده برای تمامی دستیارها ارائه می‌دهد.

</div>

---

## 📊 Before vs. After (مقایسه قبل و بعد)

| مورد بررسی | مارک‌داون معمولی (دارای باگ BiDi) | با استانداردهای Awesome Persian AI Rules | نتیجه نهایی |
| :--- | :--- | :--- | :--- |
| **شناسه ایشو** | `ایشو #93 بررسی شد` | `ایشو <span dir="ltr"><strong><code>#93</code></strong></span> بررسی شد` | ایشو <span dir="ltr"><strong><code>#93</code></strong></span> بررسی شد |
| **لیست شماره‌دار** | `1. ثبت بارنامه` (رندر به صورت `.1 ثبت بارنامه`) | `<span style="...">1</span> ثبت بارنامه` | <span style="display:inline-flex;align-items:center;justify-content:center;width:20px;height:20px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:11px;font-family:ui-monospace,monospace;">1</span> ثبت بارنامه |
| **نشانگر وضعیت** | `● all systems green` | `<span dir="ltr">● all systems green</span>` | <span dir="ltr" style="display:inline-flex;align-items:center;gap:4px;padding:2px 8px;border-radius:4px;background:rgba(16,185,129,0.12);color:#047857;font-weight:bold;font-size:12px;">● all systems green</span> |
| **برچسب نسخه** | `نسخه v2.8.3` (رندر معکوس `2.8.3v`) | `نسخه <span dir="ltr"><code>v2.8.3</code></span>` | نسخه <span dir="ltr"><code>v2.8.3</code></span> |
| **دستور و مسیر** | `/cairn-work` | `<span dir="ltr"><code>/cairn-work</code></span>` | <span dir="ltr"><code>/cairn-work</code></span> |

---

## 🤖 Supported AI Agents & Config Files

| ایجنت / ابزار | فایل پیکربندی در مخزن | محل قرارگیری در پروژه |
| :--- | :--- | :--- |
| **Cursor** | [`adapters/cursor/.cursorrules`](adapters/cursor/.cursorrules) & [`persian-style.mdc`](adapters/cursor/rules/persian-style.mdc) | `.cursorrules` یا `.cursor/rules/persian-style.mdc` |
| **Claude Code** | [`adapters/claude/CLAUDE.md`](adapters/claude/CLAUDE.md) | `CLAUDE.md` در ریشه پروژه یا `~/.claude/CLAUDE.md` |
| **Google Antigravity** | [`adapters/antigravity/persian-typography.md`](adapters/antigravity/persian-typography.md) | `~/.gemini/config/rules/` یا `.gemini/rules/` |
| **OpenCode & Cairn** | [`adapters/opencode/AGENTS.md`](adapters/opencode/AGENTS.md) | `AGENTS.md` در ریشه پروژه |
| **Windsurf Cascade** | [`adapters/windsurf/.windsurfrules`](adapters/windsurf/.windsurfrules) | `.windsurfrules` در ریشه پروژه |
| **GitHub Copilot** | [`adapters/copilot/copilot-instructions.md`](adapters/copilot/copilot-instructions.md) | `.github/copilot-instructions.md` |
| **ChatGPT / Web Chat** | [`adapters/prompts/system-prompt-snippet.md`](adapters/prompts/system-prompt-snippet.md) | بخش Custom Instructions یا System Prompt |

---

## 🏗 Repository Structure (ساختار مخزن)

```text
awesome-persian-ai-rules/
├── README.md                      # راهنمای جامع و معرفی پروژه
├── LICENSE                        # مجوز متن‌باز MIT
├── install.sh                     # اسکریپت نصب یک‌خطی چند ایجنتی
├── rules/
│   ├── persian-typography.md      # مشخصات فنی و استانداردهای نگارش فارسی
│   └── bidi-helpers.md            # چیت‌شیت جامع حل مشکلات کاراکترهای خنثی و BiDi
├── adapters/                      # قوانین آماده برای هر دستیار
│   ├── antigravity/               # قوانین برای Antigravity
│   ├── claude/                    # قوانین برای Claude Code
│   ├── cursor/                    # قوانین برای Cursor (legacy & MDC)
│   ├── opencode/                  # قوانین برای OpenCode و Cairn
│   ├── windsurf/                  # قوانین برای Windsurf
│   ├── copilot/                   # قوانین برای GitHub Copilot
│   └── prompts/                   # اسنیپت برای چت‌بات‌های وب
└── examples/
    └── badge-showcase.html        # پیش‌نمایش گرافیکی بج‌ها و کارت‌ها
```

---

## 💻 Manual Installation (نصب دستی)

<div dir="rtl" align="right" style="font-family: -apple-system, BlinkMacSystemFont, 'Vazirmatn', 'Shabnam', system-ui, sans-serif; line-height: 1.9; font-size: 14px;">

اگر ترجیح می‌دهید به صورت دستی فایل‌ها را اضافه کنید:

<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">1</span> **برای Cursor**:  
فایل `adapters/cursor/rules/persian-style.mdc` را در پوشه `.cursor/rules/` پروژه‌تان کپی کنید.

<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">2</span> **برای Claude Code**:  
محتوای `adapters/claude/CLAUDE.md` را در فایل `CLAUDE.md` ریشه پروژه‌تان اضافه کنید.

<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">3</span> **برای OpenCode و Cairn**:  
محتوای `adapters/opencode/AGENTS.md` را به انتهای `AGENTS.md` اضافه کنید.

<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">4</span> **برای Google Antigravity**:  
فایل `adapters/antigravity/persian-typography.md` را در مسیر `~/.gemini/config/rules/` قرار دهید تا به طور خودکار در تمامی پروژه‌ها اجرا شود.

</div>

---

## 🌟 Support & Starring (حمایت از پروژه)

اگر این پروژه توانسته است مشکلات نگارشی و به‌هم‌ریختگی متون راست‌به‌چپ در ایجنت‌های هوش مصنوعی شما را حل کند، لطفاً با **ثبت ستاره (Star ⭐️)** از این پروژه حمایت کنید تا توسعه‌دهندگان بیشتری بتوانند از آن بهره‌مند شوند!

[![Star History Chart](https://api.star-history.com/svg?repos=amir-hdri/awesome-persian-ai-rules&type=Date)](https://star-history.com/#amir-hdri/awesome-persian-ai-rules&Date)

---

## 🏷️ Keywords & Topics (کلمات کلیدی و هشتگ‌ها)

`#awesome` `#awesome-list` `#persian` `#farsi` `#rtl` `#bidi` `#ai-agents` `#cursor-rules` `#claude-code` `#opencode` `#windsurf` `#antigravity` `#github-copilot` `#llm` `#prompt-engineering` `#developer-tools` `#typography` `#bidirectional-text`

---

## 📄 License
This project is open-source under the [MIT License](LICENSE).  
Created with ❤️ for the Persian developer community.
