# Week 7 Lab — CMMS REST API Test Suite

## เป้าหมาย

สร้าง collection สำหรับทดสอบ Ticket API ตั้งแต่ authentication, create/read/update, filtering/pagination ไปจนถึง error และ RLS cases

## สิ่งที่ต้องเตรียม

- Supabase Development project จาก Week 5/6
- Test users requester, technician และ supervisor
- Postman หรือ Bruno
- `api/schemas/ticket.json` และ `api/examples/tickets.http`
- Environment variables ที่ไม่มี key จริงใน repository

## ขั้นตอน

1. สร้าง environment: base URL, anon key, access token, test IDs
2. Login และเก็บ access token แบบไม่ log token
3. สร้าง Ticket valid
4. อ่าน Ticket ด้วย ID และ filter/status
5. ทดสอบ pagination และ sorting
6. PATCH status ตาม transition ที่อนุญาต
7. ทดสอบ invalid payload, duplicate, 401, 403, 404, 409 และ 422
8. ทดสอบ rate limit/network timeout ด้วย retry ที่จำกัด
9. ตรวจ request ID และ cleanup test data

## ตัวอย่าง cURL

```bash
curl -X GET "$SUPABASE_URL/rest/v1/tickets?status=eq.in_progress&limit=20" \
  -H "apikey: $SUPABASE_ANON_KEY" \
  -H "Authorization: Bearer $SUPABASE_ACCESS_TOKEN"
```

## Expected Result

Valid request ได้ 2xx, invalid request ได้ error code ที่คาดหมาย, user ต่าง role ได้ข้อมูลตาม RLS และ collection สามารถรันซ้ำโดยไม่สร้าง duplicate Ticket

## วิธีตรวจสอบผล

บันทึก test run summary, response status, request ID, test environment/version และผล pass/fail โดย mask token/PII

## ปัญหาที่อาจพบและวิธีแก้

- **401:** ตรวจ Bearer token และ expiration
- **403:** ตรวจ RLS policy และ profile role
- **409:** ตรวจ idempotency key/unique field
- **422:** ตรวจ JSON type/required field
- **429:** ลดความถี่และใช้ exponential backoff
- **ไม่เห็น response:** ตรวจ CORS, URL, network และ API base path

## Challenge เพิ่มเติม

เพิ่ม Postman pre-request script ที่สร้าง correlation ID และ test ที่ยืนยันว่า response ทุกตัวมี `request_id`

## Lab Checklist

- [ ] Environment variables แยกจาก source
- [ ] Login/access token
- [ ] Create/Get/Patch tests
- [ ] Filter/sort/pagination
- [ ] Negative cases
- [ ] RLS role tests
- [ ] Retry/rate-limit test
- [ ] Masked test report
