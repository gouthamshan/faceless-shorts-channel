# TASK.md — Autonomous Workflow Controller

This file is the **controller** for an AI agent. When you receive the instruction
"start working on the Fixtures faceless shorts channel", read this file and follow the workflow.

## Project state
- Repo root: `fixtures_faceless_channel/`
- Full blueprint: `PLAN.md` (251 lines) — read only for detail
- 7-pillar ratio: `README.md` Section 2
- Script template: `scripts/template.md`
- Audio plan: `PLAN.md` Section 4
- Compliance: `PLAN.md` Section 10
- Historical record: `logs/` (one `.txt` file per day)

## Workflow — "start working"

1. Read `README.md` (quick overview, < 30 seconds).
2. Read `TASK.md` (this file) to learn the workflow.
3. Pick the next queued action:
   - **"generate next N scripts"** → use `scripts/template.md` + the pillar→language table below.
   - **"batch-record"** → write N scripts, render audio-prompts, generate AI-music prompts.
   - **"week 1 batch"** → produce Mon–Sun scripts, one per language/day.
   - **"scale to 3 languages"** → one theme → original + 2 translations.
4. Produce the output in the Output Spec below.
5. Write a one-paragraph handoff to `logs/YYYY-MM-DD.txt` and tag the user with the 3 most promising hooks. The next agent picks up exactly where this one left off.

## Language/versioning rule (Day → Language → Pillar)
| Day | Language | Pillar |
|-----|----------|--------|
| Mon | Malayalam | Cinema |
| Tue | Tamil | Spiritual |
| Wed | Hindi | Automobile |
| Thu | Tamil | Cooking |
| Fri | Hindi | AI Education |
| Sat | Tamil | Investments |
| Sun | Tamil/Malayalam/Hindi | Synthesis |

## Output spec — one short (every script must follow `scripts/template.md`)
- **Hook (0–1.5s):** one-sentence promise.
- **VO language:** Tamil / Malayalam / Hindi / English.
- **Visual:** single concept, max 3 shots, no jump cuts.
- **Caption:** 2–3 lines, keyword-first, high contrast, plus English subtitle.
- **Audio:** library track (Path A) with pillar→audio matching + "-14 LUFS mastering" note.
- **Package:** title + 6 tags + 2-line description + thumbnail concept + certifications.

## Scale rule (from day 15 onward)
Publish to 3 languages on one theme (one original + 2 translations) to test per-market response.

## Success metrics (day 30)
- 1,000 total views
- 3 shorts with ≥35% average watched
- Then double the posting cadence.
