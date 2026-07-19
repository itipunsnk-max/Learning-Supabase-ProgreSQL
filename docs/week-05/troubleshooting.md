# Week 5 Troubleshooting

## RLS Debugging

เริ่มจากตรวจว่า request ใช้ user JWT หรือ anon context, `auth.uid()` คืนค่าหรือไม่, policy ใช้ `using`/`with check` ถูก operation และ relationship ไปยัง profile/assignment มีข้อมูลจริง

## Secret Management

เก็บ Project URL/anon key ผ่าน environment configuration และเก็บ service role ใน server-side secret store เท่านั้น หากสงสัยว่า key หลุดให้ rotate ทันทีและตรวจ Git history/logs

## Security Review

ทดสอบ direct REST request, cross-user ID, cross-site query, expired token และ role escalation ไม่ทดสอบเฉพาะหน้าจอที่อาจซ่อนปุ่มไว้
