---
name: sociable-tdd
description: Use test-driven development for software features and bug fixes with fast, reliable sociable tests. Use for Red–Green–Refactor, choosing test doubles, and reviewing brittle or flaky behavior tests.
---

# Sociable TDD

Test one promised behavior through an interface its consumer uses. A single test can exercise several real collaborators. Give each test fresh state so it runs independently. Add a test for each distinct behavior or regression. Let existing tests cover helpers introduced during refactoring.

Before changing code or tests, establish what triggers the behavior, what the user or caller should observe, and which cases are in scope. Use the handoff or the user's explicit requirements for new or changed behavior. Use project requirements and tests to identify existing behavior to preserve. Resolve any open decisions about expected outcomes or scope in [Define Behavior](../define-behavior/SKILL.md) before starting TDD. If the companion skill is unavailable, carry out the Define Behavior phase by asking the user to settle those decisions and recording their answers before starting.

Once the behavior is agreed, choose the test design and implementation independently. Continue through testing, implementation, and refactoring without asking the user to approve routine choices. If you discover a decision that would change an observable outcome or expand the agreed scope, pause the affected work and return to Define Behavior. Resume TDD after the user settles the decision and the handoff is updated.

For a refactor that preserves behavior, run the relevant tests before editing and confirm they pass. If coverage is missing, first add a passing test that captures the current behavior. Rerun those same tests after the refactor. For new or corrected behavior, use the cycle below.

1. **Choose a scenario.** List the behaviors the change needs to support and turn one into a runnable test. Use the agreed behavior to set the expected outcome. Use an independent example to calculate the expected result when helpful.
2. **Red.** Run the test before implementation. Confirm it fails because the expected behavior is missing or incorrect. Fix setup or build failures and rerun it. If it passes, check whether the behavior already works or the test misses it.
3. **Green.** Make the smallest correct change. Run the focused test and relevant existing tests. Preserve the agreed behavior assertions.
4. **Refactor.** Improve the design in small steps and rerun the tests. Let the same assertions protect the behavior as internal classes and methods change.
5. **Repeat.** Return to the scenario list. Add cases covered by the agreed behavior and take the next unverified behavior through the cycle.

Assert an observable result, such as a returned value, rendered title, or durable write. Verify an interaction only when the interaction itself is part of the promise.

Use real collaborators when they keep tests fast and reliable. Control time and asynchronous completion where they affect the outcome. Use a test double at the narrowest useful boundary when a real dependency makes tests slow, unreliable, or unable to run independently.

Use a temporary probe to learn how an unfamiliar API or algorithm behaves. Record what you learned and discard the probe once it answers the question. Retain tests for lasting behavior and focused checks for integration risks.

Report the behavior verified, the test results you observed, and the reason for any new double.

## References

- For fixture isolation, measuring feedback time, or choosing a test double, read [Reliable tests and workflow](references/workflow.md).
- For edge cases, exploratory probes, deciding which integration checks to keep, or checking whether an assertion catches a plausible regression, read [Choosing tests](references/choosing-tests.md).
- For replacing assertions about internal calls or keeping tests stable through a refactor, read [Photo app example](references/photo-app.md).
