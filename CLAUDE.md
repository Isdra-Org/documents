# ISDRA documents

Guides for ISDRA (RaceWorks users, clubs/RGOs, and others), as Markdown + PNG built into PDFs with a shared template.
See `README.md` for the layout and how to add a guide. This repo is **public** (`Isdra-Org/documents`): never commit
passwords, member data, private contact details or anything copied from the private `Isdra-Org/raceworks` repo
beyond what a guide needs. Local machine details are in `CLAUDE.local.md` (git-ignored).

## Writing

- US English (behavior, organization, grayed, color), lowercase **internet**.
- **RaceWorks** (capital W) in prose. Quote real paths and file names exactly.
- Guides speak for ISDRA in the "we" voice where it fits; plain, friendly, no blame.
- Say **DTCC** for a class's Division / Type / Class / Category once it has been explained.
- The race groups are **All Breed**, **Registered Breed** and **Sportsman**. Always "Sportsman", never the shortening
  "Sport", which crept in somewhere and causes confusion (John, 2026-10-08).
- Results and questions about them go to John K. Gates, **Data and Technology Manager** (john.gates@isdra.org), not
  the Executive Director (the sanctioning rules' wording is outdated). A forwarding address **results@isdra.org** is
  planned; switch the guides to it once it works (documents#2).
- Draft aids (`::: placeholder`, `[...]{.todo}`) and "DRAFT" in the `date` must be gone before a guide is published.

## RaceWorks guides and RaceWorks versions

RaceWorks is maintained in the private repo `Isdra-Org/raceworks`. Guides about RaceWorks state the RaceWorks version
they describe (e.g. "For RaceWorks 2026.1"). A RaceWorks change that alters what users see is labeled `docs-impact`
there and linked to an issue here (`Isdra-Org/documents#N`). At each RaceWorks release, every RaceWorks guide is checked
against it.

## Building

Build on the Linux build host with the guide's `build-pdf.sh`, then check the PDF (pages, fonts with `pdffonts`).
Commit the PDF with the source. Push policy: commit and push routine changes yourself; ask before creating releases
or issues.

Commits: author John K. Gates `<john.gates@isdra.org>` (set in this repo's local git config), ending with
`Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>`.
