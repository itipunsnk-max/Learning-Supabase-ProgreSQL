# Week 6 Troubleshooting

## Upload Reliability

แยก client validation, server validation, object upload และ metadata insert ออกจากกันเพื่อระบุ failure stage ได้ชัด หากขั้นใดล้มเหลวต้องมี cleanup/retry policy ไม่ใช่สร้างไฟล์ใหม่โดยอัตโนมัติ

## Storage Security

ใช้ private bucket, policy ที่ผูกกับ user/Ticket และ signed URL อายุสั้น ห้ามแก้ปัญหา 403 ด้วยการเปิด bucket เป็น public โดยไม่ผ่าน security review

## Privacy

ตรวจ EXIF, GPS, filename และ caption ก่อนเก็บจริง กำหนด retention และ deletion process ให้สอดคล้องกับ PDPA/นโยบายองค์กร
