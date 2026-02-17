# Yash Design System

Reusable design system extracted from [`yashrajnayak.github.io`](https://github.com/yashrajnayak/yashrajnayak.github.io), packaged as a standalone repo so you can reuse the same visual language across future projects.

## What this includes

- Design tokens (color, typography, spacing, radius, shadows, motion)
- Dark mode support via `data-theme="dark"`
- Reusable CSS components (cards, glass cards, buttons, pills, badges, lists, accordion, layout helpers)
- Utility classes for spacing, stacks, text, and flex clusters
- Demo documentation site in `docs/`

## Project structure

```
design-system/
  src/
    tokens.css
    base.css
    animations.css
    components.css
    utilities.css
    themes.css
    index.css
  dist/
    yashrajnayak-design-system.css
    yashrajnayak-design-system.min.css
  docs/
    index.html
    docs.css
    docs.js
  scripts/
    build.sh
```

## Quick start

```bash
npm run build
npm run dev
```

- Build output: `dist/yashrajnayak-design-system.css`
- Docs preview: `http://localhost:4173`

## Use in another project

### Option 1: copy CSS directly

```html
<link rel="stylesheet" href="/path/to/yashrajnayak-design-system.css">
```

### Option 2: install from npm (after publish)

```bash
npm install yashrajnayak-design-system
```

```js
import 'yashrajnayak-design-system/dist/yashrajnayak-design-system.css';
```

## Required fonts

```html
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">
```

## Theme toggle pattern

Set theme by changing the `data-theme` attribute on `<html>`:

```js
document.documentElement.setAttribute('data-theme', 'dark');
```

Supported values:

- `light` (default)
- `dark`

## Publish as a GitHub repo

```bash
git remote add origin git@github.com:yashrajnayak/design-system.git
git branch -M main
git add .
git commit -m "Initial design system"
git push -u origin main
```

## Publish to npm

Before publishing, ensure the package name in `package.json` is available.

```bash
npm login
npm publish --access public
```

## Versioning recommendation

- `patch`: small non-breaking fixes
- `minor`: new components or utility classes
- `major`: breaking token or class name changes
