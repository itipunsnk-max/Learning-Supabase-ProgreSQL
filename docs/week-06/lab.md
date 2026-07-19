# Week 6 Lab — Secure Repair Photo Workflow

## เป้าหมาย

สร้าง upload flow สำหรับรูป Before, During และ After Repair ที่ใช้ private bucket, metadata, signed URL และ retry queue

## สิ่งที่ต้องเตรียม

- Supabase Development project จาก Week 5
- Private bucket ชื่อ `repair-photos`
- `tickets`, `work_orders`, `profiles` และ `repair_photos`
- รูปทดสอบ JPG/PNG, ไฟล์ชนิดต้องห้าม และไฟล์เกิน 10 MB
- มือถือหรือ emulator ที่จำลอง offline ได้

## ขั้นตอน

1. สร้าง private bucket และกำหนด policy
2. สร้าง `repair_photos` metadata table
3. กำหนด object path ด้วย Ticket ID/photo type/UUID
4. ตรวจ type, size และ dimensions ที่ client
5. ตรวจซ้ำที่ upload API/server
6. upload object ด้วย `upsert: false`
7. insert metadata และ cleanup เมื่อ insert fail
8. สร้าง signed URL อายุ 5 นาที
9. ทดสอบ requester/technician/supervisor access
10. จำลอง network failure และ retry จาก queue

## ตัวอย่าง Metadata Payload

```json
{
  "ticket_id": "00000000-0000-0000-0000-000000000001",
  "photo_type": "before",
  "object_path": "ticket-001/before/uuid.jpg",
  "mime_type": "image/jpeg",
  "file_size": 245678,
  "caption": "MDB front panel before repair"
}
```

## Expected Result

รูป valid ถูกเก็บใน private bucket และมี metadata; รูป invalid ถูกปฏิเสธ; user ที่ไม่มีสิทธิ์ขอ signed URL ไม่ได้ และ retry ไม่สร้างซ้ำ

## วิธีตรวจสอบผล

ตรวจ Storage object, database row, RLS result, signed URL expiry, queue state และ orphan cleanup log

## ปัญหาที่อาจพบและวิธีแก้

- **403 ตอน upload:** ตรวจ storage policy และ user JWT
- **metadata ซ้ำ:** ตรวจ unique object_path และ idempotency key
- **รูปหมุนผิด:** ตรวจ EXIF orientation ก่อน resize/strip
- **โหลดช้า:** ลด resolution/quality และทำ thumbnail
- **ไฟล์ค้าง:** สร้าง orphan cleanup query/job และทำ retry ที่ไม่สร้าง path ใหม่

## Challenge เพิ่มเติม

เพิ่ม image hash เพื่อป้องกันการ upload รูปเดียวกันซ้ำ และกำหนด retention ให้ลบ temporary object หลัง 24 ชั่วโมง

## Lab Checklist

- [ ] Private bucket
- [ ] Metadata table
- [ ] Before/During/After path
- [ ] Server validation
- [ ] Signed URL
- [ ] Permission test
- [ ] Invalid file test
- [ ] Network retry test
- [ ] Orphan cleanup test
