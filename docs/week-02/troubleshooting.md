# Week 2 Troubleshooting

## Flow Diagnostics

ตรวจ Trigger, Inputs, Outputs, Retry Policy และ Run After ของแต่ละ action อย่าแก้ด้วยการเพิ่ม retry แบบไม่จำกัด เพราะจะทำให้ Ticket ซ้ำและสร้าง notification หลายครั้ง

## Duplicate Protection

ใช้ `ClientRequestId` จาก Power Apps, ตรวจรายการเดิมก่อน create และตั้ง unique constraint เมื่อย้ายไป PostgreSQL/Supabase ถ้าเกิด duplicate แล้วให้เก็บ incident และไม่ลบ history แบบเงียบ ๆ

## Security

ใช้ least privilege สำหรับ Flow connection, จำกัด Supervisor ตาม Site และไม่ส่ง token, connection detail หรือข้อมูลส่วนบุคคลเกินจำเป็นไปใน Approval/Teams message
