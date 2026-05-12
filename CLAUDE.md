# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development

No build step. Open `index.html` directly in a browser, or serve it with any static file server:

```bash
python3 -m http.server 8080
# or
npx serve .
```

## Architecture

Pure vanilla HTML/CSS/JS — no frameworks, no bundler, no dependencies beyond Google Fonts (loaded via CDN).

**`index.html`** — single-page document with six sections in order: `#hero`, `#about`, `#skills`, `#projects`, `#contact`, footer. All content is edited here directly.

**`style.css`** — all styling. Design tokens are CSS custom properties on `:root` (colors, radius, nav height, transition easing). The accent gradient (`--accent` → `--accent2`) is reused across multiple elements via `background: linear-gradient(...)` with `-webkit-background-clip: text`. Sections alternate between `--bg` and `--bg-card` backgrounds to create visual separation without borders.

**`script.js`** — three behaviours wired up at page load:
- Nav becomes frosted-glass on scroll (adds `.scrolled` class).
- Mobile hamburger toggles `.open` on `.nav-links`.
- `IntersectionObserver` adds `.reveal` → `.visible` for scroll-in animations on section children, and a second observer highlights the active nav link.

## Content editing guide

- **Personal info** (name, email, title, bio): `index.html` — hero and contact sections.
- **Avatar photo**: replace `<span>SA</span>` inside `.avatar` with `<img src="avatar.jpg" alt="Stéphane Albert" />`.
- **Skill tags**: add/remove `<span class="tag">` inside the relevant `.skill-group` in `#skills`.
- **Project cards**: duplicate an `<article class="project-card">` block inside `.projects-grid`. Each card expects `.project-header` (icon + links), `.project-title`, `.project-desc`, and `.project-tags`.
- **Social links**: `#contact` — update `href` on the three `<a>` elements (GitHub, LinkedIn, X).
- **Floating badges** in the hero: `.badge-1` and `.badge-2` inside `.hero-visual`.
- **Color scheme**: change `--accent` and `--accent2` in `:root` to retheme the entire site.
