# อ่านแบบ Offline

หลังรัน `npm run build` ให้เก็บโฟลเดอร์ `docs/.vitepress/dist` ไว้ในเครื่องหรือ OneDrive แล้วเปิดผ่าน local HTTP server:

```powershell
Set-Location $PSScriptRoot
python -m http.server 8080 --directory docs/.vitepress/dist
```

เปิด `http://localhost:8080` ใน browser วิธีนี้ทำให้ search, module และ asset ทำงานได้ดีกว่าเปิด HTML ด้วย `file://` ซึ่งมักติดข้อจำกัดของ browser เรื่อง module, path และ fetch
