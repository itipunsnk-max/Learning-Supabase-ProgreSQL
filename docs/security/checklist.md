# Security Checklist ก่อน Production

- [ ] เปิด RLS ทุกตารางที่ client เข้าถึง
- [ ] ตรวจ role matrix ของ requester, technician, supervisor และ manager
- [ ] ไม่มี service role key ใน Power Apps, browser, Git หรือ log
- [ ] Secrets อยู่ใน managed environment variable/secret store
- [ ] Storage เป็น private bucket และใช้ signed URL อายุสั้น
- [ ] ตรวจ MIME type, file size, extension และ malware scanning ตามนโยบายองค์กร
- [ ] Validate input ที่ API และใช้ parameterized query
- [ ] มี audit log และ status history ที่แก้ย้อนหลังไม่ได้โดยผู้ใช้ทั่วไป
- [ ] เปิด HTTPS, จำกัด CORS และ rate limit endpoint
- [ ] ทดสอบ session expiration, token rotation และ unauthorized access
- [ ] มี backup encryption, restore test และ retention policy
- [ ] ประเมินข้อมูลพิกัด/ผู้ใช้งานตาม PDPA และเก็บเท่าที่จำเป็น
