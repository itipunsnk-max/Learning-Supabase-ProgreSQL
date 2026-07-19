# Week 12 Troubleshooting

## Model and DAX

ตรวจ grain, relationship direction, active date relationship, filter context และ null values ก่อนแก้ DAX หากยอดซ้ำให้ย้อนดู model ไม่ใช้ `DISTINCT` กลบปัญหาโดยไม่มีเหตุผล

## Refresh

ตรวจ source view/schema, credential/gateway, refresh history, last refresh time และ data quality row counts หาก refresh fail ให้แสดงสถานะ stale แทนการทำเหมือนข้อมูลสด

## Security and Presentation

ทดสอบ Power BI RLS และ source RLS แยกกัน จำกัด export/download ตาม audience และ mask PII/location ใน screenshot, demo และ documentation
