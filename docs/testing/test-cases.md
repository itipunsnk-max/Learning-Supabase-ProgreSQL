# Test Cases

| ID | Scenario | Preconditions | Expected Result | Status |
| --- | --- | --- | --- | --- |
| TC-001 | Create Ticket | authenticated requester | สร้าง ticket พร้อมเลขอ้างอิง | Not Run |
| TC-002 | Required Field | form เปิดอยู่ | แจ้ง field ที่ว่างและไม่บันทึก | Not Run |
| TC-003 | Invalid Data Type | ส่งวันที่ผิดรูปแบบ | API ตอบ 400 | Not Run |
| TC-004 | Duplicate Ticket | retry request เดิม | ไม่สร้างรายการซ้ำ | Not Run |
| TC-005 | Unauthorized Access | technician เปิดงานคนอื่น | ตอบ 403/ไม่แสดงข้อมูล | Not Run |
| TC-006 | Technician Assignment | supervisor authenticated | assignee และ history ถูกบันทึก | Not Run |
| TC-007 | Status Transition | งานอยู่ In Progress | transition ผิดกฎถูกปฏิเสธ | Not Run |
| TC-008 | Photo Upload | private bucket พร้อม policy | บันทึก metadata และ object path | Not Run |
| TC-009 | Invalid File Type | upload executable | ถูกปฏิเสธ | Not Run |
| TC-010 | File Size Exceeded | file ใหญ่เกิน limit | แจ้ง error และไม่เก็บไฟล์ | Not Run |
| TC-011 | Search | มีข้อมูลหลายหน้า | filter และ pagination ถูกต้อง | Not Run |
| TC-012 | RLS | user ต่าง role | เห็นเฉพาะแถวตาม policy | Not Run |
| TC-013 | API Authentication | token หมดอายุ | ตอบ 401 และไม่เขียนข้อมูล | Not Run |
| TC-014 | Network Failure | ตัด network ระหว่าง submit | retry/idempotency ป้องกันซ้ำ | Not Run |
| TC-015 | SLA Calculation | priority มี SLA | due_at คำนวณตาม business rule | Not Run |
| TC-016 | Work Order Closure | มีผลตรวจรับ | ปิดงานได้และบันทึก closed_at | Not Run |
| TC-017 | Power BI Refresh | reporting view พร้อม | refresh สำเร็จและยอดตรงฐานข้อมูล | Not Run |
| TC-018 | Backup Restore | มี backup snapshot | restore ได้และตรวจ row count | Not Run |
