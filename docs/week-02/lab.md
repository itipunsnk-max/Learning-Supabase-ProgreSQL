# Week 2 Lab — Controlled Repair Workflow

## เป้าหมาย

ต่อยอด Repair Request จาก Week 1 ให้มี Ticket Number, SLA, Status History, Critical Approval และการ assign Technician โดยป้องกัน duplicate submission

## สิ่งที่ต้องเตรียม

- Week 1 prototype ใน Development environment
- Lists: RepairRequests, StatusHistory, StatusTransitions, TicketCounters
- ผู้ทดสอบ 3 role: Requester, Supervisor, Technician
- Power Automate connection reference

## ขั้นตอน

1. เพิ่ม `ClientRequestId`, `TicketNumber`, timestamps และ `SlaDueAt`
2. สร้าง transition matrix ตามบทเรียน
3. เพิ่ม GUID ก่อน Submit
4. สร้าง Flow ตรวจ duplicate และสร้างเลข Ticket
5. สร้าง Routing Flow สำหรับ Normal/Urgent/Critical
6. สร้าง Approval สำหรับ Critical
7. บันทึก Status History ทุกครั้งที่ status เปลี่ยน
8. สร้าง reminder เมื่อใกล้ SLA due time
9. ทดสอบ Approve, Reject, Timeout และ notification failure

## ตัวอย่าง Transition Payload

```json
{
  "ticket_number": "CMMS-20260719-0001",
  "from_status": "submitted",
  "to_status": "assigned",
  "changed_by": "supervisor@example.com",
  "note": "Assigned to electrical technician"
}
```

## Expected Result

Normal ticket ไปยัง assignment ได้โดยไม่ต้อง approval; Critical ticket ต้องผ่าน approval; การกด Submit ซ้ำไม่สร้าง Ticket เพิ่ม และทุก status change มีประวัติ

## วิธีตรวจสอบผล

ตรวจจำนวน RepairRequests, TicketNumber, ClientRequestId, StatusHistory, Approval response, Flow Run History และค่า SlaDueAt

## ปัญหาที่อาจพบและวิธีแก้

- **เลข Ticket ซ้ำ:** ตรวจ concurrency ของ counter และ unique validation
- **Flow trigger วน:** เพิ่ม trigger condition และ automation flag
- **Approval ไม่พบ Supervisor:** ตรวจ Site mapping และ email format
- **ประวัติขาด:** ตรวจว่า update status ผ่าน Flow เดียวกันหรือไม่
- **SLA คลาดเคลื่อน:** ตรวจ timezone และวันหยุดใน calendar

## Challenge เพิ่มเติม

เพิ่ม escalation เมื่อ Critical ยังไม่ถูก Accepted ภายใน 30 นาที และส่ง summary ให้ Maintenance Manager ทุกเช้า

## Lab Checklist

- [ ] Normal route ผ่าน
- [ ] Critical approval ผ่าน
- [ ] Reject route ผ่าน
- [ ] Timeout/escalation ผ่าน
- [ ] Duplicate submission ไม่สร้างซ้ำ
- [ ] Status History ครบ
- [ ] SLA reminder ผ่าน
- [ ] Error path มีหลักฐาน
