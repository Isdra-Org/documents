# Hand-off: one place for rule questions to bring to ISDRA (from the RaceWorks session, 2026-11-10)

**Status: John approved the idea (2026-11-10) and asked for it to be done in this session.** Creating labels and issues
here still needs John's OK (push policy). When it's done, delete this file and its "Pending hand-off" note in
`CLAUDE.md`.

**Progress (2026-11-16, with John's OK):** label `needs-ruling` created; tracking issue #14, pinned. First questions
filed: #12 (substitute driver for part of a race) and #13 (start-order requests). Still to do: file the three questions
below (ask John first) and review #5-#8 for the label.

## Why

RaceWorks, results processing and documents work all keep running into rules that are ambiguous, silent or
contradictory. Only ISDRA can settle them. Today these questions are spread across three repos with no single list, so
nothing collects them for John to take to the organization.

## Proposal

1. **New label here: `needs-ruling`.** Use it for a question only ISDRA can settle, as distinct from `question`, which
   also covers things John can answer himself. Suggested description: "Ambiguous or conflicting rule: needs a decision
   from ISDRA".
2. **A pinned tracking issue: "Rule questions to bring to ISDRA".** List every `needs-ruling` issue with a one-line
   summary and what the software does today. That's John's agenda for the organization. Keep it updated as issues
   open and close.
3. **One `needs-ruling` issue per question.** Each links back to the issue where it was found. The other repos are
   private, so the links work only for John. Write the question so it reads on its own here: rule text, documents and
   versions, the options, and current practice. No member names or other member data (this repo is public).
4. Once a ruling is adopted, update the document, close the issue, and open a `docs-impact` issue in
   `Isdra-Org/raceworks` if RaceWorks has to change (as the CLAUDE.md "To RaceWorks" rule already says).

## Questions to file

### New `needs-ruling` issues

- **Tied finish times at the edge of the points places** (from Isdra-Org/raceworks#5, question 5).
  - RaceWorks averages tied places' points. So two teams tied for 30th each get half of 30th place's points, because
    31st is worth zero.
  - The race rules say teams with equal times "share the higher finishing position", which would give both the full
    30th-place points. Read literally, it would also change ties higher up (a tie for 2nd would give both 2nd's points
    with the 4% bonus).
  - The Adult (2023-06) and Junior (2018-05) points programs say nothing about ties.
  - **Decision for now (John, 2026-11-10):** keep averaging (long-standing practice) until ISDRA rules.
- **Ranking members with equal net points in the standings** (from Isdra-Org/raceworks-results#1).
  - The adult points program defines net points (best 4 races per class), but not how to rank equal totals.
  - The current standings script breaks ties by gross points, then arbitrarily. Tied members never share a rank.
  - Ranks set seed points, so this affects race points.
  - Options: a shared rank (7, 7, 9), or a tie-break (gross points, head-to-head, most recent).
- **Open points-formula questions** (from Isdra-Org/raceworks#5, questions 1 and 3). File them as one issue or two.
  - Is the class floor meant to apply before or after mileage pro-rating? Today a short race can end below the floor.
  - `Class_factors` shows benchmark 5 for mid-distance/distance, while the program uses 25 / 20.
  - Question 2, mid-distance/distance mileage, is per race in the sanctioning requirements. That's settled, so it's
    not a ruling question, just a RaceWorks fix.

### Existing issues here to review for `needs-ruling`

- #5 Dryland 1-dog minimum distance (1 mile vs. 1.5)
- #6 Sanctioned class lists don't match
- #7 Results reporting out of date (may be just an edit, not a ruling)
- #8 Registered Breed standings not written down
- #4 "rank 40" text: already decided (30 is intended), so it's an edit, not a ruling

### Not rule questions (leave out)

Isdra-Org/raceworks-results#3 (early-season standings may have missed two races) and #4 (Fatbike/Mid spellings) are
process and data problems.

## Note for the RaceWorks session

When a RaceWorks or results finding turns out to need a ruling, it goes to this repo as a `needs-ruling` issue,
linked both ways, and gets added to the tracking issue. The RaceWorks session should add that to its own CLAUDE.md once
this is set up.
