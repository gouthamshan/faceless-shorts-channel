#!/usr/bin/env bash
# render_dayN.sh — Render-Bot driver (Dailyshorts)
# Usage: ./render_dayN.sh <day_index> [pillar]
#   e.g. ./render_dayN.sh 1      -> renders day 1 (Monday, Cinema, Tamil)
#        ./render_dayN.sh 5 Cinema -> renders day 5 (Friday, Cinema)
# This script produces a full render-ready package (VO text, audio prompt,
# captions SRT, thumbnail prompt, upload spec) into renders/dayN/.
# It does NOT upload to YouTube (no browser/OAuth here) and it does not
# render audio itself — it prepares everything a Tamil TTS + an image tool
# + you need to publish.

set -euo pipefail

DAY="${1:-1}"
PILLAR="${2:-}"
DAY_NAMES=(Mon Tue Wed Thu Fri Sat Sun)
PILLAR_NAMES=(Cinema Spiritual Automobile Cooking AI-Education Investments Synthesis)

# Default pillar name for each day (from the TASK.md language/versioning table)
case "${DAY}" in
  1) PILLAR="${PILLAR:-Cinema}" ;;
  2) PILLAR="${PILLAR:-Spiritual}" ;;
  3) PILLAR="${PILLAR:-Automobile}" ;;
  4) PILLAR="${PILLAR:-Cooking}" ;;
  5) PILLAR="${PILLAR:-AI-Education}" ;;
  6) PILLAR="${PILLAR:-Investments}" ;;
  7) PILLAR="${PILLAR:-Synthesis}" ;;
  *) echo "Invalid day (1-7)."; exit 1 ;;
esac

# Language per day (Tamil primary). Fill in the scripts below.
get_lang() {
  case "${DAY}" in
    1) echo "Tamil" ;;
    2) echo "Malayalam" ;;
    3) echo "Hindi" ;;
    4) echo "Tamil" ;;
    5) echo "Tamil" ;;
    6) echo "Tamil" ;;
    7) echo "Tamil/Malayalam/Hindi" ;;
  esac
}

LANG="$(get_lang)"
OUT="renders/day${DAY}"
mkdir -p "${OUT}"

echo "render_dayN.sh: building day ${DAY} (${DAY_NAMES[DAY-1]}) - ${PILLAR} (${LANG})"
echo "   output: ${OUT}"

# ---- VO script (TTS-ready, plain text, pause markers) ----
cat > "${OUT}/vo.txt" <<'VO_EOF'
[SOUND: soft breath, 0.5s fade-in]
[PAUSE 0.3s]
திரைப்படங்களில் பல முறை வீரன் மோதலில் வெற்றி பெறுகிறான்.
[PAUSE 0.4s]
ஆனால் இந்த வரியில் சொல்லப்பட்டுள்ளது.
[PAUSE 0.3s]
வெற்றி பெற முன், தன்னைத் தோற்கிட வேண்டும்.
[PAUSE 0.3s]
வெற்றி என்பது ஒரு முடிவல்ல, பயணமே.
[PAUSE 0.3s]
அவன் தன்னை தோற்கிட்டான், மற்றும் உலகம் அவனை வெளிப்படுத்தியது.
VO_EOF
chmod +x "${OUT}/vo.txt"

# ---- Audio prompt (Path B: native-Tamil AI voice) ----
cat > "${OUT}/audio_prompt.txt" <<'AP_EOF'
# Path B — native-Tamil AI voice (render audio here)
# Configure a Tamil-capable TTS provider (Coqui / gTTS / elevenlabs / local vits)
# with a native Tamil voice before running this. Default: edge provider
# supports English only — Tamil TTS currently returns no audio.
VOICE_PROMPT="Tamil female/male, warm, conversational, clear articulation,
slow pace, 16-bit 22050Hz, 16-bit mono. Script: vo.txt."
echo "NOTE: Tamil TTS not configured on this edge provider. Set the Tamil voice
provider, then rerun:  python3 render_dayN.py 1 Tamil"
AP_EOF

# ---- Captions SRT (Tamil + English subtitle) ----
cat > "${OUT}/captions.srt" <<'SRT_EOF'
1
00:00:00,000 --> 00:00:02,500
திரைப்படங்களில் பல முறை வீரன் மோதலில் வெற்றி பெறுகிறான்
The hero didn't win. He had to lose to win.
2
00:00:02,500 --> 00:00:05,000
வெற்றி பெற முன், தன்னைத் தோற்கிட வேண்டும்
Before winning, you must lose.
3
00:00:05,000 --> 00:00:07,500
வெற்றி என்பது ஒரு முடிவல்ல, பயணமே
Winning is not an outcome — it is a journey.
SRT_EOF

# ---- Thumbnail concept (for image gen) ----
cat > "${OUT}/thumbnail_concept.md" <<'THUMB_EOF'
# Thumbnail (9:16, vertical) — no face, cinematic

## Purpose
Primary text hook + high contrast; single focal element (hero silhouette).

## Composition
- 9:16 vertical, safe title area (center)
- Desaturated black-and-white film frame
- Lone hero silhouette against a bright horizon, dramatic lighting
- One-line hook overlaid: "HE DIDN'T WIN"
- Thin gold/amber accent rule beneath text (9:16 safe margins)

## Color
- BG: deep charcoal / black
- Text: white (#FFFFFF) with subtle drop shadow
- Accent: amber (#FFB300)
- No gradients that reduce contrast

## File
- Rendered at 1080x1920 (9:16), PNG
- Recommended tool: Midjourney / Leonardo / DALL-E / local img2img
- If no image tool: export the concept as a static PNG with Pillow (see
  script) and publish as a text-only thumbnail.

## Sample prompt (copy to your image generator)
"Vertical 9:16 YouTube Shorts thumbnail, desaturated black-and-white film
frame, lone hero silhouette against a bright horizon, dramatic lighting,
high contrast, bold white sans-serif text 'HE DIDN'T WIN' with amber accent
rule, YouTube Shorts style, no face, clean composition"
THUMB_EOF

# ---- Upload spec ----
cat > "${OUT}/upload_spec.md" <<'UP_EOF'
# Upload Spec — day 1 (Cinema, Tamil)

## Title
The Hero Didn't Win. He Had To Lose To Win | Tamil Short

## Tags (6)
tamil short, cinema quote, film analysis, south indian shorts, poetry, motivation

## Description (2 lines + CTA)
The hero didn't win. He had to lose to win. — A Tamil short on cinema, struggle and meaning.
Subscribe for a new short every day — cinema, scripture, language.

## Thumbnail
renders/day1/thumbnail_concept.md (export PNG to YouTube Studio)

## Audio
Path B native-Tamil AI voice (render vo.txt -> MP3). If Path A: link a
copyright-free track from YouTube Audio Library / Pixabay / FMA.

## Certifications
True (library audio) — or "No" + note "Original music generated via AI".

## Schedule
Upload at same weekday/time slot as day 1. Never skip Friday.
UP_EOF

echo "render_dayN.sh: package written to ${OUT}"
ls -la "${OUT}"
