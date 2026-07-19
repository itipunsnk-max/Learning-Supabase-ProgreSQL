# Netlify และ Vercel

## Netlify

- Import repository จาก GitHub
- Build command: `npm run build`
- Publish directory: `docs/.vitepress/dist`
- ตั้งค่า `DOCS_BASE=/` สำหรับโดเมนหลัก

## Vercel

- Import repository
- Framework preset: VitePress หรือ Other
- Build command: `npm run build`
- Output directory: `docs/.vitepress/dist`
- ตั้งค่า environment variables เฉพาะค่าที่จำเป็น และไม่ใส่ service role key ใน client build
