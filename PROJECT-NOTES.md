# Build notes — LP A Escola de Exatas (aula-organico) → Astro

Source snapshot: `aescoladeexatas.com_aula_organico/` (WordPress/Elementor). Rebuild as static Astro per `LP-PERFORMANCE-PLAYBOOK.md`. NOT to reuse any Elementor/WP code.

## VSL (vturb / converteai)
- account:  `1f136267-6fae-424a-a2af-6f55173425e6`
- playerId: `6a34302812f7f3bd325e59fb`  (element id uses prefix `vid-`; player.js URL uses PURE id — strip `vid-`)
- videoId:  `699e849644f8b87400f520e2`
- player.js: `scripts.converteai.net/1f136267-6fae-424a-a2af-6f55173425e6/players/6a34302812f7f3bd325e59fb/v4/player.js`
- m3u8:      `cdn.converteai.net/1f136267-6fae-424a-a2af-6f55173425e6/699e849644f8b87400f520e2/main.m3u8`
- poster asset in snapshot: `assets/16e11e754d2b1756_6a086c42ec2fa2d055ed1ee5.png` (375×666, 9:16). Local 720p .ts segments available for a sharper ffmpeg frame.

## Checkout (Hotmart)
- ACESSO VITALÍCIO (R$497): `https://pay.hotmart.com/Q41076039H?off=06eyzllb`
- 01 ANO (R$397):          `https://pay.hotmart.com/Y61684441H?off=pcmwmexe`
- CTAs "QUERO DOMINAR..." anchor to `#valor` (pricing section).

## Tracking
- Meta Pixel: `276768947070475` (PixelYourSite in original; use raw fbq).
- utmify UTMs: `https://cdn.utmify.com.br/scripts/utms/latest.js` (async, data-utmify-prevent-subids).
- No GTM / GA4 in original.
- WhatsApp contact (joinchat): +55 81 98869 3714.

## Design tokens
- Fonts: **Work Sans** (body/headings, 400/500/600/700), **Bebas Neue** (big prices). Self-host woff2 (Google Fonts).
- Colors: bg `#000` / `#141414` / `#303030`; text cream `#F6F5F2`, muted `#888`; accent yellow `#FFBF00`; alt yellow `#FFC825`; soft yellow box `#FFEFC9`; blue `#02007B` (pricing section + R$497); orange CTA band `#E78900`.
- CTA button: bg `#FFBF00`, radius 5px, padding 20px 40px, weight 700, color #000, letter-spacing -0.2px, no shadow.
- Pricing card: white, radius 15px, padding 20px, shadow `rgba(255,191,0,.74) 0 0 54px` (yellow glow).
- Title: "Assinatura - A Escola de Exatas - Concurso Público".

## Section order (top→bottom)
1. VSL (facade tap-to-play) — hero, top.
2. Bio "Guilherme Neves" (photo BIO-768x985 + 3 paras + 4 achievement bullets) — bg #141414 w/ bg-1.jpg texture.
3. "O resultado que só o nosso método entrega..." (h1) + approvals list (~50 names: 1º–10º lugar) — black.
4. "Veja como nossos alunos transformaram **Exatas em diferencial:**" + testimonial print carousel (imgs 30–52).
5. CTA "QUERO DOMINAR EXATAS AGORA" → #valor.
6. "Esse curso é para você que…" — 6 icon+text cards (icons 7,8,9,11,10,12).
7. Sales letter "Olá, tudo bem?…" (long copy block).
8. CTA "QUERO APRENDER COM ESSE MÉTODO".
9. "Na assinatura você tem **acesso imediato** a:" — product carousel (imgs 5–13 -768x1024.png).
10. "Para acelerar… **leva bônus exclusivos!**" + 4 bonus imgs (1-1,3,2-2,4) + CTA.
11. "Como funciona na prática:" — 5 steps (icons 2,3,4,5,6 + h3 each).
12. "Imagine chegar na prova… **Você acerta onde a maioria erra**." + banner (Sem-Titulo-1-1024x501) + testimonial carousel 2 (imgs 2–25).
13. "Veja tudo o que você ganha ao se **matricular hoje!**" — value stack (10 itens c/ preços riscados, total >R$3.670).
14. **#valor** pricing — blue #02007B bg, 2 white cards: ACESSO VITALÍCIO R$497 (MELHOR OPÇÃO, blue price) → Q41076039H; 01 ANO R$397 (black price) → Y61684441H. Each: logo, badge, "12X DE R$…", CTA, compra-segura.svg.
15. "Essa é a sua chance de **aprender Exatas de verdade.**" — comparison: yellow #FFBF00 "Com o método exclusivo da Escola de Exatas:" (5 ✓) vs dark "Com os métodos tradicionais:" (5 ✗).
16. Orange #E78900 CTA band (img 1-300x300) + "QUERO DOMINAR EXATAS AGORA".
17. "**Atenção:** essa condição especial…" + CTA.
18. "PERGUNTAS **FREQUENTES**" — FAQ accordion (10 Q/A).
19. Final CTA "Chegou a hora…" + "SIM, QUERO DOMINAR EXATAS…" → #valor.
20. Footer (remove WP "plugins premium WordPress" credit).

Remove: Elementor/WP credit link to full.services.

## Decisões do build (2026-06-26)
- **Sem gate** (reproduz a organica): conteúdo/preço visíveis desde o load. Facade tap-to-play mantido.
- **Tracking eager**: Meta Pixel `276768947070475` dispara `PageView` no load (`<head>`), + utmify async. Prioriza connect rate (nota lab cai p/ ~88-93). Para voltar a diferido, mover o snippet do Pixel p/ carregar no 1º gesto.
- Carrosséis (3): UM item grande por vez + setas + swipe (fiel ao original swiper). Componente `src/components/Carousel.astro`. Imagens lazy.
- `coin-exatas.webp` (icons-a-escola-de-exatas) = divisor **"VS"** do comparativo (não é moeda).
- Só 1 imagem eager: `poster-vsl.webp` (LCP, preload fetchpriority=high). Outras 80 lazy.

## ⚠️ A CONFIRMAR com o cliente
- **Parcelas**: "12x de R$ 51" (Vitalício R$497, do print original) e "12x de R$ 41" (Anual R$397, **calculado** ~fator Hotmart). Conferir os valores reais no checkout Hotmart e ajustar em `src/pages/index.astro` (`price-card__inst`).
- Pixel: confirmar se quer eventos extras (ViewContent/InitiateCheckout) além de PageView. Hoje há um `VSLPlay` (trackCustom) no toque do vídeo.

## Rodar / build
- `npm run dev` (dev) · `npm run build` → `dist/` · `npm run preview`
- Reconverter imagens: `bash scripts/convert-assets.sh` (lê do snapshot).
- Deploy: Vercel (Astro estático, output `dist`). `vercel.json` já com cache-control de assets/fonts.
