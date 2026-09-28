# Cowork session estimation

The supplied [cowork-session-estimator skill](../package/skills/cowork-session-estimator/SKILL.md) replaces the former four-driver score and Light/Medium/Heavy fuel gauge.

## Seven drivers

| Driver | Assumptions to capture |
|---|---|
| Model work | Reasoning, drafting, transformation, and review passes |
| Context volume | Source count, size, and breadth |
| Tool activity | Searches, reads, writes, and app actions |
| Runtime | Brief, extended, or long-running work |
| Retries | Corrections, failed actions, and validation reruns |
| Follow-up turns | Clarifications, approvals, and refinements |
| Executions | Sessions or repeated runs included |

Rate expected load Low, Medium, or High and explain each assumption. Define the estimation unit first. Verify current support before estimating scheduled or unattended work.

## Ranges, calibration, and currency

The skill requests a low-to-high credit range, confidence, and the main uncertainty. It provides no universal numerical conversion from these drivers to credits. Numeric estimates need a defensible basis such as comparable session observations. If none is available, disclose the missing basis instead of fabricating a range.

The supplied workflow uses comparable /cost results for calibration and describes them as aggregate session-to-date estimates. Confirm current behavior through official guidance and the target environment.

Currency is estimated credits multiplied by the organization's actual credit price or purchase-plan rate. If that rate is unavailable, leave the estimate in credits. The old fixed public price and scoring bands have been removed from this guide.

The skill's required caveat is:

> This is a planning range, not a bill. Check `/cost` after a comparable Cowork session and your Microsoft 365 Copilot Credits report for actual usage.

## References

- [Microsoft Copilot Credits Guide](https://www.microsoft.com/licensing/guidance/Copilot-Credits)
- [Microsoft Cowork What's New](https://learn.microsoft.com/en-us/microsoft-365/copilot/cowork/whats-new)

Consult these sources when applying the estimator. This repository records the supplied workflow; it does not certify current pricing, billing accuracy, or tenant availability.
