import { rm } from 'node:fs/promises'

await rm('docs/.vitepress/dist', { recursive: true, force: true })
console.log('Removed docs/.vitepress/dist')
