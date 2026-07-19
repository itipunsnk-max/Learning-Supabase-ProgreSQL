# Week 8 Troubleshooting

## Integration Diagnosis

แยกตรวจ Power Apps input, Flow trigger/action, connector request, API response และ Supabase RLS ทีละชั้น ใช้ correlation/request ID เชื่อม log และอย่าเผย token ใน screenshot

## Environment Management

หาก Dev ใช้ได้แต่ Test/Prod ไม่ได้ ให้ตรวจ environment variable, connection reference, API base URL, auth audience และ solution import configuration ก่อนแก้สูตรใน App

## Security

Power Apps ไม่ควรเรียก privileged endpoint โดยตรง หาก operation ต้อง service role ให้ทำ server-side function/proxy ที่ตรวจ user authorization และ input อย่างละเอียด
