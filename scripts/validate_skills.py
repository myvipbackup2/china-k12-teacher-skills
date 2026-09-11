from pathlib import Path
import re
import sys

repo = Path(__file__).resolve().parents[1]
skills_root = repo / "skills"
profiles_root = repo / "profiles"

required_skills = {
    "china-k12-lesson-planning",
    "china-k12-lesson-differentiation",
    "china-k12-lesson-prep",
    "china-k12-check-understanding",
    "kid-friendly-explainer-cn",
}
required_profile_files = {
    "PROFILE.md",
    "references/curriculum-it-2022.md",
    "references/child-language.md",
    "references/it-teaching.md",
    "references/misconceptions.md",
    "references/ppt-rules.md",
    "references/shanghai-context.md",
    "references/sources.md",
}

errors = []
seen = set()

for d in sorted(skills_root.iterdir()):
    if not d.is_dir():
        continue
    p = d / "SKILL.md"
    if not p.exists():
        errors.append(f"{d.name}: missing SKILL.md")
        continue
    txt = p.read_text(encoding="utf-8")
    if not txt.startswith("---\n"):
        errors.append(f"{d.name}: missing YAML frontmatter start")
    if txt.count("\n---\n") < 1:
        errors.append(f"{d.name}: missing YAML frontmatter end")
    m = re.search(r"(?m)^name:\s*([^\n]+)", txt)
    if not m:
        errors.append(f"{d.name}: missing name")
    else:
        name = m.group(1).strip().strip('"\'')
        if name != d.name:
            errors.append(f"{d.name}: frontmatter name is {name}")
        if name in seen:
            errors.append(f"duplicate name: {name}")
        seen.add(name)
    if "description:" not in txt:
        errors.append(f"{d.name}: missing description")

    hard_dependencies = [
        "bash scripts/render_all.sh",
        "find_standard_statement",
        "必须调用 Learning Commons",
        "requires Claude",
        "Claude for Teachers account required",
    ]
    for banned in hard_dependencies:
        if banned in txt:
            errors.append(f"{d.name}: hard dependency found: {banned}")

missing = required_skills - seen
if missing:
    errors.append("missing expected skill names: " + ", ".join(sorted(missing)))

profile = profiles_root / "shanghai-primary-it"
for rel in required_profile_files:
    if not (profile / rel).exists():
        errors.append(f"shanghai-primary-it: missing {rel}")

sources = (profile / "references/sources.md").read_text(encoding="utf-8") if profile.exists() else ""
for domain in ["moe.gov.cn", "edu.sh.gov.cn"]:
    if domain not in sources:
        errors.append(f"shanghai-primary-it sources missing official domain: {domain}")

if errors:
    print("VALIDATION FAILED")
    print("\n".join("- " + e for e in errors))
    sys.exit(1)

print("VALIDATION PASSED")
for n in sorted(seen):
    print("-", n)
print("- profile: shanghai-primary-it")
