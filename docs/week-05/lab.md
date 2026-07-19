# Week 5 Lab — Supabase Auth และ RLS Matrix

## เป้าหมาย

สร้าง Development Supabase project ที่มี profiles, roles และ RLS สำหรับ requester, technician และ supervisor พร้อมทดสอบ direct API access

## สิ่งที่ต้องเตรียม

- Supabase Development project
- SQL migration จาก Week 3/4
- Test accounts 3 role ที่ไม่ใช่ข้อมูลจริง
- `.env.example` และ secret store สำหรับค่าทดสอบ

## ขั้นตอน

1. สร้าง Auth users และ profile rows
2. เปิด RLS ให้ profiles/sites/assets/tickets/work_orders
3. เขียน RLS matrix ก่อนสร้าง policy
4. เพิ่ม requester insert/select policies
5. เพิ่ม technician assigned-work policy
6. เพิ่ม supervisor Site policy
7. ทดสอบด้วย Supabase client และ REST request
8. ทดสอบ token expired และ cross-user access
9. ตรวจ `pg_policies` และเก็บ evidence

## ตัวอย่าง RLS Test Query

```sql
-- ตรวจว่ามี policy ครบสำหรับ tickets
select policyname, cmd, roles
from pg_policies
where schemaname = 'public' and tablename = 'tickets';
```

## Expected Result

Requester เห็น Ticket ของตนเอง, Technician เห็น Ticket ที่ assign, Supervisor เห็นงานใน Site ตามสิทธิ์ และ user ที่ไม่มีสิทธิ์ได้รับ 401/403 หรือไม่เห็น row ตาม policy

## วิธีตรวจสอบผล

ใช้ session ของแต่ละ test user เรียก endpoint เดียวกันด้วย Ticket ID ของตนเองและของคนอื่น แล้วบันทึก status code/จำนวน row โดยไม่บันทึก token ลง evidence

## ปัญหาที่อาจพบและวิธีแก้

- **ได้ศูนย์ row ทุกคน:** ตรวจว่ามี profile/role และ policy `using` ตรงกัน
- **Insert 403:** ตรวจ `with check` และ reporter_id
- **Policy recursion:** แยก helper function และลด query ที่อ้าง table เดิม
- **Role เปลี่ยนได้:** ถอน update policy จาก role field และให้ admin workflow แทน
- **Token หมดอายุ:** refresh session หรือ login ใหม่ใน Development

## Challenge เพิ่มเติม

เพิ่ม policy ให้ supervisor แก้ได้เฉพาะ `assignee_id`, `status` และ `due_at` แต่แก้ `reporter_id` ไม่ได้ โดยใช้ API ที่แยก update operation หรือ server-side function

## Lab Checklist

- [ ] Test users และ profiles ครบ
- [ ] RLS matrix ครบ
- [ ] Policies สร้างสำเร็จ
- [ ] Requester test ผ่าน
- [ ] Technician test ผ่าน
- [ ] Supervisor test ผ่าน
- [ ] Cross-user access ถูกปฏิเสธ
- [ ] ไม่มี secret ใน evidence
