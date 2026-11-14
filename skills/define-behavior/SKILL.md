---
name: define-behavior
description: Clarify intended software behavior with the user before implementation. Use to turn feature ideas, bug reports, or refactor requests into agreed, testable scenarios and a handoff to Sociable TDD.
---

# Define Behavior

1. **Inspect the project.** Read the relevant requirements, existing behavior, and tests. Identify who uses the behavior, what triggers it, and what they should observe. For a bug, distinguish the observed result from the expected one. For a refactor, identify the behavior to preserve.
2. **Ask about unresolved behavior.** Consider the success path, relevant failures, and edge cases. Use project requirements and tests to identify behavior to preserve. Ask the user to decide any missing or conflicting details that affect what a user or caller observes or which cases are in scope. You may recommend an option, but ask the user to confirm it even if they ask for your recommendation. A suggestion or lack of a reply does not settle a decision.
3. **Write the handoff.** Once the user has stated or confirmed the new or changed behavior and its scope, list each scenario as a condition, an action, and an observable outcome. Include existing behavior to preserve and cases the user excluded. If a decision is still open, show the draft and wait for the user's answer before handing off the affected work. The user's request is enough when it already settles every decision.

For implementation, include this direction in the handoff: **Use Sociable TDD. For each new or corrected behavior, verify that the test fails for the expected reason before changing production code, then make it pass, rerun the relevant tests, and refactor as needed. For a behavior-preserving refactor, establish a passing baseline and rerun the same behavior tests afterward.**

If the user asked for implementation, continue with the handoff in the same session. If Sociable TDD is already active, return the handoff to that workflow. Otherwise, load it through skill discovery or from the adjacent `sociable-tdd` folder. If the user asked only to clarify behavior, or Sociable TDD is unavailable, return the handoff as a ready-to-use prompt.
