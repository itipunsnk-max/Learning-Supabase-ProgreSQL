# นำเอกสารขึ้น GitHub และ Deploy ไป Netlify หรือ Vercel

เอกสารนี้ใช้กับโปรเจกต์ VitePress ในโฟลเดอร์ `12.Learning-Supabase-ProgreSQL`

## 1. เตรียมเครื่อง

ติดตั้ง Node.js LTS และ Git จากนั้นเปิด PowerShell ในโฟลเดอร์โปรเจกต์

```powershell
npm.cmd install
npm.cmd run build
```

ถ้า build สำเร็จ เว็บที่สร้างไว้จะอยู่ที่ `docs/.vitepress/dist`

## 2. สร้าง repository บน GitHub

สร้าง repository ใหม่บน GitHub เช่น `cmms-learning-roadmap (ตัวอย่าง)` แล้วรันคำสั่งต่อไปนี้:

```powershell
git init
git add .
git commit -m "Initial CMMS learning roadmap"
git branch -M main
git remote add origin https://github.com/<username>/cmms-learning-roadmap.git
git push -u origin main
```

ครั้งถัดไปที่แก้เอกสาร:

```powershell
git add docs package.json package-lock.json
git commit -m "Update learning docs"
git push
```

> อย่า commit `.env` หรือ Supabase service role key ให้ใช้ `.env.example` เป็นแม่แบบเท่านั้น

## 3. Deploy ด้วย Netlify

1. เข้า Netlify แล้วเลือก **Add new site → Import an existing project**
2. เลือก GitHub repository
3. ตั้งค่า Build command เป็น `npm run build`
4. ตั้งค่า Publish directory เป็น `docs/.vitepress/dist`
5. กด Deploy

ถ้าใช้โดเมนหลัก ให้ตั้ง environment variable:

```text
DOCS_BASE=/
```

ทุกครั้งที่ push ไป branch ที่เชื่อมไว้ Netlify จะ build และ deploy ใหม่อัตโนมัติ

## 4. Deploy ด้วย Vercel

1. เข้า Vercel แล้วเลือก **Add New → Project**
2. Import GitHub repository
3. เลือก Framework Preset เป็น `Other`
4. Build command: `npm run build`
5. Output directory: `docs/.vitepress/dist`
6. กด Deploy

ตั้งค่า `DOCS_BASE=/` ใน Environment Variables หากเว็บอยู่ที่ root domain

## 5. ตรวจสอบหลัง deploy

- เปิด URL production และกดเข้า Week 1, Week 6 และ Week 12
- ตรวจ Lab, Assessment และ Troubleshooting ของแต่ละสัปดาห์
- ตรวจ search และลิงก์กลับหน้าหลัก
- ถ้าเว็บยังเป็นข้อมูลเก่า ให้กด redeploy/clear cache แล้ว refresh ด้วย `Ctrl + F5`
