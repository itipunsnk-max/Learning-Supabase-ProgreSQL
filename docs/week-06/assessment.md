# Week 6 Assessment

## Knowledge Check / Quiz 10 ข้อ

1. Public และ Private bucket ใช้ต่างกันอย่างไร
2. Object path ควรออกแบบอย่างไร
3. Signed URL ควรมีอายุเท่าใดและเพราะอะไร
4. ทำไมต้องเก็บ metadata แยกจาก object
5. MIME/size validation ต้องทำที่ใดบ้าง
6. Orphan object คืออะไร
7. Retry upload ต้องป้องกัน duplicate อย่างไร
8. EXIF metadata มีความเสี่ยงอะไร
9. ทำไมไม่ควร overwrite รูปหลักฐานเดิม
10. Storage RLS และ database RLS เกี่ยวข้องกันอย่างไร

## Lab Checklist

- [ ] Bucket policy
- [ ] Metadata schema
- [ ] Upload validation
- [ ] Signed URL
- [ ] Before/During/After
- [ ] Offline queue
- [ ] Retry/idempotency
- [ ] Orphan cleanup

## Self-Assessment

ให้คะแนน 1–5 ในหัวข้อ Storage Design, File Validation, Signed URL, RLS, Mobile Upload, Offline Retry และ Privacy พร้อมแนบ policy/test evidence

## Review Questions

อธิบายเหตุการณ์ที่ upload สำเร็จแต่ metadata insert ล้มเหลว และออกแบบวิธีไม่ให้ Storage มี object ที่ไม่มีเจ้าของ

## Practical Assignment

ส่ง storage architecture, metadata schema, policy SQL, upload test matrix, signed URL evidence และ privacy note สำหรับ EXIF/location
