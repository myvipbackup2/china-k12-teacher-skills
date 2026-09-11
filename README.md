# China K12 Teacher Skills

面向中国基础教育教师的 AI Agent Skills。

本项目吸收 Anthropic K12 Teacher Skills 的教学工作流设计，并结合中国课程标准、本土课堂实践与地区 Profile 做适配。它不绑定 Claude、Codex、DeepSeek 或某一家模型；当前优先验证的运行环境是 **Windows + Codex + DeepSeek Flash**。

当前第一个完整 Profile 是：**Shanghai Primary Information Technology（上海小学信息科技 / AI 教育）**。

## What is included

- `china-k12-lesson-planning`：从零设计课堂，负责教学逻辑、学生任务、分层与 Office 交接。
- `china-k12-lesson-differentiation`：把已有课堂改造成基础 / 提升 / 挑战三层。
- `china-k12-lesson-prep`：拿已有教案/PPT 做真正的课前准备与风险预演。
- `china-k12-check-understanding`：用 1–3 个形成性检测判断学生“哪里没懂”。
- `kid-friendly-explainer-cn`：把抽象概念转换成小学生真正能理解的中文。
- `profiles/shanghai-primary-it`：上海小学信息科技、人工智能地方课程、儿童表达、常见误解与 PPT 规则。

## Design principles

- **中国课程标准优先**：官方国家/地方政策 > 社区摘要 > 模型记忆。
- **学校材料优先**：老师提供的教材、课表、模板、区校要求优先于仓库默认值。
- **教学法与地区 Profile 分离**：核心 Skill 尽量通用；地区/学科差异放 Profile。
- **不绑定模型**：不要求 Claude、Learning Commons、OpenAI 模型或特定 API。
- **Windows First，跨平台**：Windows 使用 PowerShell；macOS/Linux 使用 Bash；Skill 内容本身不依赖 OS。
- **Office 能力复用**：运行环境已有 Documents / Slides / PDF 能力时优先复用，不自建重复渲染链路。
- **渐进加载**：`SKILL.md` 保持工作流与硬规则，较长的课程/地区知识放 references/Profile。

## Repository structure

```text
china-k12-teacher-skills/
├── skills/
│   ├── china-k12-lesson-planning/
│   ├── china-k12-lesson-differentiation/
│   ├── china-k12-lesson-prep/
│   ├── china-k12-check-understanding/
│   └── kid-friendly-explainer-cn/
├── profiles/
│   └── shanghai-primary-it/
├── references/
├── scripts/
├── tests/
├── docs/
└── .github/workflows/
```

安装时，Profile 会被复制到每个 Skill 的 `references/profiles/` 下，因此安装后的 Skill 可以独立读取 Profile，不依赖仓库仍然存在。

## Install

### Windows（推荐）

```powershell
git clone https://github.com/myvipbackup2/china-k12-teacher-skills.git
cd china-k12-teacher-skills
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

### macOS / Linux

```bash
git clone https://github.com/myvipbackup2/china-k12-teacher-skills.git
cd china-k12-teacher-skills
bash ./scripts/install.sh
```

安装器会：

1. 自动选择用户级 Agent Skills 目录；
2. 备份已有同名 Skill；
3. 安装 5 个核心 Skills；
4. 把 `shanghai-primary-it` Profile 注入到各 Skill 的 references；
5. 检查每个 Skill 是否存在 `SKILL.md`。

如需指定目录：

```powershell
.\scripts\install.ps1 -Destination "D:\agent-skills"
```

```bash
bash ./scripts/install.sh "$HOME/custom-skills"
```

## Give Codex a short prompt

安装时可以直接把 [`INSTALL_PROMPT.md`](./INSTALL_PROMPT.md) 的内容交给 Codex / DeepSeek。安装完成后，老师不需要知道 Skill 名称，直接用中文说：

- “帮我备一节五年级 Scratch 循环课，40 分钟，让学生先发现重复规律。”
- “参考这个教案，帮我准备明天上课最容易翻车的地方。”
- “把这几个课堂任务分成基础、提升、挑战三层。”
- “怎么给四年级小朋友解释变量？”
- “给密码安全课设计 3 个题，看学生是不是真的懂。”

## Current profile: Shanghai Primary IT

当前 Profile 面向上海小学 3–6 年级信息科技，并对上海四年级人工智能地方课程提供额外上下文。上海市教委自 2024 年秋季起系统推进中小学人工智能教育，并明确四年级、七年级开设《人工智能基础》地方课程；仓库只保存用于教学决策的摘要和官方来源，不复制教材正文。

详见：`profiles/shanghai-primary-it/references/sources.md`。

## Validation

```bash
python scripts/validate_skills.py
```

行为测试见 [`tests/SMOKE_TESTS.md`](./tests/SMOKE_TESTS.md)。CI 在 Windows / Ubuntu / macOS 三个平台运行静态校验与安装 smoke test。

## Upstream & attribution

见 [`UPSTREAM.md`](./UPSTREAM.md)、[`NOTICE`](./NOTICE) 和 [`COMPARISON.md`](./COMPARISON.md)。

## Status

`v0.1.x`：首个可用版本，优先覆盖上海小学信息科技场景。后续再扩展其他地区、学科与 Profile。
