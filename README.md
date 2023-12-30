# Area 72 Feed

Filters Puget Sound CSO feed to display district 10 meetings.

`.github/workflows/update-feed.yml` produces a current version of the feed at https://github.com/patmaddox/a72-feed/releases/download/current/district_10.json

It fetches the Pugest Sound CSO feed from env var `PS_CSO_URL`, which is configured as a GitHub repo secret because it contains a secret key URL param.
