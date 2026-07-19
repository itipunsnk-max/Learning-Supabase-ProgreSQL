# CMMS Learning Roadmap

คู่มือภาษาไทยสำหรับพัฒนาระบบ Computerized Maintenance Management System (CMMS) ด้วย Power Platform, PostgreSQL, Supabase และ Power BI ตั้งแต่ prototype จนถึง production-ready final project

โครงสร้างและ Definition of Done ของโครงการนี้ยึดตาม [Master README ต้นฉบับ](https://github.com/itipunsnk-max/Learning-Supabase-ProgreSQL/blob/main/README.md) และพัฒนาเป็นรอบ (Batch) เพื่อให้แต่ละสัปดาห์มีเนื้อหา โค้ด Lab แบบทดสอบ และผลการตรวจสอบครบก่อนเริ่มสัปดาห์ถัดไป

## Project Overview

โครงการนี้สอนการสร้างระบบแจ้งซ่อมและบริหาร Work Order ที่รองรับ Asset Management, รูป Before/During/After Repair, Mobile workflow, RLS, REST API และ Dashboard

## Target Learner

เหมาะสำหรับวิศวกรหรือผู้ดูแลงานซ่อมบำรุงที่ใช้ Excel, Power BI, Microsoft 365 และ Power Apps เบื้องต้น แต่ต้องการเข้าใจ database, backend และ API แบบ step-by-step

## Learning Outcomes

- วิเคราะห์ workflow และออกแบบข้อมูล CMMS
- สร้าง Power Apps prototype และ Power Automate workflow
- ออกแบบ PostgreSQL schema, API และ RLS
- เชื่อม Supabase Storage, Power Apps และ Power BI อย่างปลอดภัย
- ทดสอบและ deploy เอกสารและระบบตาม checklist

## Curriculum Overview

หลักสูตรมี 8 Phase ใน 12 สัปดาห์ ดูตารางเต็มที่ [Curriculum](/curriculum)

## Batch Delivery Plan

การสร้างเนื้อหาจะทำตามลำดับต่อไปนี้:

1. Batch 0 — Repository, Documentation Framework, Architecture และสารบัญ
2. Batch 1 — Week 1: CMMS, SharePoint, Power Apps และ Power Automate
3. Batch 2 — Week 2: Workflow, Approval และ Notification
4. Batch 3 เป็นต้นไป — สร้างทีละสัปดาห์ พร้อม build และ quality check ก่อนเดินหน้าต่อ

แต่ละ Batch ต้องรายงานไฟล์ที่สร้าง/แก้ไข, คำสั่งที่ใช้, ผลการตรวจสอบ และงานถัดไป เพื่อป้องกันไฟล์ขาดหรือสารบัญไม่ต่อเนื่อง

## Technology Stack

VitePress, Markdown, Mermaid, Power Apps Canvas, Power Automate, SharePoint, PostgreSQL, Supabase Auth/Storage, REST/JSON, Postman และ Power BI

## Getting Started

### Prerequisites

ติดตั้ง Node.js 20+, npm และ Git; สำหรับ Lab ฝั่ง Power Platform ต้องมี Microsoft 365/Power Platform environment ส่วน Lab backend ใช้ Supabase project แยกสำหรับ Development

### Installation และ Running Locally

```bash
npm install
npm run dev
```

เปิด URL ที่ VitePress แสดงใน terminal จากนั้นสร้าง production files ด้วย `npm run build` และตรวจด้วย `npm run preview`

## Deploying

มี workflow สำหรับ GitHub Pages ที่ `.github/workflows/deploy-pages.yml` และคู่มือสำหรับ [GitHub Pages](/deployment/github-pages), [Netlify/Vercel](/deployment/hosting-options)

## Offline Reading

รัน `npm run build` แล้วเปิดไฟล์ใน `docs/.vitepress/dist` ผ่าน `scripts/serve-offline.ps1` หรือเก็บทั้ง repository ไว้อ่าน Markdown แบบ offline ไม่ควรเปิด HTML ด้วย `file://` เพราะ browser อาจบล็อก module และ asset บางชนิด

## Final Project

ผู้เรียนจะส่ง CMMS ที่มี Repair Request, Work Order Tracking, Asset Management, Repair Photos, Search, Dashboard, API, RLS, test evidence และ deployment/user manuals

## Repository Structure

```text
docs/                 เว็บไซต์และบทเรียน
docs/.vitepress/      VitePress configuration
database/             SQL migration, seed, views และ policies (ระยะถัดไป)
api/                  API examples และ collection (ระยะถัดไป)
power-apps/           Power Fx และ connector assets (ระยะถัดไป)
power-automate/       Flow designs (ระยะถัดไป)
power-bi/             Star schema, DAX และ Power Query (ระยะถัดไป)
diagrams/             Mermaid และ export diagrams (ระยะถัดไป)
scripts/              คำสั่งช่วย build/offline
```

## Contribution

อ่าน [CONTRIBUTING.md](CONTRIBUTING.md) ก่อนส่ง Pull Request และรัน `npm run build` ทุกครั้ง

## License

เผยแพร่ภายใต้ MIT License ดู [LICENSE](LICENSE)

## Disclaimer

ตัวอย่างเป็น reference สำหรับการเรียนรู้ ต้องปรับ security, PDPA, SLA, backup และการอนุมัติให้สอดคล้องกับนโยบายองค์กรก่อนใช้กับข้อมูลจริง
