# Week 9 Assessment

## Knowledge Check / Quiz 10 ข้อ

1. Local Draft และ Pending Queue ต่างกันอย่างไร
2. Server truth หมายถึงอะไร
3. Idempotency key ป้องกันอะไร
4. Version check ป้องกันอะไร
5. ทำไมต้อง sync parent ก่อน child photo
6. Field ใดควรให้ Supervisor/server เป็นผู้ชนะ
7. ทำไมไม่เก็บ token ใน offline queue
8. Retry ต้องมี max retry เพราะอะไร
9. Reconciliation report ตรวจเรื่องใด
10. Offline scope ของ Critical closure ควรเป็นอย่างไร

## Lab Checklist

- [ ] Queue state machine
- [ ] Offline draft
- [ ] Reconnect sync
- [ ] Duplicate protection
- [ ] Conflict handling
- [ ] Photo dependency
- [ ] Retry/expiry
- [ ] Security/retention

## Self-Assessment

ให้คะแนน 1–5 ในหัวข้อ Offline Design, Queue State, Idempotency, Conflict Resolution, Mobile Storage, Sync Testing และ Privacy พร้อมแนบ state evidence

## Review Questions

อธิบายว่าทำไม “offline ใช้ได้” ต้องมีขอบเขตและไม่ควรหมายถึงทุก operation สามารถทำได้โดยไม่มี server validation

## Practical Assignment

ส่ง offline architecture, queue schema, conflict matrix, test evidence ของ reconnect/duplicate/conflict และ reconciliation report
