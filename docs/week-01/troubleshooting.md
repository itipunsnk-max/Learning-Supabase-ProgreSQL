# Week 1 Troubleshooting

## Error Handling Pattern

ตรวจ `Form.Error`, `Errors(RepairRequests)` และ Flow Run History ก่อนแก้สูตร ถ้าข้อมูลถูกสร้างแต่ notification ล้มเหลว ให้แยกความสำเร็จของ database write ออกจาก notification failure และบันทึก incident แยกกัน

## Development กับ Production

ใช้ connection และ List ของ Development เท่านั้นใน Lab ก่อน export solution; ห้ามนำข้อมูลผู้ใช้งานจริงหรือรูปหน้างานจริงมาเป็น sample data

## Security Check

ห้ามฝัง API key หรือ Supabase service role key ในสูตร Power Apps และไม่ควรถือว่า hidden control เป็น authorization ให้ตรวจสิทธิ์ที่ datasource/backend ด้วย
