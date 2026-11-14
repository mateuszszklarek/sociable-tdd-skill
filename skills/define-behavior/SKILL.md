---
name: define-behavior
description: Clarify intended software behavior with the user before implementation. Use to turn feature ideas, bug reports, or refactor requests into agreed, testable scenarios and a handoff to Sociable TDD.
---

# Define Behavior

1. **Inspect the project.** Read the relevant requirements, existing behavior, and tests. Identify who uses the behavior, what triggers it, and what they should observe. For a bug, distinguish the observed result from the expected one. For a refactor, identify the behavior to preserve.
2. **Resolve open decisions.** Consider the success path, relevant failures and boundaries, and behavior that must stay the same. Ask focused questions about choices that would change the expected outcome, scope, or tests. Use existing conventions when they settle a question and are consistent with the request. Offer a recommendation when it helps the user choose. Keep asking until the material decisions are answered, delegated, or explicitly out of scope. If they are already settled, proceed directly to the handoff.
3. **Write the handoff.** State the goal and list the in-scope scenarios as conditions, actions, and observable outcomes. Capture behavior to preserve and any agreed exclusions. If a material decision remains open, summarize what is known and wait for the answer before handing off the affected work.

For implementation, include this direction in the handoff: **Use Sociable TDD. For each new or corrected behavior, verify that the test fails for the expected reason before changing production code, then make it pass, rerun the relevant tests, and refactor as needed. For a behavior-preserving refactor, establish a passing baseline and rerun the same behavior tests afterward.**

If the user asked for implementation, load the Sociable TDD skill and continue with the handoff in the same session. Find it through the host's skill discovery or in the adjacent `sociable-tdd` folder. If the user asked only to clarify behavior, or Sociable TDD is unavailable, return the handoff as a ready-to-use prompt.
