# LeConte Training

A mobile-friendly web app for training for **Mt. LeConte, Great Smoky Mountains,
in April 2027**. Built on the October Challenge tracker's design (deep evergreen
+ gold, single file, no build step).

It carries a 24-week plan starting Mon Nov 9, 2026 (ready-by Apr 15, 2027):
a "This Week" card with the 5 prescribed sessions (Mon Strength A, Tue Incline
Walk, Wed Strength B, Fri Stairs, Sat Long Hike) and Done checkboxes, a Log
Session form (miles, vertical ft, minutes, pack lb, pain, note), progress
toward 150 miles / 35,000 vertical ft / 110 sessions, a Game plan coach card,
mile bubbles, a rotating verse card, a gold-foil share card, and an installable
PWA flow.

Data is saved on-device in localStorage under the key `leconte-v1`. Nothing
from the old October app (`jct50-v1`) is touched.

## Files

- `index.html` — the whole app (single file, no build step)
- `manifest.json`, `sw.js` — PWA manifest + service worker (`leconte-v1` cache)
- `leconte-schema.sql` — Supabase tables for the optional shared board
- `tests/leconte-tests.js` — Node/jsdom tests for the training logic

## Run / deploy

Open `index.html` in a browser, or serve the folder. To put it on GitHub
Pages: upload the folder contents to a repo, enable Pages from `main` /
root, open the URL on your phone and Add to Home Screen.

## Shared board (optional, Supabase)

The app works fully local with no setup. For the shared training board, run
`leconte-schema.sql` **once** in the Supabase project (SQL Editor → New query
→ paste → Run). It creates `leconte_profiles` and `leconte_sessions` with
open-access RLS policies matching what the app syncs. Until then, Settings
shows "Local only - shared board not set up yet" and logging is never blocked.

## History

The October Challenge version of this app is preserved in git history at
commit `fce2819` and in the backup folder
`~/workspace/hiking-tn-feb-2027/backup-october-challenge-2026-11-08/`.
This LeConte version overwrote the working copy on Nov 8, 2026, at the
user's explicit request.
