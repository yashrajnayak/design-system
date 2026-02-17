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

## Using this in future projects

1. Install the package:

```bash
npm install yashrajnayak-design-system
```

2. Load required fonts once in your app shell (`index.html`, `app/layout.tsx`, etc.):

```html
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">
```

3. Import the design system stylesheet once near app startup:

```js
import 'yashrajnayak-design-system/dist/yashrajnayak-design-system.css';
```

4. Use `ys-` classes for components and utilities, and use `--ys-*` variables for custom styles.

5. Use theme switching by setting `data-theme` on `<html>`:

```js
document.documentElement.setAttribute('data-theme', 'dark');
```

## Migrating existing projects to this design system

Use an incremental migration, not a full rewrite.

1. Install and import the design system, while keeping your current CSS.
2. Start migrating shared primitives first: buttons, cards, headings/text styles, and spacing/layout wrappers.
3. Migrate one screen/section at a time to reduce regressions.
4. Remove old component CSS only after that section visually matches and passes smoke checks.

If your app has old token names, add a temporary bridge in your app CSS:

```css
:root {
  --old-primary: var(--ys-color-primary);
  --old-surface: var(--ys-color-surface);
  --old-text: var(--ys-color-text);
}
```

## Updating all apps when the design system changes

### Release workflow for this repo

1. Update design system code.
2. Bump version in `package.json` (`patch`, `minor`, or `major`).
3. Build and publish:

```bash
npm run build
npm publish --access public
```

### Consumer app strategy

1. Pin a compatible major version in each app, for example:

```json
"dependencies": {
  "yashrajnayak-design-system": "^1.2.0"
}
```

2. Enable dependency update PRs (Dependabot or Renovate) in every app repo so each new release opens an update PR automatically.

Sample Dependabot config:

```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
    open-pull-requests-limit: 10
```

3. Merge update PRs after a quick visual smoke test.

### Manual multi-repo update (optional)

If you want to update local repos in bulk:

```bash
for repo in ~/Documents/GitHub/*; do
  if [ -f "$repo/package.json" ] && rg -q "\"yashrajnayak-design-system\"" "$repo/package.json"; then
    (cd "$repo" && npm install yashrajnayak-design-system@latest)
  fi
done
```

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
