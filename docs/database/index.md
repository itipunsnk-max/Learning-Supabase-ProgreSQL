# Database Assets

ชุด SQL อยู่ใน `database/`: migration สร้าง core schema, seed ใช้ข้อมูลจำลอง, view สำหรับ Power BI, function สร้าง Ticket, trigger บันทึก status และ policies สำหรับ RLS

## Data Dictionary แบบย่อ

| Table | Grain | ความรับผิดชอบ |
| --- | --- | --- |
| profiles | 1 user | identity/role |
| sites | 1 site | สถานที่ |
| assets | 1 asset | equipment master |
| tickets | 1 repair request | อาการและ SLA |
| work_orders | 1 ticket | execution |
| status_history | 1 transition | audit workflow |
| repair_photos | 1 file | evidence metadata |
