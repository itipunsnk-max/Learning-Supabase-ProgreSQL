# Week 4 Lab — CMMS Reporting Layer

## เป้าหมาย

สร้าง SQL reporting layer ที่คืน backlog, aging, SLA และประวัติ Asset ได้เร็วพอสำหรับการใช้งานจริงใน Development

## สิ่งที่ต้องเตรียม

- PostgreSQL schema จาก Week 3
- Seed data อย่างน้อย 30 Ticket หลาย Site/Status/Priority
- SQL Editor และสิทธิ์สร้าง view/index ใน Development
- Definition ของ Backlog และ SLA จากผู้ดูแลงาน

## ขั้นตอน

1. สร้าง baseline query สำหรับ Ticket History
2. เขียน query backlog ตาม Site
3. เขียน CTE สำหรับ aging buckets
4. สร้าง `v_work_order_reporting`
5. รัน `EXPLAIN (ANALYZE, BUFFERS)` ก่อนเพิ่ม index
6. เพิ่ม partial/composite index ตาม filter จริง
7. ทดสอบ keyset pagination
8. เปรียบเทียบ row count และ KPI กับ source table
9. บันทึก query plan และเหตุผลเชิง performance

## SQL ตัวอย่าง

```sql
-- ตรวจว่า reporting view ไม่รวม soft-deleted Ticket
select count(*) as view_rows
from public.v_work_order_reporting;

select count(*) as source_rows
from public.tickets
where deleted_at is null;
```

## Expected Result

View คืนข้อมูลตาม grain ที่กำหนด, backlog แยกตาม Site ได้, aging buckets ไม่ overlap และ query plan แสดงการใช้ index เมื่อข้อมูลมีขนาดเหมาะสม

## วิธีตรวจสอบผล

เก็บผล query เป็น CSV/Markdown, เปรียบเทียบ count ก่อน/หลัง index และตรวจว่า Ticket ที่ soft delete ไม่ปรากฏใน view

## ปัญหาที่อาจพบและวิธีแก้

- **ยอดซ้ำ:** ตรวจ one-to-many join และ grain
- **index ไม่ถูกใช้:** ดู table size, statistics และ predicate ที่ query ใช้จริง
- **Aging ผิด:** ตรวจ UTC, `reported_at` และ `now()`
- **หน้า 2 ข้อมูลข้าม:** ใช้ cursor ที่รวม timestamp กับ id
- **view แตกหลัง migration:** version column contract และแก้ consumer อย่างมีแผน

## Challenge เพิ่มเติม

เพิ่ม query Top Failure Assets ที่นับเฉพาะ Closed/Verified Ticket และแยก Repeat Failure ภายใน 30 วัน

## Lab Checklist

- [ ] Baseline query ผ่าน
- [ ] Backlog query ผ่าน
- [ ] Aging CTE ผ่าน
- [ ] Reporting view สร้างสำเร็จ
- [ ] Index มีเหตุผลรองรับ
- [ ] EXPLAIN evidence ครบ
- [ ] Keyset pagination ผ่าน
- [ ] Reconciliation report ครบ
