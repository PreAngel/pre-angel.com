# Agent Protocol for PreAngel.github.io

## 1. System Context
- **Type**: Jekyll Static Site.
- **Source**: `docs/` directory.
- **Config**: `docs/_config.yml`.

## 2. Content Generation Rules

### Blog Posts (`docs/_posts/`)
- **Filename**: `YYYY-MM-DD-slug.md` (e.g., `2025-10-24-ai-platform.md`).
- **Front Matter**:
  ```yaml
  ---
  title: "Title"
  description: "Short summary"
  author: author-slug  # Must match `docs/_peoples/author-slug.md`
  tags: [tag1, tag2]
  image: assets/YYYY/MM-slug/cover.webp
  ---
  ```

### Assets (`docs/assets/`)
- **Strict Hierarchy**: `docs/assets/{YYYY}/{MM-slug}/`.
  - `{YYYY}`: Year of the post.
  - `{MM-slug}`: Month and slug matching the post filename.
  - **Example**:
    - Post: `2025-10-24-my-post.md`
    - Asset Dir: `docs/assets/2025/10-my-post/`
- **Format**: **WebP ONLY** (`.webp`).
- **Constraints**:
  - Max Size: **2MB**.
  - Max Width: **1920px**.
- **Action**: Use `./scripts/fit-image.sh` to resize if necessary.

### People (`docs/_peoples/`)
- **Filename**: `firstname-lastname.md`.
- **Required**: `name`, `avatar`, `bio`, `site`.

## 3. Validation Protocol
- **Command**: `npm test`
- **Checks**:
  - Linting (Markdown, filenames).
  - Image size/dimensions.
  - Unit tests.
- **Pre-Commit**: Ensure `npm test` passes.
