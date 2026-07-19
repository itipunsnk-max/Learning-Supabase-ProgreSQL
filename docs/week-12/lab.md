# Week 12 Lab — Power BI CMMS Dashboard และ Capstone Demo

## เป้าหมาย

สร้าง star schema, DAX KPI, dashboard ตาม audience, RLS/mobile layout และนำเสนอ Final Project พร้อม reconciliation/production evidence

## สิ่งที่ต้องเตรียม

- Supabase reporting view จาก Week 4
- Power Query และ sample data
- KPI dictionary/acceptance criteria
- Test users หรือ role mapping สำหรับ Power BI RLS
- Architecture, ERD, API, UAT และ operations pack

## ขั้นตอน

1. กำหนด fact grain และ dimensions
2. สร้าง Date/Asset/Site/Technician dimensions
3. เชื่อม reporting view และตั้ง data types
4. สร้าง DAX measures: backlog, SLA, MTTR, MTBF, cost
5. สร้าง Technician/Supervisor/Manager/Executive pages
6. เพิ่ม drillthrough, tooltip, mobile layout และ last refresh
7. ตั้ง Power BI/source RLS
8. reconcile KPI กับ SQL
9. ทำ refresh failure/empty data test
10. สาธิต Final Project และเก็บ capstone sign-off

## ตัวอย่าง KPI Validation

```sql
-- Source count สำหรับเทียบกับ Power BI Open Work Orders
select count(*)
from public.tickets
where deleted_at is null
  and status in ('new','submitted','assigned','in_progress');
```

## Expected Result

Dashboard แสดงตัวเลขตรง source, filter/drillthrough ทำงาน, role เห็นข้อมูลถูกต้อง, mobile layout อ่านได้ และ Final Project demo ครบตั้งแต่ Ticket ถึง KPI

## วิธีตรวจสอบผล

บันทึก model screenshot, DAX definitions, SQL reconciliation, RLS test, refresh timestamp, mobile screenshot และ capstone review

## ปัญหาที่อาจพบและวิธีแก้

- **ยอดไม่ตรง:** ตรวจ grain, filter context, timezone และ soft-delete filter
- **RLS เกินสิทธิ์:** ตรวจ source/model role mapping แยกกัน
- **refresh fail:** ตรวจ credential/gateway/schema contract
- **mobile แน่น:** ลด visual และกำหนด mobile-specific layout
- **MTBF ผิด:** ตรวจ failure event/asset history และ time window

## Challenge เพิ่มเติม

เพิ่ม downtime fact และ executive alert เมื่อ Critical Asset มี repeat failure เกิน threshold โดยไม่เปิด PII ใน alert

## Lab Checklist

- [ ] Fact grain
- [ ] Dimensions/date table
- [ ] DAX/KPI dictionary
- [ ] Audience dashboards
- [ ] Drillthrough/tooltip/mobile
- [ ] Power BI/source RLS
- [ ] Reconciliation
- [ ] Refresh failure test
- [ ] Capstone demo/sign-off
