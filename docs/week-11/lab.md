# Week 11 Lab — CMMS UAT and Incident Drill

## เป้าหมาย

สร้าง test pack ที่ trace จาก requirement ถึง evidence และทำ UAT/incident drill สำหรับ workflow แจ้งซ่อมจนปิดงาน

## สิ่งที่ต้องเตรียม

- Test environment และ test users ทุก role
- Requirements/acceptance criteria, RLS matrix และ API contract
- `docs/testing/test-cases.md`
- Test data ที่เป็น synthetic/masked
- ผู้เข้าร่วม: QA, Technician, Supervisor และ Release Owner

## ขั้นตอน

1. สร้าง traceability matrix
2. เพิ่ม test cases positive/negative/security/reliability
3. รัน Create → Assign → In Progress → Completed → Verified → Closed
4. รันทดสอบ RLS/API/Auth/Photo/SLA/Power BI/Backup
5. เปิด defect ที่มี severity/evidence/owner
6. ทำ UAT session กับ business owner
7. จำลอง API 500 หรือ storage outage
8. ทำ incident timeline และ recovery validation
9. ทำ regression และ release smoke test
10. บันทึก UAT sign-off/known limitations

## ตัวอย่าง Test Evidence

```text
Test ID: TC-016
Scenario: Work Order Closure
Role: Supervisor
Build: 2026.07.19.1
Expected: ปิดงานได้เมื่อมี Verified และ After Photo
Actual: ผ่าน
Evidence: test-runs/TC-016/response.json, screenshot.png
Executed At: 2026-07-19T04:00:00Z
```

## Expected Result

Test cases มีผล Actual/Status/evidence, UAT ผ่านตาม acceptance criteria และ incident drill แสดงการ detect, mitigate, recover และ communicate ได้

## วิธีตรวจสอบผล

ตรวจ traceability coverage, blocker defects, sign-off owner, incident timestamps, smoke result และ regression summary

## ปัญหาที่อาจพบและวิธีแก้

- **UAT ไม่ผ่าน:** แยก defect กับ change request และระบุ decision owner
- **ผล reproduce ไม่ได้:** lock build/data/role และเก็บ request ID
- **incident ไม่มีคนตอบ:** ใช้ escalation matrix และ primary/secondary owner
- **evidence มี secret:** ลบ/rotate และเพิ่ม masking rule
- **แก้แล้ว regression:** เพิ่ม test case ใน suite และรันก่อน release ใหม่

## Challenge เพิ่มเติม

เพิ่ม automated smoke test หลัง deploy และส่งผลเข้า release record โดย block เมื่อ health check หรือ critical API ไม่ผ่าน

## Lab Checklist

- [ ] Traceability matrix
- [ ] Test execution
- [ ] Defect triage
- [ ] UAT sign-off
- [ ] RLS/API/security tests
- [ ] Incident drill
- [ ] Recovery validation
- [ ] Regression/smoke test
- [ ] Known limitations
