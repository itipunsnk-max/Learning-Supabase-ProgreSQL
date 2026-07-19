# Week 4 Troubleshooting

## Query Performance

เริ่มจากวัด baseline ก่อนแก้ ตรวจจำนวน row, filter selectivity, join cardinality และ execution plan แล้วจึงเปลี่ยน query/index อย่าพึ่งพาเวลาจากข้อมูลจำลองขนาดเล็กเพื่อสรุป Production performance

## Reporting Correctness

ถ้ายอดไม่ตรง ให้ตรวจ definition ของ status, timezone, soft-delete filter, date boundary และ grain ก่อนแก้ด้วย `distinct` เพราะ `distinct` อาจซ่อน relationship ที่ออกแบบผิด

## Security

เปิด reporting view เฉพาะ column ที่จำเป็น ใช้ role/read policy ที่เหมาะสม และอย่าเปิด raw table ที่มี email, location หรือข้อมูลส่วนบุคคลให้ dashboard ทุกกลุ่ม
