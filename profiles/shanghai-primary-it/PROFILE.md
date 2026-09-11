---
name: shanghai-primary-it
scope: Shanghai primary grades 3-6 information technology and grade-4 AI education
version: 0.1.0
---

# Shanghai Primary Information Technology Profile

## Activate when

- 用户明确在上海，且任务是小学信息科技/信息技术；或
- 用户明确说“上海四年级人工智能基础课”；或
- 用户直接要求使用 `shanghai-primary-it` Profile。

不要因为用户只是“中国老师”就自动套上海规则。

## Priority

用户/学校材料 > 上海当前有效要求 > 国家课程标准 > 本 Profile 默认值。

## Load minimally

- 所有新课：`references/curriculum-it-2022.md` + `references/it-teaching.md` + `references/child-language.md`
- AI/上海地方课程：再读 `references/shanghai-context.md`
- 诊断/课前准备：按需读 `references/misconceptions.md`
- PPT：按需读 `references/ppt-rules.md`
- 核验政策来源：`references/sources.md`

## Boundaries

- Scratch、Python、具体软件是教学工具选择，不自动等于国家课标要求。
- 不编造教材版本、课标编号、区级规定。
- 不强行“上海化”所有例子；地方情境只在自然适配时使用。
