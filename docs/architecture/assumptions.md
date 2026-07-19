# Assumptions

เอกสารนี้ใช้สมมติฐานสำหรับระบบตัวอย่างดังต่อไปนี้

- ผู้ใช้งานมี Microsoft 365 และสามารถสร้าง Power Platform environment สำหรับ Development ได้
- Supabase ใช้เป็นตัวอย่าง backend; ชื่อ project และ URL จริงจะถูกตั้งค่าผ่าน environment variables
- บทเรียนใช้ภาษาไทยและตั้งชื่อ field เป็น `snake_case` เพื่อให้ SQL, API และ Power BI ใช้ร่วมกันง่าย
- เวลาในฐานข้อมูลเก็บเป็น UTC และแสดงผลตาม timezone ของ site เมื่ออยู่บนหน้าจอ
- Asset หนึ่งรายการอาจมีหลาย Work Order และ Work Order หนึ่งรายการอาจมีหลายรูป
- สถานะที่อนุญาตต้องถูกตรวจทั้งใน client และ database/API ไม่พึ่ง validation จากหน้าจอเพียงอย่างเดียว
- รูปหน้างานเป็นข้อมูลที่อาจมีข้อมูลส่วนบุคคลและพิกัด จึงใช้ private storage และ signed URL
- Reporting จะอ่านจาก view ที่ไม่เปิดข้อมูลละเอียดเกินบทบาทของผู้ดู
