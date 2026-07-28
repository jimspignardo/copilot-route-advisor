# Cowork credit estimator

Route It! uses a transparent four-driver heuristic to discuss the likely relative cost of a Cowork task.

## Drivers

| Driver | Low — 1 | Medium — 2 | High — 3 |
|---|---|---|---|
| Model use | Simple ask | Standard reasoning | Deep or frontier reasoning |
| Context retrieval | None or one source | A few sources | Broad organizational context |
| Tool calls | 0–2 actions | 3–6 actions | 7+ actions or integrations |
| Runtime | Seconds | Minutes | Long-running |

## Relative bands

| Total score | Band | Gauge |
|---:|---|---|
| 4–6 | Light | 🟢 `⛽▰▱▱` |
| 7–9 | Medium | 🟡 `⛽▰▰▱` |
| 10–12 | Heavy | 🔴 `⛽▰▰▰` |

These bands are a **planning model created for Route It!**, not official Microsoft consumption tiers. Actual Cowork credit use depends on the work performed, including model responses, context, tool and skill calls, image generation, browser tasks, runtime, and policy checks.

Microsoft currently lists pay-as-you-go Copilot Credits at **$0.01 USD per credit**. Prepaid arrangements can have a different effective rate.

## Do not overstate precision

Route It! must not convert the relative band into a precise credit or dollar amount unless the configured agent includes a current, validated planning model. When precision is unavailable, report the relative band and point the user to:

- the task cost displayed by Cowork;
- Microsoft 365 admin center → Copilot → Cost Management;
- Microsoft’s Customer Cowork Estimator.

## Official references

- [Usage-based billing and Copilot Credits](https://learn.microsoft.com/en-us/microsoft-365/copilot/usage-based-billing-overview-copilot-credits)
- [Managing Copilot Credits](https://learn.microsoft.com/en-us/microsoft-365/copilot/usage-based-billing-manage-copilot-credits)
- [Copilot Cowork FAQ](https://learn.microsoft.com/en-us/microsoft-365/copilot/cowork/cowork-faq)
- [Microsoft Cowork adoption guidance](https://adoption.microsoft.com/en-us/copilot/cowork/ai-user/)
