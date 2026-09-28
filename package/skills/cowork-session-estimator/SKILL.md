---
name: cowork-session-estimator
description: Invoke when a user wants to estimate, compare, or calibrate the Copilot Credit consumption and currency cost of a particular Microsoft 365 Copilot Cowork session.
---

## Purpose
Estimate a planning range for one or more Cowork sessions from the work the user expects Cowork to perform. Use this skill after Cowork is selected or whenever the user asks directly about Cowork credits or cost.

## Uses
- Agent capability: web browsing
- Agent knowledge references: Microsoft Cowork What's New; Microsoft Copilot Credits Guide

## Instructions
1. Define the estimation unit.
   - Identify whether the request covers one session, several comparable sessions, or repeated executions.
   - For scheduled, unattended, or event-driven work, first consult the official Cowork What's New reference to verify whether the requested pattern is currently supported.
   - If Cowork supports the requested pattern, include the expected executions in the estimate. If it does not, explain that the full Copilot Studio experience is the better fit and stop the Cowork estimate.

2. Gather material assumptions.
   - Capture the expected apps or data sources, approximate source count and size, requested outputs, number of actions, reasoning or review passes, expected runtime, approvals, follow-up turns, and likely retries.
   - If one missing detail could materially change the range, ask one concise question and wait for the answer. Otherwise, state reasonable assumptions and continue.

3. Decompose the session into drivers.
   - Model work: reasoning, drafting, transformation, summarization, comparison, and review passes.
   - Context volume: quantity, size, and breadth of files, email, meetings, chats, and sites retrieved.
   - Tool activity: searches, reads, writes, app interactions, and other actions.
   - Runtime: brief, extended, or long-running work.
   - Retries: corrections, failed actions, validation reruns, or alternate approaches.
   - Follow-up turns: clarifications, approvals, and refinements within the session.
   - Executions: the number of sessions or repeated runs included in the estimate.

4. Rate uncertainty and form a range.
   - Assign each driver a Low, Medium, or High expected load and state the assumption behind it.
   - Produce a low-to-high credit range rather than a single number.
   - Widen the range when source volume, tool activity, runtime, retries, or follow-up turns are uncertain.
   - Do not invent a universal conversion rate or unsupported precision.

5. Convert credits to currency only with an actual rate.
   - First present the credit range.
   - If the user provides the organization's current credit price or purchase-plan rate, calculate currency as estimated credits multiplied by that rate.
   - Otherwise, explain what rate is needed and leave the estimate in credits.

6. Calibrate and validate.
   - Consult the official Copilot Credits Guide before explaining current purchasing models or cost-planning guidance.
   - When comparable `/cost` results are available, use them to calibrate the range based on task shape, apps, source volume, actions, runtime, retries, and follow-up turns.
   - Treat `/cost` as an aggregate session-to-date estimate, not a line-item invoice.
   - Note that shared group limits may affect availability but do not change estimated consumption for the described session.

7. Present the estimate.
   - Show a concise table with Driver, Expected load, and Assumption for Model work, Context volume, Tool activity, Runtime, Retries, Follow-up turns, and Executions.
   - Then show Estimated credits, Confidence, and the main uncertainty using plain text without points, badges, fuel gauges, celebratory language, or decorative icons.
   - State: "This is a planning range, not a bill. Check `/cost` after a comparable Cowork session and your Microsoft 365 Copilot Credits report for actual usage."
   - If Chat or an Agent could fully handle the same work for less, say so briefly and directly.

## Parameters
- Task description
- Apps and data sources involved
- Approximate source count and size
- Expected outputs and actions
- Expected runtime
- Likely retries, approvals, and follow-up turns
- Number of executions
- Optional comparable `/cost` result
- Optional organization-specific credit price or purchase-plan rate

## Output
A clean Cowork session planning estimate containing assumptions by driver, a low-to-high credit range, confidence level, primary uncertainty, optional currency calculation, and calibration guidance.