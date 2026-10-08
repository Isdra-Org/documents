# ISDRA documents

ISDRA's documents under configuration management: **guides** in `guides\` (RaceWorks users, clubs/RGOs, others;
Markdown + PNG built into PDFs with the shared `template\`) and ISDRA's **official documents** (rules, sanctioning requirements, programs,
policies, the constitution, forms). See `README.md` for the layout and how to add a guide, and `docs/inventory.md`
for every official document, its versions and its file name on the website.

This repo is **public** (`Isdra-Org/documents`): never commit passwords, member data, private contact details or
anything copied from the private `Isdra-Org/raceworks` repo beyond what a guide needs. Local machine details, tools and
standing permissions are in `CLAUDE.local.md` (git-ignored) - read it at the start of a session.

## Working with John

- John K. Gates (ISDRA's Data and Technology Manager) sets the order of work; one loose end at a time.
- At the start of a session: `gh issue list --repo Isdra-Org/documents`, and read `CLAUDE.local.md`.
- Push policy: commit and push routine changes yourself; **ask before creating releases or issues**.
- `main` has a GitHub ruleset, "Protect main" (2026-10-08): no force pushes, no deletion, for everyone including admins.
  Never rewrite pushed history; fix mistakes with a new commit. Pull requests aren't required (yet). Only John and
  Max Friel (the other website developer) have write access; the wiki and Projects are turned off.
- Commits: author John K. Gates `<john.gates@isdra.org>` (set in this repo's local git config), ending with
  `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>`. Run `git pull --rebase` before committing; John
  sometimes edits on GitHub.

## Writing

- US English (behavior, organization, grayed, color), lowercase **internet**.
- **RaceWorks** (capital W) in prose. Quote real paths and file names exactly.
- Guides speak for ISDRA in the "we" voice where it fits; plain, friendly, no blame. **Official documents keep a
  formal voice** (they're rules, not guides).
- Say **DTCC** for a class's Division / Type / Class / Category once it has been explained.
- The race groups are **All Breed**, **Registered Breed** and **Sportsman**. Always "Sportsman", never the shortening
  "Sport", which crept in somewhere and causes confusion (John, 2026-10-08).
- Results and questions about them go to John K. Gates, **Data and Technology Manager** (john.gates@isdra.org), not
  the Executive Director (the sanctioning rules' wording is outdated). A forwarding address **results@isdra.org** is
  planned; switch the guides to it once it works (documents#2).
- Draft aids (`::: placeholder`, `[...]{.todo}`) and "DRAFT" in the `date` must be gone before a guide is published.

## Official documents (agreed with John, 2026-10-08)

- **Layout:** `governance\`, `rules\`, `sanctioning\`, `programs\`, `policies\`, `proposals\`, `forms\`, `reference\`,
  one folder per document, named after the document (e.g. `rules\Dryland Race Rules\`). The file keeps a stable
  name inside it (`Dryland Race Rules.pdf`, plus `.docx` when a Word original exists), so `git log` on the folder
  shows every version. French translations are separate documents (`... (French)`).
- **Phase 1 - import as-is:** each document's PDFs (and Word originals) committed oldest version first, each commit
  dated by the version's printed date, with the original file name and source in the message. Older versions come
  from the legacy site and the website repo.
- **Phase 2 - convert to Markdown, one document at a time,** in an order John decides by stepping through the list
  with you. PDF text extraction loses tables, numbering and structure (the 2026 sanctioning PDF lost items i-iii of
  the sled class list), so check every conversion line by line against the original; prefer a Word original. A
  converted document gets its own build (template + an "official document" style) and keeps the original PDF beside it
  until John accepts the conversion.
- **Changes need approval.** ISDRA has an approval process for these documents (John is confirming who: the board,
  a committee, or both). The version on isdra.org is the one in force. Edits here are **drafts on a branch** until
  adopted; never present a repo edit as the current rule. On adoption: merge, update the printed date, tag
  `<short-name>-YYYY-MM` (e.g. `dryland-rules-2026-07`), and send it to the website (below).
- **Translations:** when an English document changes, open an issue for its French version (speed rules, animal
  welfare). Note that the English speed rules (October 2022) are older than the French (July 2026).
- John is looking for Word originals; when one turns up, add it to that document's folder in its own commit.

## Feeding the website

The website repo is `Isdra-Org/isdra` (maintained in a separate Claude session, "Overall Josiah Website Maintenance
Project"). It serves these documents from `src/assets/documents/<website file>` and lists them in
`src/app/shared/models/documents.ts` (title, `updated` date as shown on the site, path, page lists). When a version
is adopted here:

1. Build or take the PDF, and name it as the website does: a new dated file name is fine (e.g.
   `DrylandRaceRules2027.pdf`); the website keeps old versions in that folder. `docs/inventory.md` has the current
   website file for each document; update it.
2. Don't edit the website repo from this session. Write a short hand-off for the website session (document, new
   file, title, `updated` text, what changed) and give it to John to paste there, or send it if that session is
   reachable.

## RaceWorks guides and RaceWorks versions

RaceWorks is maintained in the private repo `Isdra-Org/raceworks`, in its own Claude session
(`I:\Raceworks\Maintenance Project`). Guides about RaceWorks state the RaceWorks version they describe (e.g. "For
RaceWorks 2026.1"). Issues are the hand-off between the two sessions, in both directions:

- **From RaceWorks:** a RaceWorks change that alters what users see, or a finding that an official document is out of
  date, unclear or contradictory, arrives here as an issue labeled `raceworks`, linked to the RaceWorks issue (labeled
  `docs-impact` there). At each RaceWorks release, every RaceWorks guide is checked against it.
- **To RaceWorks:** when an adopted change to an official document affects RaceWorks (classes, minimum distances,
  fees, points formula or class factors, groups, seeding), open an issue in `Isdra-Org/raceworks` labeled
  `docs-impact`, naming the document, the version and the change. RaceWorks implements these rules, so it must
  follow them. A draft that isn't adopted yet doesn't need an issue, but it's worth a heads-up to John.
- Ask John before creating issues in either repo.

## Building

Build on the Linux build host with the guide's `build-pdf.sh` (requirements: README "Building a guide"), then check
the PDF (pages, fonts with `pdffonts`, text with `pdftotext`). Commit the PDF with the source, but don't commit a
rebuild whose text is unchanged (it differs only by a timestamp).
