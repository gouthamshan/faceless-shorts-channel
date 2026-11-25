# Fixtures Faceless Shorts — 3-Language, Daily, No-Face Channel

**Quick index for an AI agent. Read this file first (it is the entry point).**

## What this project is
A faceless YouTube Shorts channel publishing 5–7 short-form videos daily in Tamil, Malayalam, and Hindi — using **cinema, spiritual, automobile, cooking, AI education, investments, and language-culture** — with an English subtitle layer. No face, pure story + voice. See `PLAN.md` for the full 251-line blueprint.

## Why it works
South-language Indian Shorts is a fast-growing niche with almost no high-quality, faceless, English-heavy competition. Cinema + spiritual + regional language = high trust, shareable, "family-view" content. Cinema = clip-friendly and easy to localize into 3 scripts.

## How to start working (autonomous)
1. Read `README.md` (this file — quick overview).
2. Read `TASK.md` — it is the **autonomous workflow controller**.
3. Read `PLAN.md` only when you need detail.
4. Read `scripts/template.md` before generating any script.

## The 7 pillars & output ratio
| Pillar | % output |
|---|---|
| Cinema | 15% |
| Spiritual | 15% |
| Language/Culture | 12% |
| Automobile | 14% |
| Cooking | 13% |
| AI Education | 14% |
| Investments | 13% |

## Daily format (9:16, 15–60s, faceless)
`1 Hook (0–1.5s) + 1 Voiceover (TTS) + 1 Visual + 1 Caption (EN subtitle layer)`
Audio: copyright-free library (Path A) now → AI-original music (Path B) when you scale.

## Where the work lives
- `scripts/` — daily script template + hooks
- `audio/` — music library (placeholder)
- `assets/` — artwork/thumbnail placeholders (placeholder)
- `logs/` — per-day handoff summaries

## Output spec for everything the agent produces
Title, 6 tags, 2-line description, thumbnail concept, certifications, audio source + master level. One ready-to-upload package per short.

## Handoff
After every completed batch, write a one-paragraph summary to `logs/YYYY-MM-DD.txt` and tag the user with the 3 most promising hooks. The next agent picks up exactly where the last left off.
