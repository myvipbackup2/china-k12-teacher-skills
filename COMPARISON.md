# Why this repository exists

## Anthropic upstream

Strengths:
- mature teacher workflow design;
- strong lesson-prep behavior;
- useful differentiation principles;
- small diagnostic Check-for-Understanding pattern;
- explicit quality gates.

Gaps for this repository's first use case:
- US-standard routing and optional Learning Commons connector;
- no first-party China curriculum profile;
- no dedicated Shanghai primary information-technology profile;
- bundled document-rendering assumptions are not ideal when an Agent runtime already has native Documents/Slides capabilities.

## Community China adaptation (`flyboat403/k12-skills`)

Strengths:
- substantial China localization rather than literal translation;
- local curriculum-reference architecture;
- an `it` information-technology route and practical IT teaching guidance;
- Windows-aware direction.

Gaps we address:
- keep synchronization with newer upstream teacher workflows (especially lesson prep and CFU);
- verify policy summaries against official sources;
- separate national curriculum goals from recommended software/languages;
- add a Shanghai profile instead of putting regional assumptions into every core skill;
- make Office artifact generation a capability handoff, not a bash-only hard dependency.

## This repository

Architecture:

`generic China teacher workflow Skill` + `optional regional/subject Profile` + `runtime-provided file capabilities`.

The first high-confidence Profile is `shanghai-primary-it`. The core is intentionally reusable for future profiles.
