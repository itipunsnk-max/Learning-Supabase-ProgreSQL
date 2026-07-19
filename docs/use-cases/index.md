# Use Case Catalog

| # | Use Case | Actor | Trigger | KPI |
| --- | --- | --- | --- | --- |
| 1 | แจ้งซ่อมอุปกรณ์ไฟฟ้า | Requester | พบอาการผิดปกติ | Response Time |
| 2 | แจ้งซ่อมผ่าน Mobile | Field user | พบปัญหาหน้างาน | Mobile completion |
| 3 | ถ่ายรูป Before Repair | Requester | ก่อนเริ่มงาน | Evidence completeness |
| 4 | Assign Technician | Supervisor | Ticket submitted | Assignment time |
| 5 | Technician รับงาน | Technician | ได้รับมอบหมาย | Acceptance time |
| 6 | บันทึกผลการตรวจสอบ | Technician | ตรวจหน้างานเสร็จ | First-time fix |
| 7 | รออะไหล่ | Technician | อะไหล่ไม่พร้อม | Waiting hours |
| 8 | ส่งงานให้ Vendor | Supervisor | ต้องใช้ผู้รับเหมา | Vendor SLA |
| 9 | อัปโหลดรูป During Repair | Technician | ระหว่างซ่อม | Photo completeness |
| 10 | อัปโหลดรูป After Repair | Technician | ซ่อมเสร็จ | Closure evidence |
| 11 | Supervisor ตรวจรับ | Supervisor | งาน completed | Verification time |
| 12 | ปิด Work Order | Supervisor | ตรวจรับผ่าน | Closure rate |
| 13 | ค้นหาประวัติ Asset | Technician | วางแผนซ่อม | Search success |
| 14 | ตรวจ Asset เสียซ้ำ | Manager | วิเคราะห์รายเดือน | Repeat failure rate |
| 15 | วิเคราะห์ SLA/Backlog | Manager | WBR/MBR | SLA compliance |
| 16 | ค่าใช้จ่ายตาม Site | Manager | ทบทวนงบ | Cost/site |
| 17 | งานตาม Technician | Supervisor | จัด workload | Utilization |
| 18 | งานตาม Vendor | Manager | ประเมินผู้รับเหมา | Vendor performance |
| 19 | Warranty ใกล้หมด | Asset owner | daily job | Warranty coverage |
| 20 | MTTR/MTBF | Executive | monthly review | Reliability |

ทุกรายการต้องกรอก Actor, Preconditions, Trigger, Main Flow, Alternative Flow, Exception Flow, Business Rules, Data Used, Security, Acceptance Criteria และ KPI ตาม [แม่แบบ](/use-cases/template)
