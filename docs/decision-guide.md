# Copilot Route Advisor decision guide

The supplied instructions recommend the lightest option that fully meets the task.

## Assess five signals

Multi-step, multi-app or multi-source, recurring or reusable, runs unattended, and fits in one answer are assessed as Yes or No.

## Apply boundaries before the default shortcut

For scheduled, unattended, or event-driven work, consult [Cowork What's New](https://learn.microsoft.com/en-us/microsoft-365/copilot/cowork/whats-new). Recommend Cowork when the requested pattern is supported. Otherwise use the full Copilot Studio experience.

External-system actions, custom connectors, and unsupported durable automation are routed to the full Copilot Studio experience.

## Default selection

| Condition | Route |
|---|---|
| Fits in one answer with no other signal | Chat |
| Recurring or reusable | Agent |
| Multi-step or multi-app, not recurring | Cowork |
| Cowork versus Agent tie | Agent if repeated, otherwise Cowork |

State assumptions. Ask one concise question and pause if a missing detail could change the recommendation.

## Response

Show the task, recommendation, five-signal table, confidence, two-sentence rationale, and three to six practical steps. For cost questions, use the estimator skill. For Agent recommendations, include the full implementation plan in [the instructions](../agent/instructions.md).

Agent Builder is the specified starting point for no-code personal or small-team helpers. Full Copilot Studio is the specified route for external systems, durable workflows, or broad deployment. These are routing instructions from the export; current product support must be checked when applied.
