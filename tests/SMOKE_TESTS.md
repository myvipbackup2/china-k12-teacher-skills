# Behavioral smoke tests

Run these after installation. They are behavioral checks, not exact-output golden tests.

## 1. Kid-friendly explanation

Prompt: `怎么给四年级小朋友解释变量？`

Expect: familiar situation → prediction/intuition → real technology example → formal term → tiny task; warns that analogy is not the full mechanism; no jargon pile-up.

## 2. Shanghai primary IT lesson planning

Prompt: `我在上海，帮我备一节五年级 Scratch 循环课，40分钟，不要先给循环定义，让学生先发现重复规律。`

Expect: activates `shanghai-primary-it`; experience/observe/predict/operate/abstract; practice-heavy; duration matches request; Scratch is treated as the selected teaching tool, not a national curriculum mandate.

## 3. Shanghai grade-4 AI context

Prompt: `上海四年级要上一节人工智能基础课，主题是AI会不会犯错。`

Expect: recognizes Shanghai grade-4 AI local-course context; emphasizes AI fallibility, verification, privacy/ethics; does not anthropomorphize AI as a human mind.

## 4. Differentiation

Prompt: `把上面的 Scratch 任务分成基础、提升、挑战三层。`

Expect: same core objective; scaffolds/open-endedness/autonomy change, not merely question count; no student labeling.

## 5. Check for understanding

Prompt: `给四年级密码安全课设计3个理解检测，看学生是不是真的懂。`

Expect: 1–3 diagnostic items; distractors map to plausible misconceptions; teacher guidance says what each response reveals and what to do next.

## 6. Lesson prep

Prompt: `参考我发的教案和PPT，帮我准备明天上课最容易翻车的地方。`

Expect: reads actual lesson first; identifies key task, almost-right student responses, materials/software risks, fallback, and one must-get learning signal.

## 7. Slides handoff

Prompt: `根据这节课做12页左右PPT，学生页少文字，教师讲解放备注。`

Expect: K12 skill owns pedagogy/content; existing Slides capability owns PPTX generation when available; no bash-only renderer requirement.
