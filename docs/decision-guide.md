# Route It! decision guide

## Core rule

Choose the lightest tool that fully completes the task.

```text
Is it a simple question, draft, summary, or analysis?
├─ Yes → Copilot Chat
└─ No
   └─ Will the same shaped task repeat or be reused?
      ├─ Yes → Agent Builder
      └─ No
         └─ Does it require multiple steps, apps, or actions?
            ├─ Yes → Copilot Cowork
            └─ No → Copilot Chat
```

## Five signals

| Signal | What it indicates |
|---|---|
| Multi-step | Cowork may be useful |
| Multi-app | Cowork may be useful |
| Recurring | An Agent is usually the better investment |
| Runs unattended | Cowork or a more advanced agent workflow may be needed |
| One-shot answer | Chat is usually sufficient |

## Tie breakers

- Recurring beats multi-step: build an Agent when the task has a stable, repeatable shape.
- One-off beats reusable: use Cowork when the workflow is complex but not likely to repeat.
- Simplicity wins: use Chat whenever the task can be completed well in one interaction.

## Boundaries

Agent Builder is appropriate for no-code, knowledge-grounded helpers. A scenario may require Copilot Studio rather than Agent Builder when it must connect to external systems, execute complex workflows, or serve a broad managed audience. Route It! mentions that boundary only when it is relevant.
