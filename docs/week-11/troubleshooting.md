# Week 11 Troubleshooting

## Test Evidence

เก็บ build/version, environment, role, input, expected/actual, request ID และ artifact link ทุกครั้ง หลีกเลี่ยง screenshot ที่มี token, password หรือ PII เกินจำเป็น

## Incident Response

แยก mitigation ที่ทำให้บริการกลับมาใช้ได้จาก root cause ที่ต้องแก้ถาวร พร้อมบันทึกเวลา การตัดสินใจ ผู้สื่อสาร และผลตรวจ data integrity หลัง recovery

## Release Quality

หาก critical test fail, RLS/security fail, restore fail หรือ UAT owner ไม่ sign-off ให้หยุด release และเปิด risk/decision record แทนการเปลี่ยนสถานะเป็นผ่านเอง
