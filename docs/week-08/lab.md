# Week 8 Lab — Power Apps–Supabase Integration

## เป้าหมาย

สร้าง integration layer ที่ให้ Power Apps เรียก Supabase ผ่าน Power Automate/Custom Connector พร้อม pagination, retry, error mapping และ environment separation

## สิ่งที่ต้องเตรียม

- Power Platform Development environment
- Supabase Development project จาก Week 5–7
- API contract/OpenAPI และ test users
- Solution ที่สร้าง connection reference ได้

## ขั้นตอน

1. สร้าง environment variables: API URL, audience และ timeout
2. Import OpenAPI เป็น Custom Connector หรือใช้ HTTP action ใน Flow ที่มี secure connection
3. สร้าง Flow `Cmms_CreateTicket` จาก Power Apps
4. Validate JSON และสร้าง idempotency key
5. เรียก API แล้ว Parse JSON
6. คืน DTO ที่มี ticket number/status/request ID
7. สร้าง Flow `Cmms_GetTickets` ที่รับ filter/cursor
8. เพิ่ม retry 429/5xx และ timeout
9. ผูก connection reference ใน Solution
10. ทดสอบ role, duplicate, offline และ environment switch

## ตัวอย่าง Flow Response

```json
{
  "ticket_number": "CMMS-20260719-0001",
  "status": "submitted",
  "request_id": "req-001",
  "next_cursor": null
}
```

## Expected Result

Power Apps สร้างและค้นหา Ticket ได้ผ่าน integration layer โดยไม่รู้ service role key, ใช้ server-side pagination และแสดง error ที่ผู้ใช้เข้าใจได้

## วิธีตรวจสอบผล

ตรวจ Power Apps formula, Flow run history, connector request/response ที่ mask secret, Supabase audit/request log และ RLS result

## ปัญหาที่อาจพบและวิธีแก้

- **Connector schema ไม่ตรง:** regenerate/แก้ OpenAPI และ version operation
- **Flow timeout:** ลด payload และแยก long-running work เป็น async
- **ข้อมูลไม่ครบ:** ตรวจ delegation และ cursor mapping
- **Deploy ชี้ Dev:** ตรวจ environment variable/connection reference
- **ซ้ำเมื่อ retry:** ใช้ idempotency key เดิมและ unique key ที่ API

## Challenge เพิ่มเติม

เพิ่ม offline queue ใน Power Apps สำหรับ draft Ticket และ sync เมื่อ online โดยแสดง conflict เมื่อ server version เปลี่ยน

## Lab Checklist

- [ ] Environment variables
- [ ] Connector/Flow
- [ ] JSON parsing
- [ ] Create/Get operations
- [ ] Server-side pagination
- [ ] Retry/timeout
- [ ] RLS role test
- [ ] Duplicate/conflict test
- [ ] Environment switch test
