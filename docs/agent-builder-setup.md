# Agent Builder setup

## 1. Create the agent

Open Microsoft 365 Copilot and create an agent with Agent Builder.

Use:

- **Name:** Route It!
- **Description:** Copy from [`../agent/description.md`](../agent/description.md)
- **Icon:** 🏆 or a trophy-style custom icon

## 2. Add the instructions

Copy the complete contents of [`../agent/instructions.md`](../agent/instructions.md) into the instructions field.

If the field has a character limit in your tenant:

1. Preserve the Role, Three Options, Decision Rules, Output Format, and Guardrails.
2. Shorten examples before shortening behavioral rules.
3. Test that the five-signal scorecard and route decision remain consistent.

## 3. Add starter prompts

Add the four prompts from [`../agent/starter-prompts.md`](../agent/starter-prompts.md).

## 4. Configure knowledge and capabilities

Route It! can operate without private knowledge sources because its main job is routing.

Recommended:

- Enable web search only if your organization permits it and you want the agent to check current product documentation.
- Do not enable image generation or code interpreter unless you extend the use case.
- Optionally add your organization’s Copilot adoption guide, licensing summary, approved scenarios, and escalation contacts.

Do not upload confidential financial, security, or licensing documents unless access is appropriately governed.

## 5. Test the routing matrix

| Test prompt | Expected route |
|---|---|
| “Rewrite this email to be more concise.” | Chat |
| “Create a presentation using our files, email it to the team, and schedule a review.” | Cowork |
| “Every Friday, I turn the same report into a leadership update.” | Agent |
| “Summarize this open document.” | Chat |
| “Build a reusable HR policy question helper for my team.” | Agent |

Also test ambiguous tasks and confirm the agent asks only one clarifying question.

## 6. Validate cost language

Confirm that the agent:

- labels all numbers as estimates;
- shows the four cost drivers;
- never invents a credit total without a validated planning band;
- points users to Microsoft Cost Management and the Customer Cowork Estimator.

## 7. Publish and iterate

Start with a small audience. Review misrouted prompts, update the decision logic, and add organization-specific examples only after observing real usage.
