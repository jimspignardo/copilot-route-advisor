# Copilot Route Advisor

**Copilot Route Advisor**, formerly **Route It!**, helps users choose the lightest Microsoft Copilot approach that fully meets their task: **Copilot Chat**, **Copilot Cowork**, or a **custom Agent**.

This repository includes the complete supplied **1.0.4** Agent Builder export, readable instructions, setup guidance, and a repeatable package validator.

## What changed

- A professional, concise voice replaces the game-show framing, points, badges, and fuel gauges.
- Five Yes/No signals support the recommendation, confidence, rationale, and practical next steps.
- Scheduled, unattended, and event-driven requests require checking current official Cowork guidance before routing.
- External-system actions, custom connectors, and unsupported durable automation are directed to the full Copilot Studio experience.
- The new **cowork-session-estimator** skill covers seven estimation drivers, low-to-high planning ranges, uncertainty, comparable-session calibration, and currency conversion using an actual organization-specific rate.
- Agent recommendations include a name, purpose, build surface, knowledge sources, capabilities, ready-to-paste instructions, starter prompts, and a test tip.

These describe the supplied agent's intended behavior. Runtime behavior still needs testing in the target Microsoft 365 environment.

## Choose a route

| Task shape | Default recommendation |
|---|---|
| One question or a task that fits in one answer | Copilot Chat |
| A one-off, multi-step or multi-app task | Copilot Cowork |
| A recurring task or reusable helper | Agent |
| Scheduling, unattended execution, or event triggers | Verify current support before choosing |
| External systems, custom connectors, or unsupported durable automation | Full Copilot Studio experience |

See the [decision guide](docs/decision-guide.md) for precedence and boundaries.

## Get started

Read the [setup guide](docs/agent-builder-setup.md), then use the supplied files in [package/](package/) or the readable [instructions](agent/instructions.md), [description](agent/description.md), and [starter prompts](agent/starter-prompts.md).

Build a validated ZIP with PowerShell 7:

```powershell
pwsh -NoProfile -File scripts/package.ps1
```

The output is `dist/copilot-route-advisor.zip`. It contains only the package files, with `manifest.json` at the ZIP root. Validation checks package structure and documentation synchronization, not tenant compatibility or successful installation.

## Repository contents

| Path | Purpose |
|---|---|
| [package/manifest.json](package/manifest.json) | Microsoft 365 app manifest, version 1.0.4 |
| [package/declarativeAgent_0.json](package/declarativeAgent_0.json) | Agent definition and routing instructions |
| [Estimator skill](package/skills/cowork-session-estimator/SKILL.md) | Complete supplied estimation workflow |
| [agent/](agent/) | Readable setup fields, instructions, and starter prompts |
| [docs/](docs/) | Setup, routing, estimation, and manual acceptance checks |
| [CHANGELOG.md](CHANGELOG.md) | Rename and behavior changes |
| [scripts/package.ps1](scripts/package.ps1) | Validation and ZIP packaging |

## Cost guidance and official references

Estimates are planning ranges, not bills. The supplied skill requires current official guidance, explicit assumptions, and an actual organization-specific rate before currency conversion. It does not provide a universal driver-to-credit formula. Without a defensible calibration basis, do not invent numeric precision.

- [Microsoft Cowork What's New](https://learn.microsoft.com/en-us/microsoft-365/copilot/cowork/whats-new)
- [Microsoft Copilot Credits Guide](https://www.microsoft.com/licensing/guidance/Copilot-Credits)
- [Estimator guide and limitations](docs/credit-estimator.md)

The supplied package uses WebSearch and CodeInterpreter and contains no configured custom actions. Availability, licensing, skills support, and deployment permissions must be checked in the target environment. Publishing this repository does not install the agent in Microsoft 365.

## License

[MIT](LICENSE).
