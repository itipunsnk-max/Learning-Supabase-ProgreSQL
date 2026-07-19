# Week 9 Troubleshooting

## Sync Diagnosis

ตรวจ queue state, request ID, retry count, dependency, server response และ version ตามลำดับ ใช้ request ID ค้น server log และไม่สร้าง request ใหม่เพื่อกลบ failed record

## Conflict Handling

แยก conflict ที่แก้ได้อัตโนมัติออกจาก conflict ที่ต้องให้คนตัดสินใจ เช่น status/assignee ต้อง review ส่วน caption อาจใช้ last-write หรือ user choice ตาม policy

## Privacy and Device Risk

ลดข้อมูลที่เก็บ offline, ใช้ encryption/device management, ตั้ง expiry และล้างข้อมูลเมื่อ logout/เปลี่ยนผู้ใช้ ห้ามเก็บ access token ใน queue
