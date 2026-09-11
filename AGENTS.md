# Agent contribution rules

This repository is frequently edited by AI agents. Follow these rules before changing skills or references.

1. **Do not invent policy.** National curriculum claims must be traceable to official Ministry of Education sources. Shanghai-specific claims must be traceable to Shanghai Municipal Education Commission sources.
2. **Teacher-provided material wins.** Skills must prefer the teacher's school curriculum, timetable, templates, software constraints, and explicit instructions over repository defaults.
3. **Keep core skills portable.** Do not hard-require Claude, Learning Commons, Codex, DeepSeek, bash, PowerShell, Python, Node, LibreOffice, or a specific Office renderer.
4. **Windows is a first-class runtime.** Any new script must either be cross-platform or have a PowerShell equivalent. Avoid Unix-only instructions in `SKILL.md`.
5. **Keep Skills small.** Workflow and hard decision rules belong in `SKILL.md`; long policy, pedagogy, misconception, or regional material belongs in references/Profile files.
6. **Do not copy textbooks.** Use official policy summaries and original examples. Do not add copyrighted textbook passages, teacher-edition pages, or proprietary worksheets.
7. **Differentiate without labeling children.** Student-visible groups must use neutral labels such as 基础 / 提升 / 挑战 or task names. Describe observable reasoning, not ability labels.
8. **Child-facing text must be age-appropriate.** Avoid adult bureaucratic language and unexplained terminology.
9. **Update sources when policy changes.** When modifying a policy-derived rule, update `sources.md` and record the change in `CHANGELOG.md`.
10. **Run validation.** `python scripts/validate_skills.py` must pass before committing.
