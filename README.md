# China K12 Teacher Skills

面向中国基础教育教师的 AI Agent Skills。

在 Anthropic K12 Teacher Skills 的教学方法论基础上，结合中国课程标准和本土课堂实践进行适配，并逐步增加地区、学科和学段 Profile。

当前首个重点场景：上海小学信息科技教师的备课、教案、课件、课堂活动与形成性评价。

## Goals

* 中国课程标准优先
* 教师真实工作流优先
* 小学生可理解性
* 不绑定单一模型
* 不依赖 Claude / Learning Commons
* Windows First，同时兼容 macOS / Linux
* 可与 Codex Documents / Slides 等文档能力组合
* Skill 与课程知识分离
* 支持地区 Profile
* 保持与上游 K12 Skills 可追踪同步

## Planned Structure

```text
china-k12-teacher-skills/
├── skills/
│   ├── china-k12-lesson-planning/
│   ├── china-k12-lesson-differentiation/
│   ├── china-k12-lesson-prep/
│   ├── china-k12-check-understanding/
│   └── kid-friendly-explainer-cn/
│
├── profiles/
│   └── shanghai-primary-it/
│
├── references/
├── scripts/
├── tests/
├── docs/
└── .github/
```

## Current Focus

当前首个重点 Profile：

**Shanghai Primary Information Technology**

主要面向：

* 上海小学
* 3–6 年级
* 信息科技
* 人工智能教育
* Scratch / 算法 / 数据 / 网络 / 安全 / AI
* 教案
* PPT
* DOCX
* 课堂活动
* 分层教学
* 形成性评价

This project is under active development.
