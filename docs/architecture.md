# Architecture

## Core idea

Core skills encode reusable teacher workflows. Profiles encode jurisdiction, grade-band, subject, pedagogy, misconceptions, and presentation rules.

At install time the selected profiles are copied under each Skill:

```text
<skill-root>/china-k12-lesson-planning/
├── SKILL.md
└── references/
    └── profiles/
        └── shanghai-primary-it/
```

That makes the installed Skill self-contained after the repository clone is deleted.

## Profile activation

A Skill should activate a profile only when the request or user-provided material matches it. `shanghai-primary-it` is appropriate when the teacher identifies Shanghai + primary information technology / AI education, or explicitly requests this profile.

If no profile matches:
- still follow the core workflow;
- prioritize teacher-provided curriculum/materials;
- do not invent local standards or subject rules;
- ask at most one clarification only when it materially changes the lesson.

## Artifact handoff

Skills own pedagogy and content. When the runtime offers Documents, Slides, PDF, or spreadsheet capabilities, those capabilities own file-format generation/editing. This repository does not require a duplicate Office renderer.
