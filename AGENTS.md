# PROJECT KNOWLEDGE BASE

## OVERVIEW

Static GitHub Pages site: standalone HTML pages with shared CSS/JavaScript, Markdown content rendered in the browser, and a Tectonic-built LaTeX CV.

## STRUCTURE

```text
./
├── index.html             # Homepage and CV; embeds main/ai_competitions.md
├── main/                  # Shared styles/script and competition content
├── ditto/                 # DITTO project page and page media
├── sdf-diffusion/         # SDF-Diffusion project page and page media
├── cv/                    # LaTeX CV source and compile script
├── assets/                # Published/current and dated CV/portfolio PDFs, other media
├── images/                # Logos and profile images
└── contactgen/            # Project image asset
```

## WHERE TO LOOK

| Task | Location | Notes |
|---|---|---|
| Homepage, publications, CV link | `index.html` | CV link should use the latest generated `assets/CV_YYMMDD.pdf`. |
| CV content and publishing build | `cv/main.tex`, `cv/compile.sh` | Source of truth and build workflow below. |
| DITTO page | `ditto/index.html` | Imports shared files from `main/`. |
| SDF-Diffusion page | `sdf-diffusion/index.html` | Standalone page. |
| Shared video behavior/styles | `main/basic_script.js`, `main/basic_style.css` | Used by the DITTO page. |
| Homepage competition section | `main/ai_competitions.md` | Loaded by `zero-md` in the browser. |
| Images and historical documents | `assets/`, `images/`, page `img/` dirs | Static media; no code guidance is needed in these dirs. |

## CODE MAP

| Symbol / entry | Type | Location | References / role |
|---|---|---|---|
| Homepage | HTML entry | `index.html` | Links to local SDF-Diffusion page; renders competition Markdown with `zero-md`. |
| DITTO page | HTML entry | `ditto/index.html` | Loads shared `basic_script.js` and `basic_style.css`. |
| SDF-Diffusion page | HTML entry | `sdf-diffusion/index.html` | Independent project page. |
| `DOMContentLoaded` handler | Event callback | `main/basic_script.js` | Finds video/container/text by ID; video `loadeddata` removes loading state and reveals text. |
| CV build | Shell script | `cv/compile.sh` | Runs Tectonic on `cv/main.tex`, copies the PDF to `assets/CV_YYMMDD.pdf`, and updates `index.html`. |

Call/reference centrality is unmeasured: this environment has no LSP or ast-grep tooling; the map is based on file and markup references.

## CONVENTIONS

- This is a static site; no package manager, site build, test suite, or CI workflow is configured.
- Keep project pages standalone unless they already use shared files from `main/`.
- CV PDF filenames use the KST build date as `assets/CV_YYMMDD.pdf`; `index.html` links to the latest generated file.

## COMMANDS

```bash
./cv/compile.sh  # Requires tectonic and python3; builds cv/build/main.pdf, publishes the dated PDF, and updates index.html
```

## CV WORKFLOW

- `cv/main.tex` is the CV source of truth. Keep its source and build script in `cv/`.
- Keep `cv/build/` out of Git; it is ignored by `.gitignore`.
- Publish an updated CV by compiling and committing the generated `assets/CV_YYMMDD.pdf` and updated `index.html`. A rebuild on the same KST date replaces that date's PDF.
- After CV edits, run `./cv/compile.sh` and confirm the dated PDF exists and `index.html` links to that exact file.

## NOTES

- GitHub Pages serves files from this repository directly; there is no separate deployment command in the repository.
- `main/basic_script.js` assumes the DITTO page contains `videoElement`, `videoContainer`, and `textContent` elements.
