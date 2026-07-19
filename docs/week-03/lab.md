# Week 3 Lab — สร้าง CMMS Relational Schema

## เป้าหมาย

ออกแบบและสร้าง schema สำหรับ Site, Asset, Ticket และ Work Order พร้อม constraints, relationship, seed data และ query ตรวจสอบประวัติ

## สิ่งที่ต้องเตรียม

- PostgreSQL Development หรือ Supabase project ที่ไม่ใช่ Production
- SQL Editor หรือ `psql`
- ไฟล์ `database/migrations/001_cmms_core.sql`
- ER Diagram ที่วาดจาก requirement

## ขั้นตอน

1. วาด entity และ relationship ก่อนเขียน SQL
2. สร้าง Site และ Asset table
3. สร้าง Ticket และ Work Order table
4. เพิ่ม PK, FK, UNIQUE, NOT NULL, CHECK และ DEFAULT
5. เพิ่ม index สำหรับ `site_id`, `status` และ `reported_at`
6. รัน seed data ที่เป็นข้อมูลจำลอง
7. เขียน JOIN แสดง Ticket พร้อม Site/Asset
8. ทดสอบ invalid insert และ transaction rollback
9. บันทึกผลลัพธ์ลง Data Dictionary

## SQL Test ตัวอย่าง

```sql
-- ต้อง fail เพราะ priority ไม่อยู่ในชุดค่าที่อนุญาต
insert into tickets (id, ticket_number, site_id, description, priority)
values (gen_random_uuid(), 'T-INVALID-0001', :site_id, 'Test invalid priority', 'extreme');
```

## Expected Result

Schema สร้างได้, valid seed ผ่าน, invalid priority ถูกปฏิเสธ, Ticket ที่อ้าง Site ไม่มีอยู่ถูกปฏิเสธ และ query ประวัติคืนข้อมูลที่ join ได้ถูกต้อง

## วิธีตรวจสอบผล

ตรวจ `information_schema.columns`, `pg_constraint`, `pg_indexes` และผล query รวมถึงเก็บ error message ของ invalid cases เป็น evidence

## ปัญหาที่อาจพบและวิธีแก้

- **ตารางสร้างไม่ได้:** ตรวจลำดับ migration และ extension
- **FK insert ไม่ผ่าน:** สร้าง parent row ก่อน child
- **ชนิดข้อมูลไม่ตรง:** ใช้ UUID/date/numeric ให้ตรงกับ payload
- **query ช้า:** ใช้ `EXPLAIN (ANALYZE, BUFFERS)` และปรับ index
- **ข้อมูลซ้ำจาก retry:** เพิ่ม unique business key และตรวจ request ID

## Challenge เพิ่มเติม

เพิ่ม `vendors`, `work_order_vendors` และ `repair_costs` เพื่อรองรับผู้รับเหมาและค่าใช้จ่ายแบบ many-to-many พร้อมกำหนด cascade behavior อย่างปลอดภัย

## Lab Checklist

- [ ] ERD มี cardinality
- [ ] Migration รันได้ใน Development
- [ ] Seed data รันได้
- [ ] Constraints ถูกทดสอบ
- [ ] JOIN query ผ่าน
- [ ] Duplicate test ผ่าน
- [ ] Rollback test ผ่าน
- [ ] Data Dictionary ครบ
