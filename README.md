# ISDRA documents

Documents of the International Sled Dog Racing Association (ISDRA):

- **Guides** for RaceWorks users, for clubs and race-giving organizations (RGOs), and for anyone else involved in
  ISDRA racing. Each guide is written in Markdown and built into a PDF with a shared ISDRA look.
- **Official documents**: the constitution, race rules, sanctioning requirements, programs, policies and forms, with
  their earlier versions in the history (`git log` on a document's folder). They're in `governance/`, `rules/`,
  `sanctioning/`, `programs/`, `policies/`, `proposals/`, `forms/` and `reference/`; `docs/inventory.md` lists them all.

The official documents on [isdra.org](https://isdra.org) are the versions in force. Changes to them follow ISDRA's
approval process; until a change is adopted, it's only a draft here.

## Guides

| Guide | For | Status |
|---|---|---|
| [Configuring Excel for RaceWorks](guides/Configuring%20Excel%20for%20RaceWorks/Configuring%20Excel%20for%20RaceWorks.pdf) | RaceWorks users: one-time Excel setup | Version 2026-10-08, for RaceWorks 2026.1 |
| [Submitting Race Results to ISDRA](guides/Submitting%20Race%20Results%20to%20ISDRA/Submitting%20Race%20Results%20to%20ISDRA.pdf) | Clubs and RGOs, after a sanctioned race | Version 2026-10-08 |

RaceWorks itself is maintained separately. Guides about RaceWorks say which RaceWorks version they describe.

## Layout

```
template/                  shared look (guides now, official documents in phase 2): guide.css, isdra-logo.svg, fonts/ (Poppins, SIL OFL), build-guide.sh
guides/<Guide name>/
        <Guide name>.md    the source - edit this
        <Guide name>.pdf   the built guide (committed, so every published version stays in the history)
        *.png              screenshots, if any
        guide-extra.css    optional: style rules for this guide only, loaded after template/guide.css
        build-pdf.sh       builds this guide with the template
```

## Building a guide

Guides are built on Linux. Each guide's `build-pdf.sh` calls `template/build-guide.sh`, which runs Pandoc to turn
the Markdown into HTML with `template/guide.css` (plus the guide's `guide-extra.css`, if any) and the screenshots
embedded, and WeasyPrint to turn that into the PDF.

```bash
bash "guides/Submitting Race Results to ISDRA/build-pdf.sh"
```

### Requirements

| Needed for | What | Fedora package | Tested with |
|---|---|---|---|
| Markdown to HTML | Pandoc | `pandoc-cli` | 3.7.0.2 |
| HTML to PDF | WeasyPrint | `weasyprint` | 69.0 |
| Headings | Oswald (Medium) | `vernnobile-oswald-fonts` | 4.101 |
| Code, paths, condensed fallback | DejaVu Sans Mono, DejaVu Sans (Condensed) | `dejavu-sans-mono-fonts`, `dejavu-sans-fonts` | 2.37 |
| Body text | Poppins | none: included in `template/fonts/` | |
| Checking a PDF (optional) | `pdfinfo`, `pdffonts`, `pdftotext`, `pdfimages` | `poppler-utils` | 26.01 |
| Running the scripts | Bash, coreutils (`readlink -f`) | (standard) | |

Tested on Fedora 44. To set up a Fedora machine:

```bash
sudo dnf install pandoc-cli weasyprint vernnobile-oswald-fonts dejavu-sans-mono-fonts dejavu-sans-fonts poppler-utils
```

If a font is missing, WeasyPrint quietly uses a fallback (`guide.css` lists one for each font), so the PDF builds but
looks wrong. After a build, `pdffonts <file>.pdf` should list Oswald-Medium and Poppins (and DejaVu Sans Mono if the
guide has code or paths).

## Adding a guide

1. Create a folder under `guides/` named after the guide, with `<Guide name>.md` in it. Start the file with the same front matter as
   the other guides (`title`, `subtitle`, `date`, `lang: en-US`).
2. Copy `build-pdf.sh` from another guide and change the name in its comments.
3. Draft aids, which show up clearly in the PDF until removed: `::: placeholder` ... `:::` for a screenshot still to
   be captured, and `[text]{.todo}` for something still to be decided. Call-out boxes: `::: note` and `::: warning`.

## License

The Poppins font files are under the SIL Open Font License (`template/fonts/OFL.txt`). The ISDRA logo is ISDRA's.
