---
name: sociable-tdd
description: Use test-driven development for software features and bug fixes with fast, reliable sociable tests. Use for Red–Green–Refactor, choosing test doubles, and reviewing brittle or flaky behavior tests.
---

# Sociable TDD

Test one promised behavior through an interface its consumer uses. A single test can exercise several real collaborators. Give each test fresh state so it runs independently. Add a test for each distinct behavior or regression. Let existing tests cover helpers introduced during refactoring.

1. **Choose a scenario.** List the behaviors the change needs to support and turn one into a runnable test. Derive the expected outcome from the requirement or an independent example.
2. **Red.** Before implementing the change, run the test and see it fail for the expected behavioral reason. If it passes, check whether the behavior already works or the test misses it.
3. **Green.** Make the smallest correct change. Run the focused test and relevant existing tests. Preserve the agreed behavior assertions.
4. **Refactor.** Improve the design in small steps and rerun the tests. Let the same assertions protect the behavior as internal classes and methods change.
5. **Repeat.** Return to the scenario list. Add cases you discovered and take the next unverified behavior through the cycle.

Assert an observable result, such as a returned value, rendered title, or durable write. Verify an interaction only when the interaction itself is part of the promise.

Use real collaborators when they keep tests fast and reliable. Control time and asynchronous completion where they affect the outcome. Use a test double at the narrowest useful boundary when a real dependency makes tests slow, unreliable, or unable to run independently.

Use a temporary probe to learn how an unfamiliar API or algorithm behaves. Record what you learned and discard the probe once it answers the question. Retain tests for lasting behavior and focused checks for integration risks.

Report the behavior verified, the test results you observed, and the reason for any new double.

## References

- For fixture isolation, measuring feedback time, or choosing a test double, read [Reliable tests and workflow](references/workflow.md).
- For edge cases, exploratory probes, or deciding which integration checks to keep, read [Choosing tests](references/choosing-tests.md).
- For replacing assertions about internal calls or keeping tests stable through a refactor, read [Photo app example](references/photo-app.md).
