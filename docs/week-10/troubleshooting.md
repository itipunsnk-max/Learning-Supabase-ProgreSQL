# Week 10 Troubleshooting

## Incident Triage

เริ่มจาก impact/scope/time, ตรวจ health check และ recent change, ใช้ request ID/log/metrics หา root cause แล้วสื่อสาร workaround/owner/next update ตาม severity

## Backup and Restore

อย่าถือว่าไฟล์ backup ที่สร้างเสร็จคือ restore ได้ ต้องตรวจความครบของ database, Storage, configuration และ permissions ใน isolated environment

## Security and Change

ทุก emergency change ต้องมีผู้อนุมัติย้อนหลัง, audit trail และ follow-up review ห้ามแก้ Production ด้วย credential ร่วมที่ไม่มี accountability
