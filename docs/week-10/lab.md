# Week 10 Lab — Production Readiness Review

## เป้าหมาย

ประเมิน CMMS ก่อน Production โดยตรวจ environment, configuration, security, monitoring, backup/restore, retention, deployment และ support handover

## สิ่งที่ต้องเตรียม

- Architecture/ERD/RLS matrix จากสัปดาห์ก่อน
- Test report และ deployment workflow
- Development database/storage ที่ใช้ทำ restore drill
- `.env.example` และรายการ secret names
- ผู้ตรวจอย่างน้อย developer และ business owner

## ขั้นตอน

1. จัดทำ environment/config matrix
2. ตรวจ service role/RLS/RBAC/least privilege
3. ตรวจ audit log/status history
4. ตั้ง health check, metrics และ alert owner
5. สร้าง backup และบันทึก timestamp/retention
6. restore ไปยัง isolated target
7. ตรวจ row count, constraints, storage mapping และ smoke test
8. จำลอง migration failure และ rollback decision
9. ตรวจ user/admin/support manual
10. ลงนาม Production Readiness Checklist

## ตัวอย่าง Release Record

```json
{
  "release_id": "REL-2026-001",
  "version": "2026.07.19.1",
  "migration": "001_cmms_core.sql",
  "uat_status": "passed",
  "backup_id": "backup-demo-001",
  "rollback_owner": "release-manager@example.com",
  "approved_at": "2026-07-19T03:00:00Z"
}
```

## Expected Result

ได้ readiness pack ที่แสดงว่า system, data, security, backup, monitoring และ support มี owner และ evidence ไม่ใช่เพียง checkbox ว่าง ๆ

## วิธีตรวจสอบผล

ตรวจ artifact path, migration checksum, test IDs, restore row counts, alert test, secret scan และ approval record

## ปัญหาที่อาจพบและวิธีแก้

- **restore สำเร็จแต่ app ใช้ไม่ได้:** ตรวจ config/schema/version และ run smoke test
- **rollback schema ไม่ได้:** เปลี่ยนเป็น forward fix หรือ restore ตาม RTO แทนการเดา SQL ย้อนกลับ
- **alert ไม่มีคนรับ:** ตั้ง primary/secondary owner และ escalation time
- **secret พบใน log:** หยุดเผยแพร่, rotate secret และแก้ masking
- **retention ไม่ทำงาน:** ตรวจ scheduler, permissions และ exception report

## Challenge เพิ่มเติม

กำหนด SLO เช่น API availability, p95 latency, backup success และ alert response พร้อมคำนวณ error budget แบบง่าย

## Lab Checklist

- [ ] Environment matrix
- [ ] Security review
- [ ] Audit/monitoring
- [ ] Backup created
- [ ] Restore drill
- [ ] RPO/RTO
- [ ] Rollback decision
- [ ] Retention check
- [ ] Support handover
