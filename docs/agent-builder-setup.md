# Agent setup

## Package source

The package/ directory contains all five files from the supplied Copilot Route Advisor.zip export, unchanged. It preserves the application and agent IDs, manifest version 1.28, declarative-agent version v1.8, and application version 1.0.4.

Run the packaging command in the README to create dist/copilot-route-advisor.zip. Use your organization's supported Microsoft 365 package deployment process and verify schema, skill support, permissions, and capabilities in the target environment before installation.

## Manual recreation

1. Create an agent in Microsoft 365 Copilot Agent Builder named **Copilot Route Advisor**.
2. Copy the description from [agent/description.md](../agent/description.md).
3. Paste the complete [instructions](../agent/instructions.md).
4. Add the four [starter prompts](../agent/starter-prompts.md).
5. Configure WebSearch and CodeInterpreter to match the export, subject to tenant policy.
6. Include [cowork-session-estimator](../package/skills/cowork-session-estimator/SKILL.md) using the skill mechanism supported by your environment.

Copying only the main instructions does not install the referenced skill. If your authoring surface cannot include skills, use a compatible package deployment surface or resolve that limitation before claiming equivalent behavior.

The export has no custom actions or private knowledge sources. Add organization-specific knowledge only when needed and with appropriate access controls.

## Acceptance checks in Microsoft 365

| Prompt or scenario | Expected behavior |
|---|---|
| Rewrite this email concisely. | Chat, with five-signal assessment and next steps |
| Compare several files and create a one-off briefing. | Cowork, assuming capabilities support the requested work |
| Turn the same weekly report into a leadership update. | Agent implementation plan |
| Run a task unattended on a schedule. | Consult current Cowork support before routing |
| Use a custom connector to update an external system. | Explain the full Copilot Studio boundary |
| Estimate credits for a Cowork session. | Invoke the skill, show seven drivers and assumptions, avoid unsupported precision |
| Convert an estimate into currency without my credit rate. | Ask for the actual rate or leave the estimate in credits |
| A material detail is missing. | Ask one concise question and pause |

Confirm that responses have no game-show points, badges, fuel gauges, or celebratory framing. Check official citations and verify skill execution, permissions, and actual session behavior in your tenant. Local packaging checks cannot prove these outcomes.
