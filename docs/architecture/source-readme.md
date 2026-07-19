# Source README Alignment

เอกสารนี้บันทึกว่าโครงการปัจจุบันอ้างอิง requirement จาก repository ต้นทาง:

`https://github.com/itipunsnk-max/Learning-Supabase-ProgreSQL`

## เกณฑ์ที่ใช้ในการทำงาน

- ภาษาไทยเป็นหลักและมีศัพท์เทคนิคภาษาอังกฤษกำกับ
- ใช้ 8 Phase ภายใน 12 สัปดาห์
- ทุก Phase ต้องมี Learning Objectives, Concepts, Hands-on Exercise, Mini Project, Architecture, Real-world Example และ Estimated Hours
- Documentation site ต้องรองรับ local, search, sidebar, TOC, Mermaid, responsive และ static deployment
- ทุกไฟล์ต้องมีเนื้อหาใช้งานได้จริง ไม่สร้างเพียงหัวข้อเปล่า
- สร้างเนื้อหาเป็น Batch ต่อสัปดาห์ แล้วตรวจ build, links, Mermaid และ security ก่อนเริ่ม Batch ถัดไป

## Architecture ที่ใช้ในหลักสูตร

เริ่มจาก Power Apps + SharePoint + Power Automate เพื่อให้ผู้เรียนเห็น workflow เร็ว จากนั้นย้าย core data ไป PostgreSQL/Supabase พร้อม Auth, RLS, Storage และ API โดยใช้ Power Automate หรือ controlled API เป็น integration boundary เมื่อจำเป็น
