# วิธีแก้ไขบทเรียนและทำ Batch โดยไม่กระทบหน้าอื่น

แนวทางนี้ทำให้แก้เฉพาะสัปดาห์ที่กำหนด ตรวจสอบ แล้วค่อย commit เป็นชุดเล็ก ๆ

## โครงสร้างของหนึ่งสัปดาห์

ตัวอย่าง Week 06:

```text
docs/week-06/
├── index.md             # บทเรียนหลัก
├── lab.md               # Lab / Mini Project
├── assessment.md        # Quiz และ Checklist
└── troubleshooting.md   # ปัญหาที่พบบ่อย
```

## ตัวอย่างที่ 1: แก้บทเรียนหลัก

ถ้าต้องการเพิ่มคำอธิบายเรื่องการตั้งค่า Storage ให้แก้เฉพาะไฟล์ `index.md` ของสัปดาห์นั้น:

```powershell
notepad docs/week-06/index.md
```

ตัวอย่างเนื้อหา Markdown ที่เพิ่มได้:

```markdown
## ตรวจสอบสิทธิ์ก่อนอัปโหลดรูป

ผู้ใช้ต้องมีสิทธิ์เขียนเฉพาะ bucket ที่กำหนด และต้องบันทึก `ticket_id` ใน metadata

> ห้ามใส่ Supabase service role key ใน Power Apps หรือโค้ดฝั่งผู้ใช้
```

บันทึกไฟล์แล้วเปิดเว็บ local เพื่อดูผลทันที:

```text
http://127.0.0.1:5173/week-06/
```

## ตัวอย่างที่ 2: แก้ Lab และเพิ่มตัวอย่างคำสั่ง

ถ้าต้องการเพิ่มขั้นตอนทดลอง ให้แก้ `lab.md` เท่านั้น:

```powershell
notepad docs/week-06/lab.md
```

ตัวอย่าง code block ใน Lab:

````markdown
### ตรวจสอบไฟล์ภาพล่าสุด

```sql
select ticket_id, file_path, created_at
from repair_photos
order by created_at desc;
```
````

## ตัวอย่างที่ 3: แก้ Quiz หรือ Checklist

ถ้าต้องการเพิ่มคำถาม ให้แก้ `assessment.md`:

```markdown
## คำถามเพิ่มเติม

1. เพราะเหตุใดจึงไม่ควรเปิด bucket รูปซ่อมเป็น public?
2. Metadata อย่างน้อยสองรายการที่ควรบันทึกคืออะไร?

เกณฑ์ผ่าน: ตอบถูกอย่างน้อย 70%
```

## ตัวอย่างที่ 4: เพิ่มวิธีแก้ปัญหา

ถ้าพบปัญหาใหม่ ให้เพิ่มใน `troubleshooting.md` ของ Week เดียวกัน:

```markdown
## รูปภาพแสดงเป็น 403 Forbidden

สาเหตุที่พบบ่อย:

- Policy ไม่อนุญาตให้ผู้ใช้ role นั้นอ่านไฟล์
- ใช้ path ของ bucket ไม่ตรงกับ metadata

แนวทางตรวจสอบ: ตรวจ RLS policy, bucket name และ `ticket_id` ก่อนสร้าง signed URL ใหม่
```

## ขั้นตอนทำ Batch

1. ระบุขอบเขต เช่น `Batch: Week 06 เท่านั้น`
2. แก้เฉพาะไฟล์ใน `docs/week-06/`
3. ถ้าต้องเพิ่ม asset ให้เพิ่มเฉพาะโฟลเดอร์ที่เกี่ยวข้อง เช่น `database/` หรือ `api/`
4. หลีกเลี่ยงการแก้ `docs/.vitepress/config.mts` เว้นแต่เพิ่มเมนูหรือลิงก์ใหม่
5. เปิดเว็บด้วย `open-cmms-docs.cmd`
6. ตรวจลิงก์ของสัปดาห์นั้นและกด `Ctrl + F5`
7. Build ก่อน commit

```powershell
npm.cmd run build
```

## ตัวอย่างการแก้เฉพาะ Week 06

```powershell
git status --short
git add docs/week-06
git commit -m "Update Week 06 storage lesson"
git push
```

คำสั่ง `git add docs/week-06` จะจัดเก็บเฉพาะไฟล์ของ Week 06 ไม่รวมบทเรียนสัปดาห์อื่น

## ตัวอย่าง Batch แบบครบขั้นตอน

สมมติว่าต้องปรับ Week 06 ทั้งชุด แต่ไม่แก้ Week อื่น:

```powershell
# 1) ตรวจสถานะก่อนเริ่ม
git status --short

# 2) แก้ไฟล์ 4 ไฟล์ใน docs/week-06/ แล้วเปิดเว็บตรวจ
open-cmms-docs.cmd

# 3) ตรวจเฉพาะไฟล์ที่แก้
git diff --name-only -- docs/week-06

# 4) ตรวจ build
npm.cmd run build

# 5) commit และ push เฉพาะ Week 06
git add docs/week-06
git commit -m "Complete Week 06 storage batch"
git push
```

ถ้าแก้แค่บทเรียนหลัก ให้ใช้คำสั่งที่แคบลงได้:

```powershell
git add docs/week-06/index.md
git commit -m "Clarify Week 06 storage lesson"
git push
```

## ถ้าต้องสร้าง Batch ใหม่

ใช้แบบฟอร์มนี้ใน commit หรือไฟล์บันทึกงาน:

```markdown
# Batch: Week XX

## Scope
- [ ] index.md
- [ ] lab.md
- [ ] assessment.md
- [ ] troubleshooting.md

## Quality check
- [ ] ลิงก์ไปหน้าหลักใช้งานได้
- [ ] ลิงก์ Lab / Assessment / Troubleshooting ใช้งานได้
- [ ] code block มีภาษาและตัวอย่างครบ
- [ ] `npm.cmd run build` ผ่าน
- [ ] ไม่แก้ไฟล์นอกขอบเขตโดยไม่ตั้งใจ
```

## ตรวจว่าไม่ได้แก้หน้าอื่น

```powershell
git diff --name-only
```

ผลลัพธ์ควรมีเฉพาะไฟล์ที่อยู่ในขอบเขต Batch เช่น `docs/week-06/` หากมีไฟล์อื่นโผล่มา ให้ตรวจสอบก่อน commit

## หลักการสำคัญ

- แก้ทีละสัปดาห์ ไม่แก้ทั้งหลักสูตรใน commit เดียว
- ใช้ลิงก์แบบ `/week-06/` ภายในเว็บ เพื่อให้ทำงานได้ทั้ง local และ production
- อย่าลบไฟล์ของสัปดาห์อื่นเพื่อแก้ปัญหาหนึ่งสัปดาห์
- ถ้าเพิ่มหน้าใหม่ ให้เพิ่มลิงก์ใน `docs/.vitepress/config.mts` และทดสอบ build ใน batch เดียวกัน
