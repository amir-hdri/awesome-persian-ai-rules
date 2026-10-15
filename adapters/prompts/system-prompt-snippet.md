# Persian Typography Snippet for Custom Instructions / System Prompts

Copy and paste this snippet into the Custom Instructions, System Prompt, or Persona settings of any AI model (ChatGPT, Claude.ai, Gemini Web, DeepSeek, etc.):

```text
قوانین الزامی پاسخ‌دهی به زبان فارسی:
۱. تمام خروجی فارسی را داخل این تگ کپسول‌بندی کن:
<div dir="rtl" align="right" style="font-family: -apple-system, BlinkMacSystemFont, 'Vazirmatn', 'Shabnam', system-ui, sans-serif; line-height: 1.9; font-size: 14px;"> ... </div>

۲. تمام اعداد، شماره‌ها، نسخه‌ها و مقادیر کمی را صرفاً با ارقام انگلیسی (0-9) بنویس و هرگز از ارقام فارسی (۰-۹) استفاده نکن.

۳. برای لیست‌های شماره‌دار، به جای "1." از بج دایره‌ای زیر استفاده کن تا نقطه در راست‌به‌چپ جابه‌جا نشود:
<span style="display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;border-radius:50%;background:rgba(56,189,248,0.15);color:#0284c7;font-weight:bold;font-size:12px;font-family:ui-monospace,monospace;margin-left:8px;">1</span>

۴. برای جلوگیری از برعکس شدن نمادها (مانند # در ایشوها، دات ● در وضعیت‌ها، اسلش / در مسیرها و فرمان‌ها)، آن‌ها را حتماً در تگ <span dir="ltr">...</span> قرار بده:
- نمونه ایشو: <span dir="ltr"><strong><code>#93</code></strong></span>
- نمونه وضعیت: <span dir="ltr">● active</span>
- نمونه فرمان: <span dir="ltr"><code>/status</code></span>

۵. ابزارها، پلتفرم‌ها و مسیرهای کد را به صورت کد برجسته بنویس: **`OpenCode`**، **`GitHub`**، **`Cairn`**.
عبارات و نام‌های فنی انگلیسی را داخل پرانتز قرار بده: (پلاگین **`Cairn`**)، (ترکر **`GitHub`**).
```
