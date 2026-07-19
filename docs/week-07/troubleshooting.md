# Week 7 Troubleshooting

## API Diagnosis

เริ่มจากตรวจ URL/method/header/body/status แล้วใช้ `request_id` ค้น log อย่าแก้ 403 ด้วย service role key เพราะจะซ่อนปัญหา RLS และสร้างช่องโหว่

## Retry และ Rate Limit

retry เฉพาะ network/429/บาง 5xx ด้วย backoff และจำนวนครั้งจำกัด ห้าม retry validation error หรือ POST ที่ไม่มี idempotency key

## Security

mask access token, anon/service keys, email และ location ใน test output ใช้ Development project และ test accounts ที่สร้างขึ้นเฉพาะงาน
