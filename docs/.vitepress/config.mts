import { defineConfig } from 'vitepress'
import { withMermaid } from 'vitepress-plugin-mermaid'

const base = process.env.DOCS_BASE || '/'

const weeks = [
  ['Week 1', 'CMMS และ Power Platform'],
  ['Week 2', 'Workflow และ Automation'],
  ['Week 3', 'PostgreSQL และ Database Design'],
  ['Week 4', 'SQL และ Performance'],
  ['Week 5', 'Supabase Auth และ RLS'],
  ['Week 6', 'Storage และ Image Management'],
  ['Week 7', 'REST API และ Testing'],
  ['Week 8', 'Power Apps กับ Supabase'],
  ['Week 9', 'Synchronization และ Offline'],
  ['Week 10', 'Production Readiness'],
  ['Week 11', 'Testing และ UAT'],
  ['Week 12', 'Power BI และ Final Project']
] as const

const weekSidebar = Object.fromEntries(weeks.map(([title, topic], index) => {
  const week = String(index + 1).padStart(2, '0')
  return [`/week-${week}/`, [
    { text: 'ทางลัด', items: [
      { text: 'หน้าหลัก', link: '/' },
      { text: 'Roadmap 12 สัปดาห์', link: '/curriculum' }
    ] },
    { text: `${title} — ${topic}`, items: [
      { text: 'บทเรียนหลัก', link: `/week-${week}/` },
      { text: 'Lab / Mini Project', link: `/week-${week}/lab` },
      { text: 'Quiz และ Checklist', link: `/week-${week}/assessment` },
      { text: 'Troubleshooting', link: `/week-${week}/troubleshooting` }
    ] },
    { text: 'ไปสัปดาห์ถัดไป', link: `/week-${String(Math.min(index + 2, 12)).padStart(2, '0')}/` }
  ]]
}))

const defaultSidebar = [
  { text: 'ทางลัด', items: [
    { text: 'หน้าหลัก', link: '/' },
    { text: 'Roadmap 12 สัปดาห์', link: '/curriculum' },
    { text: 'เริ่มต้นใช้งาน', link: '/introduction/' }
  ] },
  { text: 'คู่มือระบบ', items: [
    { text: 'Architecture', link: '/architecture/overview' },
    { text: 'Database', link: '/database/' },
    { text: 'API', link: '/api/' },
    { text: 'Security', link: '/security/' },
    { text: 'Testing', link: '/testing/' },
    { text: 'Use Cases', link: '/use-cases/' }
  ] },
  { text: 'การเผยแพร่และดูแลเอกสาร', items: [
    { text: 'GitHub Pages', link: '/deployment/github-pages' },
    { text: 'GitHub, Netlify และ Vercel', link: '/deployment/github-netlify-vercel' },
    { text: 'วิธีแก้ไขและทำ Batch', link: '/maintenance/editing-batches' },
    { text: 'อ่านแบบ Offline', link: '/deployment/offline' }
  ] }
]

export default withMermaid(defineConfig({
  lang: 'th-TH',
  title: 'CMMS Learning Roadmap',
  description: 'คู่มือพัฒนาระบบ CMMS ด้วย Power Platform, PostgreSQL และ Supabase',
  base,
  cleanUrls: true,
  lastUpdated: true,
  themeConfig: {
    logo: '/logo.svg',
    nav: [
      { text: 'หน้าหลัก', link: '/' },
      { text: 'Roadmap 12 สัปดาห์', link: '/curriculum' },
      { text: 'เริ่มต้นใช้งาน', link: '/introduction/' },
      { text: 'คู่มือ Deploy', link: '/deployment/github-netlify-vercel' }
    ],
    sidebar: { ...weekSidebar, '/': defaultSidebar, '/curriculum': defaultSidebar, '/introduction/': defaultSidebar, '/architecture/': defaultSidebar, '/database/': defaultSidebar, '/api/': defaultSidebar, '/security/': defaultSidebar, '/testing/': defaultSidebar, '/use-cases/': defaultSidebar, '/deployment/': defaultSidebar, '/maintenance/': defaultSidebar },
    outline: [2, 3],
    search: { provider: 'local' },
    socialLinks: [{ icon: 'github', link: 'https://github.com/' }],
    footer: { message: 'CMMS Learning Roadmap', copyright: 'MIT License' }
  },
  markdown: {
    theme: { light: 'github-light', dark: 'github-dark' },
    codeTransform: (code, id) => id.endsWith('.sql') ? code : code
  }
}))
