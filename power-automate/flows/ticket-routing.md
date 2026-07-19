# Flow Design: Ticket Routing

1. Trigger: HTTP request หรือ Power Apps action
2. Validate: ตรวจ required fields และ priority
3. Call API: ใช้ connection reference ของ environment
4. Route: Critical → Supervisor; อื่น ๆ → technician queue
5. Persist: สร้าง ticket และ status history แบบ idempotent ด้วย request ID
6. Notify: Teams/email พร้อม link ที่ไม่เปิดข้อมูลเกินสิทธิ์
7. Failure: retry เฉพาะ 429/5xx; ส่ง error ไป monitoring และไม่ retry 4xx validation
