# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

This is the website for **LogNiti Lab** (Dr. Anmol Pahwa's research group, Civil Engineering, IIT Madras), built on the [al-folio](https://github.com/alshedivat/al-folio) Jekyll theme. It's a static site: Ruby/Jekyll generates HTML from Markdown/Liquid templates, BibTeX bibliographies, and YAML data, deployed to GitHub Pages via GitHub Actions.

## Commands

### Local development (Docker — recommended)

```bash
docker compose pull
docker compose up          # site at http://localhost:8080, live-reloads on change
docker compose up --build  # rebuild the image (e.g. after Gemfile changes)
```

Use `docker-compose-slim.yml` for the smaller (<100MB) image: `docker compose -f docker-compose-slim.yml up`.

### Local development (native Ruby, legacy)

```bash
bundle install
pip install jupyter
bundle exec jekyll serve --lsi   # site at http://localhost:4000
```

`_config.yml` changes require a restart of `jekyll serve` (not hot-reloaded).

### Build

```bash
bundle exec jekyll build --lsi          # outputs static site to _site/
JEKYLL_ENV=production bundle exec jekyll build --lsi   # production build (used in CI)
npm install -g purgecss && purgecss -c purgecss.config.js   # strip unused CSS from _site/assets/css
```

### Formatting / linting (enforced in CI, no test suite)

```bash
npm install --save-dev --save-exact prettier @shopify/prettier-plugin-liquid
npx prettier . --check     # what CI runs (.github/workflows/prettier.yml)
npx prettier . --write     # fix formatting
```

Prettier config (`.prettierrc`): the Liquid plugin, `printWidth: 150`. Excluded paths are in `.prettierignore` (minified assets, generated plotly HTML, `_pages/timeline.html`).

There is no unit/integration test framework in this repo. CI quality gates are: Prettier formatting, a broken-link checker (lychee, `.github/workflows/broken-links*.yml`), and a manual/optional Axe accessibility check (`.github/workflows/axe.yml`).

### Deployment

Pushing to `master` triggers `.github/workflows/deploy.yml`, which builds the site (`jekyll build --lsi`), purges unused CSS, and force-pushes the result to the `gh-pages` branch, which GitHub Pages serves. Only paths matching content/site directories trigger a deploy (see the `paths:` filter in that workflow) — pure docs changes (README, INSTALL.md, etc.) do not redeploy the site. There's also a manual `bin/deploy` script for deploying to a non-GitHub-Pages host or a separate deploy repo.

## Architecture

### Content model: Markdown/YAML/BibTeX in, static HTML out

Jekyll assembles pages from several content sources, not just `_pages/`:

- **`_pages/*.md`** — top-level site pages, each with front matter selecting a `layout` (`page`, `about`, `distill`, `profiles`, `archive-*`, etc.) and its own permalink/nav settings.
- **`_bibliography/*.bib`** — BibTeX files rendered via `jekyll-scholar`. There are three: `publications.bib`, `presentations.bib`, `projects.bib`. Each is rendered on its own page via `{% bibliography --file <name> %}` (see `_pages/publications.md`, `presentations.md`, `projects.md`) using the `bib` layout (`_layouts/bib.liquid`). BibTeX entries support custom fields (`pdf`, `slides`, `poster`, `abstract`, `code`, `website`, `arxiv`, `doi`, `abbr`, etc.) that render as buttons/badges — see `CUSTOMIZE.md` for the full field list.
- **Jekyll collections** (`_news/`, `_teachings/`, defined under `collections:` in `_config.yml`) — `_news` entries surface as announcements on the home page; `_teachings/*.md` (`ce2060.md`, `ce5540.md`, etc.) use `layout: course` and hold course/teaching content, rendered on `/teaching/` by `_pages/teaching.md` via `{% include courses.liquid %}` (groups `site.teachings` by `year`) — this is _not_ the research-projects list (that's `projects.bib` above, rendered on `/projects/`). Don't confuse the two when adding content.
- **`_data/*.yml`** — structured data: `members.yml` (lab members/people), `coauthors.yml`, `repositories.yml` (GitHub users/repos shown on `/repositories/`), `venues.yml` (publication venue abbreviation → link mapping used by the `abbr` bib field), and CV data (`cv.yml`, used as a fallback when `assets/json/resume.json` is absent).
- **`_layouts/`** / **`_includes/`** — Liquid templates and reusable partials (`_includes/scripts/`, `_includes/repository/` for GitHub stats widgets, etc.).
- **`_plugins/*.rb`** — small custom Jekyll plugins (Google Scholar citation counts, external-post aggregation, cache-busting, accent stripping for slugs, etc.) — read these before assuming a piece of templating behavior is theme-standard.
- **`_sass/`** — SCSS split into `_base`, `_layout`, `_cv`, `_distill`, `_themes` (color variables — the site's global theme color lives in `_themes.scss`), `_variables`.

### Configuration

`_config.yml` is the single source of truth for almost all site behavior: navigation, social links, Jekyll Scholar bibliography settings, collections, announcements/latest-posts widgets, analytics, feature toggles (Open Graph, giscus/disqus comments, related posts, etc.). It is heavily commented — check it before assuming a feature needs code changes rather than a config flag. `url`/`baseurl` must stay correct for links to resolve (root site: `baseurl` blank but present, not deleted).

### Assets

Static assets (images, PDFs, JSON resume) live under `assets/`. PDFs referenced by bib entries (`pdf`, `slides`, `poster`, `supp` fields) are expected under `assets/pdf/` unless a full URL is given.
