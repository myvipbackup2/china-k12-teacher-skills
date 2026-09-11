param(
  [string]$Destination = "",
  [string[]]$Profiles = @("shanghai-primary-it")
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$SourceRoot = Join-Path $RepoRoot "skills"
$ProfilesRoot = Join-Path $RepoRoot "profiles"

function Resolve-SkillRoot {
  param([string]$Explicit)
  if ($Explicit) { return [System.IO.Path]::GetFullPath($Explicit) }

  $homeDir = [Environment]::GetFolderPath("UserProfile")
  $agents = Join-Path $homeDir ".agents\skills"
  $legacy = Join-Path $homeDir ".codex\skills"

  if (Test-Path (Join-Path $homeDir ".agents")) { return $agents }
  if ($env:CODEX_HOME) { return (Join-Path $env:CODEX_HOME "skills") }
  if (Test-Path $legacy) { return $legacy }
  return $agents
}

$SkillRoot = Resolve-SkillRoot $Destination
New-Item -ItemType Directory -Force -Path $SkillRoot | Out-Null

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backupRoot = Join-Path $SkillRoot ".backups\china-k12-teacher-skills\$timestamp"
$skillDirs = Get-ChildItem -Path $SourceRoot -Directory

foreach ($skill in $skillDirs) {
  $source = $skill.FullName
  $target = Join-Path $SkillRoot $skill.Name

  if (Test-Path $target) {
    New-Item -ItemType Directory -Force -Path $backupRoot | Out-Null
    Copy-Item -Recurse -Force $target (Join-Path $backupRoot $skill.Name)
    Remove-Item -Recurse -Force $target
  }

  Copy-Item -Recurse -Force $source $target

  $installedProfileRoot = Join-Path $target "references\profiles"
  foreach ($profile in $Profiles) {
    $profileSource = Join-Path $ProfilesRoot $profile
    if (-not (Test-Path $profileSource)) { throw "Unknown profile: $profile" }
    New-Item -ItemType Directory -Force -Path $installedProfileRoot | Out-Null
    Copy-Item -Recurse -Force $profileSource (Join-Path $installedProfileRoot $profile)
  }

  if (-not (Test-Path (Join-Path $target "SKILL.md"))) {
    throw "SKILL.md missing after install: $target"
  }
}

Write-Host "Installed China K12 Teacher Skills to: $SkillRoot"
if (Test-Path $backupRoot) { Write-Host "Backups: $backupRoot" }
Write-Host "Profiles: $($Profiles -join ', ')"
Write-Host "Skills:"
$skillDirs | ForEach-Object { Write-Host " - $($_.Name)" }
