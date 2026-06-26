import { defineConfig } from 'astro/config';

// Static funnel LP — served from Vercel CDN (TTFB baixíssimo).
// Directory format = barra no final nas rotas.
export default defineConfig({
  output: 'static',
  build: { format: 'directory', inlineStylesheets: 'auto' },
  compressHTML: true,
  // slug antigo da 497 -> novo (/metodo). 297 = /aula (e / na raiz).
  redirects: {
    '/aula-497': '/metodo',
  },
});
