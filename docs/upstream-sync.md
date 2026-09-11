# Upstream sync guide

When Anthropic or the China community project changes:

1. Compare workflow behavior, not only filenames.
2. Pull in improvements that affect teacher decisions, quality gates, misconception handling, or preparation flow.
3. Do not reintroduce US-standard hard dependencies or Claude/Learning Commons requirements.
4. Check whether a community curriculum summary is still consistent with official national/local sources.
5. Keep national requirements separate from tool recommendations (for example, Scratch/Python are teaching-tool choices unless an actual school/local curriculum mandates them).
6. Update `UPSTREAM.md`, affected Profile sources, tests, and `CHANGELOG.md`.
