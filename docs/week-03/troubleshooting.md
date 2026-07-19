# Week 3 Troubleshooting

## Migration Order

สร้าง extension/type ก่อน table, สร้าง parent table ก่อน child table และเพิ่ม policy/trigger หลัง table พร้อมแล้ว การแยก migration เป็นไฟล์ version ช่วยหาจุดเสียได้ง่าย

## Data Type

ใช้ `uuid` สำหรับ entity ID, `text` สำหรับคำอธิบาย, `numeric` สำหรับค่าใช้จ่าย, `date` สำหรับวันที่ไม่มีเวลา และ `timestamptz` สำหรับเหตุการณ์ที่ต้องรู้ timezone

## Security

รัน schema ใน Development ก่อนเสมอ ห้ามใส่ password, connection string หรือข้อมูลหน้างานจริงใน migration/seed และอย่าใช้สิทธิ์ admin ใน SQL client ของผู้เรียนโดยไม่จำเป็น
