# Prompt for Codex / DeepSeek

请直接安装并验证下面这个 Teacher Skills 仓库，不要只告诉我步骤：

https://github.com/myvipbackup2/china-k12-teacher-skills

要求：

1. 先确认当前操作系统和用户级 Agent/Codex Skills 目录；不要修改我的模型/API 配置。
2. 将仓库 clone 到临时或合适的工作目录。
3. Windows 优先执行 `scripts/install.ps1`；macOS/Linux 执行 `scripts/install.sh`。
4. 安装器如发现已有同名 Skill，必须先备份再更新，不能静默覆盖丢失。
5. 默认安装全部 5 个核心 Skills，并安装 `shanghai-primary-it` Profile。
6. 运行 `python scripts/validate_skills.py`；如失败，先修复兼容性问题再重新验证。
7. 安装完成后检查 5 个 Skill 都能被当前 Agent 发现；如果当前 Codex 的实际 Skills 根目录与安装器自动判断不同，移动到实际目录并说明原因。
8. 最后用 `tests/SMOKE_TESTS.md` 中前 5 个自然语言用例做简短行为检查。
9. 不要安装 Claude、Learning Commons、额外 MCP、Node/Python Office renderer 或 LibreOffice，除非当前环境明确缺少某项必要能力且我另行同意。
10. 如果当前环境已有 Documents / Slides / PDF Skills，保留并复用它们；本仓库的 K12 Skills 负责教学设计与内容约束。

最终只汇报：安装目录、安装的 Skills、Profile、备份位置（如有）、validator 结果、smoke test 是否通过。
