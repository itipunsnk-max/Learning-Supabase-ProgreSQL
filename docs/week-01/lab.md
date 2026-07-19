# Week 1 Lab — สร้าง Repair Request Prototype

## เป้าหมาย

สร้างระบบแจ้งซ่อมเวอร์ชันแรกบน Power Apps + SharePoint ที่ผู้ใช้มือถือกรอกข้อมูล, แนบรูป, เก็บ location และค้นหา Ticket ของตนเองได้

## สิ่งที่ต้องเตรียม

- Microsoft 365 Development site
- สิทธิ์สร้าง SharePoint List และ Canvas App
- รายการ Asset จำลองอย่างน้อย 3 รายการ
- ผู้ใช้ทดสอบ: requester, supervisor, technician

## ขั้นตอน

1. สร้าง Lists ตามบทเรียน Week 1
2. เพิ่ม Asset จำลองและกำหนด Site/Functional Location
3. สร้าง Canvas App แบบ phone layout
4. เพิ่ม `frmRepairRequest`, Gallery และ Detail screen
5. ใส่ validation formula และ `OnSuccess/OnFailure`
6. เพิ่ม attachment และ location
7. สร้าง Flow แจ้ง Supervisor เมื่อ Status เป็น Submitted
8. ทดสอบ Normal และ Critical ticket

## Expected Result

ผู้ใช้สร้าง Ticket ได้เมื่อข้อมูลครบ เห็นรายการใน Gallery ได้รับ notification ตาม priority และเปิดจากมือถือได้โดยไม่ต้อง zoom

## วิธีตรวจสอบผล

ตรวจ SharePoint item, Flow Run History, ค่า Status, ReportedAt, Reporter, Latitude/Longitude และ attachment metadata แล้วบันทึก screenshot

## ปัญหาที่อาจพบและวิธีแก้

- **ข้อมูลไม่เข้า List:** ตรวจ required fields และ connection
- **รายการไม่ครบ:** ตรวจ delegation และ filter
- **Flow ไม่ส่งแจ้งเตือน:** ตรวจ trigger condition และ recipient
- **รูปอัปโหลดไม่ได้:** ตรวจ attachment setting และ file size
- **ตำแหน่งว่าง:** ตรวจ permission และทดสอบกรณีผู้ใช้ปฏิเสธ location

## Challenge เพิ่มเติม

เพิ่ม SLA rule: Normal 2 วันทำการ, Urgent 8 ชั่วโมง และ Critical 2 ชั่วโมง พร้อมแสดงสีของงานที่ใกล้เกินกำหนด

## Lab Checklist

- [ ] สร้าง Normal ticket
- [ ] สร้าง Critical ticket
- [ ] ตรวจ Required Field
- [ ] แนบรูปที่อนุญาต
- [ ] บันทึก location โดยได้รับ consent
- [ ] ตรวจ notification และ Flow Run History
- [ ] ทดสอบ phone layout
