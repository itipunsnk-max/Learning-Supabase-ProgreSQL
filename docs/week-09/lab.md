# Week 9 Lab — Offline Field Sync

## เป้าหมาย

สร้าง local queue สำหรับ Draft Ticket และผลซ่อม พร้อม sync กลับ Supabase เมื่อ online โดยทดสอบ duplicate, version conflict และ photo dependency

## สิ่งที่ต้องเตรียม

- Power Apps integration จาก Week 8
- Supabase Development API ที่รองรับ idempotency/version
- อุปกรณ์มือถือหรือ emulator
- Test user Technician และ Supervisor
- รูปจำลองและข้อมูล Asset cache

## ขั้นตอน

1. กำหนด offline scope และ sensitive fields
2. สร้าง local queue schema/state
3. บันทึก Draft พร้อม `client_request_id`
4. ปิด network แล้วสร้าง Ticket/ผลตรวจ/รูป
5. เปิด network และ sync parent Ticket ก่อน
6. sync Work Order/Photo metadata ตาม dependency
7. จำลอง retry เดิมและตรวจไม่เกิด duplicate
8. แก้ Ticket server ระหว่าง offline แล้วทดสอบ conflict
9. ทดสอบ token expired, queue expiry และ device storage limit
10. สร้าง reconciliation report

## ตัวอย่าง Queue Record

```json
{
  "local_id": "local-001",
  "operation": "create_ticket",
  "client_request_id": "req-001",
  "state": "pending",
  "retry_count": 0,
  "depends_on": [],
  "payload_hash": "sha256-demo"
}
```

## Expected Result

ข้อมูล offline แสดง state ชัดเจน เมื่อกลับ online Ticket ถูกสร้างครั้งเดียว, รูปผูกกับ server Ticket ID และ conflict ถูกหยุดไว้ให้ผู้ใช้ตัดสินใจ

## วิธีตรวจสอบผล

ตรวจ local queue transitions, API request IDs, server records, duplicate count, conflict record, photo object path และ reconciliation totals

## ปัญหาที่อาจพบและวิธีแก้

- **สร้างซ้ำ:** ตรวจ request ID ที่ส่งซ้ำและ server unique constraint
- **รูป orphan:** ตรวจ dependency mapping และ cleanup state
- **sync วน:** ตรวจ retry count/backoff และ error classification
- **conflict ถูก overwrite:** บังคับ If-Match/expected_version
- **ข้อมูลค้างบนมือถือ:** ใช้ expiry/clear policy และแจ้งผู้ใช้

## Challenge เพิ่มเติม

เพิ่ม queue priority: Critical safety note สูงกว่า Low inspection แต่ไม่อนุญาตให้ offline queue เปลี่ยน Status เป็น Closed

## Lab Checklist

- [ ] Offline scope
- [ ] Local queue
- [ ] Create Draft offline
- [ ] Reconnect sync
- [ ] Idempotency test
- [ ] Photo dependency
- [ ] Version conflict
- [ ] Queue expiry
- [ ] Reconciliation report
