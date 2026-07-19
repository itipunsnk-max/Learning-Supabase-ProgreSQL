# SLA Expression Design

คำนวณ `due_at` จาก `reported_at` และ priority ใน Flow หรือ backend โดยเก็บ timezone เป็น UTC; เมื่อถึง threshold ให้แจ้งเตือน Supervisor และไม่อัปเดต due date เงียบ ๆ โดยไม่มี audit event
