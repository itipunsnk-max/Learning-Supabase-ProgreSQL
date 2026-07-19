# Architecture Comparison

| เกณฑ์ | A: Power Apps + SharePoint | B: Power Apps + Supabase | C: Custom App + Supabase + Power BI |
| --- | --- | --- | --- |
| เริ่มต้น | ง่ายที่สุด | ปานกลาง | ยากกว่า |
| พัฒนาเร็ว | สูง | สูง | ปานกลาง |
| ค่าใช้จ่าย | license Microsoft | license + backend | ทีมพัฒนา + backend |
| Scalability | ปานกลาง | สูง | สูงมาก |
| Security | Microsoft governance | ต้องออกแบบ RLS/API | ควบคุมได้ละเอียด |
| Offline | Power Apps pattern | ต้องออกแบบเอง | ออกแบบเองได้เต็มที่ |
| File management | Document Library | Storage policy | Storage policy + custom UX |
| Reporting | Power BI ง่าย | Power BI ผ่าน view | ยืดหยุ่นที่สุด |
| Vendor lock-in | สูง | ปานกลาง | ต่ำกว่า |
| Maintenance | ต่ำในช่วงแรก | ปานกลาง | สูง |
| จำนวนผู้ใช้ | ทีม/แผนก | แผนก/หลาย site | Enterprise |

**คำแนะนำ:** Prototype ใช้ A, Department-Level ใช้ B, Enterprise และ UX เฉพาะทางใช้ C; โครงการนี้ใช้ B เป็นเส้นทางเรียนรู้หลักเพราะสมดุลระหว่างการเริ่มเร็วกับการเรียนรู้ backend จริง
