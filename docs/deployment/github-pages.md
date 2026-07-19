# Deploy ด้วย GitHub Pages

## ตั้งค่าบนเครื่อง

```bash
npm install
npm run dev
npm run build
```

## GitHub Actions

Workflow นี้จะ build โฟลเดอร์ `docs` และ publish ไปยัง GitHub Pages ทุกครั้งที่ push ไป `main`

1. สร้าง repository และ push source code
2. ไปที่ **Settings → Pages** แล้วเลือก **GitHub Actions**
3. แก้ `DOCS_BASE` ใน workflow ให้เป็น `/<ชื่อ-repository>/` หากใช้ project site
4. push อีกครั้ง แล้วตรวจ URL ในหน้า Actions

ถ้าเกิด 404 ให้ตรวจ `base` และชื่อไฟล์ที่เป็น lowercase; ถ้า Mermaid ไม่แสดง ให้ตรวจว่า build สำเร็จและไม่มี script block ที่ผิด syntax
